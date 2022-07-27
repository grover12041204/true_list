import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_screens/post_finish_screen.dart';

class PostPriceScreen extends StatefulWidget {
  const PostPriceScreen({Key? key}) : super(key: key);

  @override
  State<PostPriceScreen> createState() => _PostPriceScreenState();
}

class _PostPriceScreenState extends State<PostPriceScreen> {
  bool emailStatus = false;
  TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appColors.darkBlue,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.060),
          Row(
            children: [
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/icons/left_arrow.png',
                  height: 24,
                ),
              ),
              Text(
                'Price',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Spacer(),
              Text(
                'Cancel',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(
                width: 19,
              )
            ],
          ),
          Flexible(
            child: Container(
              // height: 700
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  )),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Image.asset('assets/icons/post_current_bar.png'),
                          Image.asset('assets/icons/post_current_bar.png'),
                          Image.asset('assets/icons/post_current_bar.png'),
                          Image.asset('assets/icons/post_bar2.png'),
                        ]),
                        TableRow(children: [
                          SizedBox(height: 15),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ]),
                        TableRow(children: [
                          Center(child: Text("1. Photo")),
                          Center(child: Text("2. Details")),
                          Center(child: Text('3. Price')),
                          Center(child: Text('4. Finish')),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 100,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: appColors.postBackgroundColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          '₹ ',
                          style: TextStyle(fontSize: 34, color: Colors.black),
                        ),
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: priceController,
                            style: TextStyle(color: Colors.black, fontSize: 34),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Amount',
                              counterText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text(
                        'Is this negotiable?',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      Spacer(),
                      Container(
                        child: FlutterSwitch(
                          inactiveToggleBorder:
                              Border.all(width: 3, color: Colors.black),
                          inactiveColor: Colors.white,
                          switchBorder:
                              Border.all(width: 3, color: Colors.black),
                          activeText: '',
                          inactiveText: '',
                          activeColor: Colors.black,
                          activeToggleColor: Colors.white,
                          inactiveToggleColor: Colors.white,
                          width: 55,
                          height: 30,
                          toggleSize: 25,
                          value: emailStatus,
                          borderRadius: 70,
                          showOnOff: true,
                          onToggle: (val) {
                            setState(() {
                              emailStatus = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20)
                    ],
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        PostGlobalData.price = priceController.text;
                        print(PostGlobalData.price);
                        PostGlobalData.priceNegotiable = emailStatus.toString();
                        print(PostGlobalData.priceNegotiable + '  Rahul');
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => postFinishScreen(),
                        ),
                      );
                    },
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: appColors.darkBlue,
                        ),
                        child: Text(
                          'Save & Continue',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(height: 45)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
