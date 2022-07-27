import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:true_list/sarthak/Voice%20Message/mic_widget.dart';
import 'package:true_list/sarthak/dbHelper/MongoDbModel.dart';
import 'package:uuid/uuid.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'cards/chat_message.dart';
import 'dbHelper/mongodb.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String title = "IPhone for Sale";
  String status = "Active";
  String time_elapsed = "2 hrs ago";
  TextEditingController _textEditingController = TextEditingController();
  ScrollController listViewController = ScrollController();
  String imageUrl = "";
  late String fileName;
  late var uploadTask;

  File? image;
  Future uploadImage() async {
    fileName = Uuid().v1();
    var ref = FirebaseStorage.instance.ref().child("$fileName.jpg");
    uploadTask = await ref.putFile(image!);
    if (uploadTask != null) {
      print("Uploaded image successfully");
    }
    imageUrl = await uploadTask.ref.getDownloadURL();
  }

  // Future getimage() async{
  //   imageUrl = await uploadTask.ref.getDownloadURL();
  //   print(imageUrl);
  // }
  Future pickImageGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final imageTemporary = File(pickedImage.path);
      setState(() {
        image = imageTemporary;
        uploadImage();
      });
    } on PlatformException catch (e) {
      print("Failed to pick up image: $e");
    }
  }

  void scrollDown() {
    listViewController.animateTo(
        listViewController.position.maxScrollExtent + 100,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);
  }

  String new_text = "";
  // List<Map<String,String>> messages_backend = List.empty(growable: true);
  List<ChatMessage> messages = [
    ChatMessage(
        messageContent: "Hello, Will", messageType: "receiver", image: null),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        image: null),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        image: null),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        image: null),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        image: null),
    ChatMessage(
        messageContent: "Hello, Will", messageType: "receiver", image: null),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        image: null),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        image: null),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        image: null),
    ChatMessage(
        messageContent: "Is there any thing wrong?",
        messageType: "sender",
        image: null),
    ChatMessage(
        messageContent: "Hello, Will", messageType: "receiver", image: null),
    ChatMessage(
        messageContent: "How have you been?",
        messageType: "receiver",
        image: null),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender",
        image: null),
    ChatMessage(
        messageContent: "ehhhh, doing OK.",
        messageType: "receiver",
        image: null),
    ChatMessage(
      messageContent: "Is there any thing wrong?",
      messageType: "sender",
      image: null,
    ),
    ChatMessage(
        messageContent: "So how was your day? You want to tell me about it?",
        messageType: "receiver",
        image: null),
  ];

  List<String?> imageUrls = List.empty(growable: true);

  Future<void> insertData() async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id,
        messageContent: imageUrl == "" ? new_text : "",
        messageType: "sender",
        imageUrl: imageUrl == "" ? null : imageUrl);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Inserted ID" + _id.$oid)));
  }

  Future<void> insertMulipleData() async {
    List<MongoDbModel> data = List.empty(growable: true);
    for (int i = 0; i < messages.length; i++) {
      var _id = M.ObjectId();
      // print("ID ${i + 1} : $_id");
      data.add(MongoDbModel(
          id: _id,
          messageContent: messages[i].messageContent,
          messageType: messages[i].messageType,
          imageUrl: imageUrls[i]));
    }
    // var _id = M.ObjectId();
    // final data = [MongoDbModel(id: _id, messageContent: "Waah bhai waah", messageType: "sender"),];
    var result = await MongoDatabase.insertMultiple(data);
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Inserted ID" + _id.$oid)));
  }

  // Widget CustomImage(){
  //   return  Container(
  //     height: 200,
  //     width: 500,
  //     decoration: BoxDecoration(
  //       boxShadow: [
  //         BoxShadow(color: Colors.black.withOpacity(0.2),blurRadius: 1,spreadRadius: 1,offset: Offset(4,4)),
  //       ],
  //       borderRadius: BorderRadius.circular(15),
  //       // color: Colors.white,
  //     ),
  //     padding: EdgeInsets.all(16),
  //     child: Image.file(image!,height: 100,width: 100,fit: BoxFit.cover,),
  //     // child: Image.network("https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg",height: 100,width: 100,fit: BoxFit.cover,),
  //   );
  // }

  // _sendMessage(){
  //  _socket.emit('chat',{
  //       "messageContent": "Wow",
  //       "messageType": "sender",
  //       "imageUrl": "image Url"
  //   });
  // }

  // late IO.Socket _socket;
  //  IO.Socket _socket = IO.io("https://deep-nucleus1.azurewebsites.net/",IO.OptionBuilder().setTransports(['websocket']).disableAutoConnect().build());
  //  _connectSocket(){
  //    _socket.connect();
  //    print(_socket.connected);
  //   _socket.onConnect((data) => print("Connection Established"));
  //   _socket.onConnectError((data) => print("Connect Error : $data"));
  //   _socket.onDisconnect((data) => print("Socket IO server disconnected"));
  // }
  // @override
  //  void initState() {
  //    // TODO: implement initState
  //    super.initState();
  //    _connectSocket();
  //  }

  // late Socket socket; //initalize the Socket.IO Client Object
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initializeSocket(); //--> call the initializeSocket method in the initState of our app.
  // }
  //
  // @override
  // void dispose() {
  //   socket.disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
  //   super.dispose();
  // }
  //
  // void initializeSocket() {
  //   socket =
  //       io("https://deep-nucleus1.azurewebsites.net/api/v1/chats", <String, dynamic>{
  //         "transports": ["websocket"],
  //         "autoConnect": false,
  //       });
  //   print("Socket: $socket");
  //   var res = socket.connect();  //connect the Socket.IO Client to the Server
  //   print("Res: ${res.connected}");
  //   print(socket.connected);
  //
  //   //SOCKET EVENTS
  //   // --> listening for connection
  //   socket.on('connect', (data) {
  //     print(socket.connected);
  //   });
  //
  //   //listen for incoming messages from the Server.
  //   socket.on('message', (data) {
  //     print(data); //
  //   });
  //
  //   //listens when the client is disconnected from the Server
  //   socket.on('disconnect', (data) {
  //     print('disconnect');
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialiseSocket();
  }

  // Dart client
  //      try {
// print("step 1");
// IO.Socket socket = IO.io('http://localhost:3000',
//     IO.OptionBuilder().setTransports(['websocket']).build());

// socket.on('connect', (_) {
//   print('connect: ${socket.id}');
//   socket.emit('process1', json.encode(_req));
// });

// socket.on('progress', (data) => print(data));
// socket.onDisconnect((_) {
//   print('disconnect');
//   _finished = true;
// });
// } catch (e) {
//   print(e);
//   print("error");
// }
// print("step 2");
  void initialiseSocket() {
    // IO.Socket socket = IO.io(
    //     "http://localhost:3000/",
    //     IO.OptionBuilder()
    //         .setTransports(['websocket'])
    //         .disableAutoConnect() // for Flutter or Dart VM
    //         // disable auto-connection
    //         .setExtraHeaders({'foo': 'bar'}) // optional
    //         .build());
    // print('i am inside');
    // print(socket.connected);
    // print('checked');
    // IO.Socket socket = IO.io('http://localhost:3000', <String, dynamic>{
    //   'transports': ['websocket'],
    //   'extraHeaders': {'foo': 'bar'} // optional
    // });
    //  https://deep-nucleus1.azurewebsites.net/
    IO.Socket socket = IO.io(
        "http://localhost:3000/",
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.connect();
    print(socket.id);
    socket.emit('/msg', 'test');
    socket.onConnect((_) {
      print(socket.connected);
      socket.connect();
    });

    // print(socket.connected);

    // IO.Socket socket = IO.io(
    //     "https://deep-nucleus1.azurewebsites.net/",
    //     IO.OptionBuilder()
    //         .setTransports(['websocket']) // for Flutter or Dart VM
    //         .disableAutoConnect() // disable auto-connection
    //         .setExtraHeaders({'foo': 'bar'}) // optional
    //         .build());
    // socket.connect();
    // print(socket.id);
    // socket.emit('/msg', 'test');
    // socket.onConnect((_) {
    //   print(socket.connected);

    //   print('connect');
    //   // socket.emit('msg', 'test');
    // });
  }
  // print('im inside the socket');
  // socket.on('connect', (_) {
  //   print('connect');
  //   print(socket.connected);
  //   socket.emit('msg', 'test');
  // });
  // socket.o n('message', (data) {
  //   print(data); //
  // });
  // socket.on('disconnect', (data) {
  //   print('disconnect');
  // });
  // socket.on('event', (data) => print(data));
  // socket.on('disconnect', (_) => print('disconnect'));
  // socket.on('fromServer', (_) => print(_));

  //  void initializeSocket() {
  //    print("HAHA");
  //    socket =
  //        io("https://deep-nucleus1.azurewebsites.net/api/v1/chats", <String, dynamic>{
  //          "transports": ["websocket"],
  //          "autoConnect": false,
  //        });
  //    var res = socket.connect();  //connect the Socket.IO Client to the Server
  //
  //    //SOCKET EVENTS
  //    // --> listening for connection
  //    socket.onConnect((_){
  //      print("Connected to socket io");
  //    });
  //
  //    //listen for incoming messages from the Server.
  //    socket.on('message', (data) {
  //      print(data); //
  //    });
  //
  //    //listens when the client is disconnected from the Server
  //    socket.on('disconnect', (data) {
  //      print('disconnect');
  //    });
  //  }
  //
  //  @override
  //  void initState() {
  //    // TODO: implement initState
  //    super.initState();
  //    // _socket = IO.io("https://deep-nucleus1.azurewebsites.net/api/v1/chats",IO.OptionBuilder().setTransports(['websocket']).setQuery({"username" : "A"}).build());
  //    // initializeSocket();
  //    _connectSocket();
  //    for(int i = 0 ; i < messages.length ; i++)
  //      {
  //        imageUrls.add(null);
  //      }
  //  }

  // @override
  // void dispose() {
  //   _socket.disconnect(); // --> disconnects the Socket.IO client once the screen is disposed
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // var status_bar_height = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      backgroundColor: HexColor("#1F2A4A"),
      body: SafeArea(
        child: Container(
          // height: currentHeight,
          width: width,
          constraints:
              BoxConstraints(maxHeight: double.infinity, minHeight: height),
          child: ListView(
            shrinkWrap: true,
            // clipBehavior: Clip.none,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 20,
                      ),
                      onTap: () {},
                    ),
                    Container(
                        width: height * 0.08,
                        height: width * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg")))),
                    // SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          children: [
                            Text(
                              status,
                              style: GoogleFonts.poppins(
                                  color: HexColor("#D0D0D0"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              " " + time_elapsed,
                              style: GoogleFonts.poppins(
                                  color: HexColor("#D0D0D0"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: width * 0.25,
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                width: double.maxFinite,
                height: height * 0.850,
                decoration: BoxDecoration(
                  color: HexColor("#F3F4F8"),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
                ),
                padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Stack(
                  children: <Widget>[
                    ListView.builder(
                      controller: listViewController,
                      itemCount: messages.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 70),
                      // physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return (messages[index].messageType == "sender")
                            ? messages[index].messageContent == ""
                                ?
                                // FutureBuilder(
                                //   future: uploadImage(),
                                //     builder: (context,snapshot){
                                //       if(snapshot.connectionState == ConnectionState.done)
                                //         {
                                //           print("Snapshotdata: ${snapshot.data}");
                                //           return Container(
                                //             padding: EdgeInsets.only(right: 10,bottom: 5),
                                //             alignment: Alignment.topRight,
                                //             height: 100,
                                //             width: 250,
                                //             child: Image.network((imageUrl.length < 10) ? "https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg" : imageUrl,width: 250,height: 100,fit: BoxFit.scaleDown,),
                                //           );
                                //         }
                                //           return Center(child: CircularProgressIndicator(),);
                                //
                                //     },
                                // )
                                Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.topRight,
                                    height: 100,
                                    width: 100,
                                    // color: Colors.white,
                                    // child: FadeInImage(image:  NetworkImage(imageUrl,), placeholder: NetworkImage("https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg"),),
                                    child: Image.file(
                                      messages[index].image!,
                                      width: 150,
                                      height: 100,
                                    ),
                                    // child: Image.file(messages[index].image!),
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        width: width * 0.4,
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.2),
                                                    blurRadius: 1,
                                                    spreadRadius: 1,
                                                    offset: Offset(4, 4)),
                                              ],
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                  bottomLeft:
                                                      Radius.circular(15)),
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.all(16),
                                            child: Text(
                                              messages[index].messageContent,
                                              style: GoogleFonts.poppins(
                                                  color: HexColor("#1F2A4A"),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                              padding: EdgeInsets.zero,
                                              margin: EdgeInsets.zero,
                                              width: height * 0.08,
                                              height: width * 0.08,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          "https://cdn.dribbble.com/users/5534/screenshots/14230133/media/e2f853f8232acad78bf143c32f2f3a04.jpg")))),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 40, top: 24),
                                            child: Container(
                                              height: 8,
                                              width: 8,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.green,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                          padding: EdgeInsets.zero,
                                          margin: EdgeInsets.zero,
                                          width: height * 0.08,
                                          height: width * 0.08,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "https://i.pinimg.com/736x/8f/4e/bf/8f4ebf750645ad42c1d8bfb930d19803.jpg")))),
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 40, top: 24),
                                        child: Container(
                                          height: 8,
                                          width: 8,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10, bottom: 10),
                                    width: width * 0.4,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                                offset: Offset(4, 4)),
                                          ],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(15)),
                                          color: HexColor("#1F2A4A"),
                                        ),
                                        padding: EdgeInsets.all(16),
                                        child: Text(
                                          messages[index].messageContent,
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 10, bottom: 10, top: 10, right: 10),
                        height: 66,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                if (FocusManager
                                        .instance.primaryFocus!.hasFocus ==
                                    false)
                                  FocusManager.instance.primaryFocus!
                                      .requestFocus();
                              },
                              child: Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  // borderRadius: BorderRadius.circular(30),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(
                                  "assets/images/smile.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                autofocus: true,
                                controller: _textEditingController,
                                onSubmitted: (value) {
                                  imageUrl = "";
                                  image = null;
                                  if (value != "" && imageUrl == "") {
                                    setState(() {
                                      new_text = _textEditingController.text;
                                      messages.add(ChatMessage(
                                          messageContent: new_text,
                                          messageType: "sender",
                                          image: null));
                                      insertData();
                                      imageUrls.add(null);
                                      _textEditingController.clear();
                                      scrollDown();
                                    });
                                  }
                                },
                                onTap: () {
                                  scrollDown();
                                },
                                decoration: InputDecoration(
                                    hintText: "Write a message...",
                                    hintStyle: GoogleFonts.poppins(
                                        color: HexColor(("#616161")),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            GestureDetector(
                              child: Icon(Icons.attach_file,
                                  color: Colors.grey, size: 25),
                              onTap: () async {
                                await pickImageGallery();

                                if (image != null) {
                                  messages.add(ChatMessage(
                                      messageContent: "",
                                      messageType: "sender",
                                      image: image));
                                  print("Image: $image");
                                }
                                setState(() {});
                                await uploadImage();
                                if (imageUrl != "") {
                                  imageUrls.add(imageUrl);
                                  insertData();
                                  print("Image Url: $imageUrl");
                                }
                                scrollDown();

                                // imageUrl = "";
                                for (int i = 0; i < messages.length; i++) {
                                  print(
                                      "Message ${i + 1} : ${messages[i].messageContent} , ${imageUrls[i]}");
                                }
                              },
                            ),
                            SizedBox(
                              width: 13,
                            ),
                            GestureDetector(
                              child: Image.asset("assets/images/mic.png"),
                              onTap: () async {
                                // Navigator.pushNamed(context, '/mic_widget');
                                var res = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MicWidget()));
                                if (res != null) {
                                  setState(() {
                                    _textEditingController.text =
                                        res[0] as String;
                                  });
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
