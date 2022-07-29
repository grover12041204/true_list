import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scroll_view.dart';

import '../../global_variables.dart';
import '../../screens/account_settings/new_home_screen.dart';
import 'card_portrait.dart';
import 'package:http/http.dart' as http;

class CustomGrid extends StatefulWidget {
  CustomGrid({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  int premiumAdCount = -1;
  int recentAdCount = -1;
  bool isGoogleAd = true;
  int newIndex = -1;
  List storeAllId = [];
  List allstoredId = [];
  @override
  initState() {
    super.initState();
    print(widget.count);
    premiumAdCount = -1;
    recentAdCount = -1;
    isGoogleAd = true;
    newIndex = -1;
  }

  List<Widget> gridItems = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
              maxHeight: height * 0.170 * 2.9,
              maxWidth: width * 0.250 * 3.8,
              minHeight: height * 0.170),
          color: Colors.white,
          margin: EdgeInsets.only(left: 10),
        ),
        GridView.builder(
          itemCount: widget.count,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < widget.count - 1) {
              if (index % 9 == 0) {
                newIndex = -1;
              }
              newIndex += 1;
              if (newIndex % 9 == 0 || (newIndex + 1) % 9 == 0) {
                if (premiumAdCount + 1 <
                    globalPremiumadData[0]['PremiumAds'].length) {
                  premiumAdCount += 1;
                  storeAllId.add(globalPremiumadData[0]['PremiumAds']
                      [premiumAdCount]['_id']);
                } else {
                  premiumAdCount = 0;
                  storeAllId.add(globalPremiumadData[0]['PremiumAds']
                      [premiumAdCount]['_id']);
                }
              } else {
                ((newIndex + 1) % 4 == 0)
                    ? {
                        print('this is google add'),
                        storeAllId.add(index),
                      }
                    : {
                        if (recentAdCount + 1 <
                            globalPremiumadData[0]['RecentAds'].length)
                          {
                            recentAdCount += 1,
                            storeAllId.add(globalPremiumadData[0]['RecentAds']
                                [recentAdCount]['_id']),
                          }
                        else
                          {
                            recentAdCount = 0,
                            storeAllId.add(globalPremiumadData[0]['RecentAds']
                                [recentAdCount]['_id']),
                          }
                      };
              }
              ;
            } else {
              print('dfsdf');
              premiumAdCount = 0;
              recentAdCount = 0;
              isGoogleAd = true;
              newIndex = 0;
              allstoredId.clear();
              allstoredId.addAll(storeAllId);
              allstoredId.add(
                  globalPremiumadData[0]['PremiumAds'][premiumAdCount]['_id']);
              storeAllId.clear();
            }
            ;
            print(widget.count);
            print(index);
            print(allstoredId.length);
            print(storeAllId.length.toString() + 'sdfsddsfd');
            return (index == widget.count)
                ? Container()
                : (newIndex % 9 == 0 || (newIndex + 1) % 9 == 0)
                    ? InkWell(
                        onTap: () {
                          print(index);
                          print(premiumAdCount);
                          print(globalPremiumadData[0]['PremiumAds']
                              [premiumAdCount]['_id']);
                          print(storeAllId);
                          print(storeAllId.length);
                          getHomeScreen(allstoredId[index]);
                        },
                        child: CardPortrait(
                          image: globalPremiumadData[0]['PremiumAds']
                              [premiumAdCount]['image_url'][0],
                          name: globalPremiumadData[0]['PremiumAds']
                              [premiumAdCount]['title'],
                          price: globalPremiumadData[0]['PremiumAds']
                              [premiumAdCount]['price'],
                          distance: "6",
                          isPremium: true,
                          isAd: false,
                        ),
                      )
                    : ((newIndex + 1) % 4 == 0)
                        ? CardPortrait(
                            image:
                                'https://images7.alphacoders.com/885/885514.jpg',
                            name: 'google ad',
                            price: globalPremiumadData[0]['PremiumAds']
                                [premiumAdCount]['price'],
                            distance: "60",
                            isPremium: false,
                            isAd: true,
                          )
                        : InkWell(
                            onTap: () {
                              print(index);
                              print(recentAdCount);
                              print(storeAllId);
                              print(storeAllId.length);
                              getHomeScreen(allstoredId[index]);
                            },
                            child: CardPortrait(
                              image: globalPremiumadData[0]['RecentAds']
                                  [recentAdCount]['image_url'][0],
                              name: globalPremiumadData[0]['RecentAds']
                                  [recentAdCount]['title'],
                              price: globalPremiumadData[0]['RecentAds']
                                  [recentAdCount]['price'],
                              distance: "60",
                              isPremium: false,
                              isAd: false,
                            ),
                          );
          },
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(15),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ],
    );
  }

  Map<String, String> requestHeaders = {
    'Authorization': 'Bearer ${globalToken}',
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  getHomeScreen(String id) async {
    try {
      print('inside block');
      var response = await http.post(
          Uri.parse(
            "https://deep-nucleus1.azurewebsites.net/api/v1/get-particular-ad-details",
          ),
          body: jsonEncode({
            "ad_id": id,
          }),
          headers: requestHeaders);
      var decodeJsom = jsonDecode(response.body);

      globalGetHomeScreen = decodeJsom;
      print(decodeJsom);
      print(decodeJsom['message']);
      print(decodeJsom['AdDetails'][0]['image_url']);
      // print(globalGetHomeScreen['image_url'][0]);
      // print(decodeJsom[0]['PremiumAds']);
      // print('data');
      // // return decodeJsom;
      // print(globalPremiumadData[0]['PremiumAds'][0]['_id']);
      // print(globalPremiumadData[0]);
      // print(globalPremiumadData[0]['RecentAds'][0]['image_url'][0]);
      // print(globalPremiumadData[0]['PremiumAds'][0]['image_url'][0]);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewHomeScreen(),
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
