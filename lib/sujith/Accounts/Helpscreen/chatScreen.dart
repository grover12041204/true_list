import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:true_list/sujith/Accounts/Helpscreen/chatMessage.dart';
import '../../Models/Constants.dart';

//import cloud store
// import 'package:cloud_firestore/cloud_firestore.dart';
late Socket socket;

final _controller = TextEditingController();

class chatscreen extends StatefulWidget {
  const chatscreen({Key? key}) : super(key: key);

  @override
  State<chatscreen> createState() => _chatscreenState();
}

class _chatscreenState extends State<chatscreen> {
  // CollectionReference user = FirebaseFirestore.instance.collection('users');
  //initialize socket object

// void initializeSocket() {
//       socket =
//           io("https://deep-nucleus1.azurewebsites.net/", <String, dynamic>{
//         "transports": ["websocket"],
//         "autoConnect": false,
//       });
//       socket.connect();  //connect the Socket.IO Client to the Server

//       //SOCKET EVENTS
//       // --> listening for connection
//       socket.on('connect', (data) {
//         print(socket.connected);
//       });

//       //listen for incoming messages from the Server.
//       socket.on('message', (data) {
//        print(data); //
//       });

//       //listens when the client is disconnected from the Server
//       socket.on('disconnect', (data) {
//         print('disconnect');
//       });
//   }

  postDataServer() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await http.post(
        Uri.parse(
          "https://deep-nucleus1.azurewebsites.net/api/createHelp",
        ),
        body: jsonEncode({
          "phone_number": "1234567890",
          "title": "Testing",
          "description": "Test description",
          "attachment": "image",
          "message": {"sender_message": "hey", "replied_mssage": "yep"}
        }),
        headers: requestHeaders);
    print('working');
    var decodeJsom = jsonDecode(response.body);
    print(decodeJsom);
  }

  @override
  void initState() {
    //initailize socket object
    print("Function Called");
    postDataServer();

    // initializeSocket();
    super.initState();
  }

  @override
  // void dispose() {
  //   socket.disconnect();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Account - Help'),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: appBackGroundcolor,
              //height: 100.h,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.h),
                        topRight: Radius.circular(3.h),
                      ),
                    ),
                    height: 89.h,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: demeChatMessage.length,
                              itemBuilder: ((context, index) {
                                return Message(message: demeChatMessage[index]);
                              })),
                        ),
                        chatTextField()
                      ],
                    ),
                    // child: Stack(
                    //   children: [
                    //     ListView.builder(
                    //       itemCount: demeChatMessage.length,
                    //       itemBuilder: ((context, index)  {
                    //        return Message(message: demeChatMessage[index]);
                    //        } )),

                    //   chatTextField()
                    //   ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class chatTextField extends StatelessWidget {
  const chatTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 7.h,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: SafeArea(
          child: Row(
            children: [
              SizedBox(
                width: 3.w,
              ),
              Icon(Icons.sentiment_satisfied_alt_outlined),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Type message",
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) async {
                    _controller.clear();
                    // socket.emit('message', value);
                  },
                ),
              ),
              Icon(Icons.attach_file),
              SizedBox(
                width: 3.w,
              ),
              Icon(Icons.mic_rounded),
              SizedBox(
                width: 3.w,
              ),
            ],
          ),
        ));
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!message.isSender) ...[
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("images/customer.png"),
          )
        ],
        SizedBox(
          width: 1.w,
        ),
        TextMessage(message: message),
        if (message.isSender) ...[
          SizedBox(
            width: 1.w,
          ),
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage("images/employee.jpg"),
          )
        ],
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 2.h),
        constraints: BoxConstraints(maxWidth: 60.w),
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
        decoration: message.isSender
            ? BoxDecoration(
                color: appBackGroundcolor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.h),
                  topLeft: Radius.circular(2.h),
                  bottomLeft: Radius.circular(2.h),
                ),
                boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ])
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(2.h),
                  topLeft: Radius.circular(2.h),
                  bottomRight: Radius.circular(2.h),
                ),
                boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ]),
        child: Column(
          children: [
            if (!message.isSender)
              Text(
                "Problem in Acessing",
                style: TextStyle(
                    color: appBackGroundcolor, fontWeight: FontWeight.bold),
              ),
            Text(
              message.text,
              style: TextStyle(
                  color: message.isSender ? Colors.white : Color(0xFFF838383)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "7:25 PM",
                  style: TextStyle(color: Colors.grey, fontSize: 3.w),
                ),
              ],
            )
          ],
        ));
  }
}
