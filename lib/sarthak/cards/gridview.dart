import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scroll_view.dart';

import '../../global_variables.dart';
import 'card_portrait.dart';

class CustomGrid extends StatefulWidget {
  CustomGrid({Key? key, required this.count}) : super(key: key);
  final int count;
  int gridCount = -1;

  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  @override
  initState() {
    super.initState();
    for (int i = 0; i < widget.count; i++) {
      gridItems.add(CardPortrait(
        image: 'https://images2.alphacoders.com/539/539380.jpg',
        name: "Brand New",
        price: "245",
        distance: "5",
        isPremium: true,
        isAd: false,
      ));
    }
    // Add listeners to this class
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
          // height: height * 0.170 * 2.9,
          // width: width * 0.250 * 3.8,
          color: Colors.white,
          margin: EdgeInsets.only(left: 10),
        ),
        GridView.builder(
          itemCount: gridItems.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            widget.gridCount = widget.gridCount + 1;
            return (index == 0 || index == 8 || index == 2)
                ? CardPortrait(
                    image: globalPremiumadData[0]['RecentAds'][index]
                        ['image_url'][0],
                    name: globalPremiumadData[0]['RecentAds'][index]['title'],
                    price: globalPremiumadData[0]['RecentAds'][index]['price'],
                    distance: "65",
                    isPremium: false,
                    isAd: false,
                  )
                : CardPortrait(
                    image: globalPremiumadData[0]['PremiumAds']
                        [widget.gridCount]['image_url'][0],
                    name: globalPremiumadData[0]['PremiumAds'][index]['title'],
                    price: globalPremiumadData[0]['PremiumAds'][index]['price'],
                    distance: "6",
                    isPremium: true,
                    isAd: false,
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
}
