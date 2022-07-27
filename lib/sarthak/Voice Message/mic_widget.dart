// import 'package:avatar_glow/avatar_glow.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:highlight_text/highlight_text.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// class MicWidget extends StatefulWidget {
//   const MicWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MicWidget> createState() => _MicWidgetState();
// }
//
// class _MicWidgetState extends State<MicWidget> {
//
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _text = "Press the button and start speaking";
//   double _confidence = 1.0;
//   // final Map<String,HighlightedWord> _highlights = {
//   //   'flutter' : HighlightedWord(
//   //     onTap: () => print("Flutter"),
//   //     textStyle: GoogleFonts.poppins(
//   //       color: Colors.blue,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'voice' : HighlightedWord(
//   //     onTap: () => print("voice"),
//   //     textStyle: GoogleFonts.poppins(
//   //       color: Colors.green,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'subscribe' : HighlightedWord(
//   //     onTap: () => print("subscribe"),
//   //     textStyle: GoogleFonts.poppins(
//   //       color: Colors.red,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'like' : HighlightedWord(
//   //     onTap: () => print("like"),
//   //     textStyle: GoogleFonts.poppins(
//   //       color: Colors.blueAccent,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   //   'comment' : HighlightedWord(
//   //     onTap: () => print("comment"),
//   //     textStyle: GoogleFonts.poppins(
//   //       color: Colors.green,
//   //       fontWeight: FontWeight.bold,
//   //     ),
//   //   ),
//   // };
//
//   void _listen() async{
//     if(!_isListening){
//       bool available = await _speech.initialize(
//         onStatus: (val) => print("onStatus: $val"),
//         onError: (val) => print("onError: $val")
//       );
//       if(available){
//         setState((){
//           _isListening = true;
//         });
//         _speech.listen(
//           onResult: (val) => setState((){
//             _text = val.recognizedWords;
//             if(val.hasConfidenceRating && val.confidence > 0)
//               {
//                 _confidence = val.confidence;
//               }
//           }),
//         );
//       }
//
//     }
//     else
//       {
//         setState((){
//           _isListening = false;
//         });
//         _speech.stop();
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_text)));
//       }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _speech = stt.SpeechToText();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Confidence: ${(_confidence * 100).toStringAsFixed(1)}%",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.black,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AvatarGlow(
//         animate: true,
//         glowColor: Theme.of(context).primaryColor,
//         endRadius: 75,
//         repeat: true,
//         duration: Duration(milliseconds: 2000),
//         repeatPauseDuration: Duration(milliseconds: 100),
//         child: FloatingActionButton(
//           onPressed: _listen,
//           child: Icon(_isListening ? Icons.mic : Icons.mic_none),
//         ),
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Container(
//           padding: EdgeInsets.fromLTRB(30, 30, 30,150),
//           child: Text(
//             _text,
//             style: GoogleFonts.poppins(color: Colors.white),
//           )
//         ),
//       ),
//     );
//   }
// }

// Widget buildStart(){
//   final isRecording = false;
//   final icon = isRecording == true ? Icons.stop  : Icons.mic;
//   final text = isRecording  == true ? "STOP" : "START";
//   final primary = isRecording == true ? Colors.red : Colors.white;
//   final onPrimary = isRecording == true ? Colors.white : Colors.black;
//   return ElevatedButton.icon(
//       onPressed: () async{
//
//       },
//     style: ElevatedButton.styleFrom(
//       minimumSize: Size(175,50),
//       primary: primary,
//       onPrimary: onPrimary
//     ),
//       icon: Icon(icon),
//       label: Text(text,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),),
//   );
// }


import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class MicWidget extends StatefulWidget {
  MicWidget({Key? key}) : super(key: key);

  @override
  _MicWidgetState createState() => _MicWidgetState();
}

class _MicWidgetState extends State<MicWidget> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_lastWords)));
    Navigator.pop(context,[_lastWords]);
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  // If listening is active show the recognized words
                  _speechToText.isListening
                      ? '$_lastWords'
                  // If listening isn't active but could be tell the user
                  // how to start it, otherwise indicate that speech
                  // recognition is not yet ready or not supported on
                  // the target device
                      : _speechEnabled
                      ? 'Tap the microphone to start listening...'
                      : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
        // If not yet listening for speech start, otherwise stop
        _speechToText.isNotListening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}
