import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:true_list/global_variables.dart';
import 'package:true_list/sarthak/Home/home_screen.dart';

class checkiingButton extends StatefulWidget {
  const checkiingButton({Key? key}) : super(key: key);

  @override
  State<checkiingButton> createState() => _checkiingButtonState();
}

class _checkiingButtonState extends State<checkiingButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          _jsonData(context);
        },
        child: Container(
          width: 100,
          alignment: Alignment.center,
          height: 60,
          color: Colors.amber,
          child: Text('Check Api'),
        ),
      )),
    );
  }

  Map<String, String> requestHeaders = {
    // 'Authorization':
    //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX3Bob25lTnVtYmVyIjoiOTQ2MjQ0NTg5MyIsInVzZXJfSUQiOiI2MmRhNDNjYzE4MDkxNDZjMDRkM2UwZTgiLCJpYXQiOjE2NTg0NzY3MjIsImV4cCI6MTY1ODUxOTkyMn0.I48tRW_ka0CWvkKlKxkRZuI-dpiIA_XCvYRRBCWqlqk',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  _jsonData(BuildContext context) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/v1/home?lat=26.898803&lng=78.390452&maxDistance=2000",
          ),
          headers: requestHeaders);
      var decodeJsom = jsonDecode(response.body);

      globalPremiumadData = decodeJsom;
      print(decodeJsom);
      print(decodeJsom[0]['PremiumAds']);
      print('data');
      // return decodeJsom;
      print(globalPremiumadData[0]['PremiumAds'][0]['_id']);
      print(globalPremiumadData[0]);
      print(globalPremiumadData[0]['RecentAds'][0]['image_url'][0]);
      print(globalPremiumadData[0]['PremiumAds'][0]['image_url'][0]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      print('not working');
      print(e);
      print('Grover is hungry');
      // return e;
    }
  }
}
