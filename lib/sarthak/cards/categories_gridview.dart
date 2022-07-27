import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/scroll_view.dart';

import 'card_portrait.dart';
import 'card_portrait_2.dart';

class CategoryGridView extends StatefulWidget {
  CategoryGridView({Key? key, required this.count, required this.row}) : super(key: key);
  final int count;
  final int row;

  @override
  State<CategoryGridView> createState() => _CategoryGridViewState();
}

class _CategoryGridViewState extends State<CategoryGridView> {
  List<String> imageNames = List.generate(17, (index) {
    if(index% 3 == 0){
      return 'background';
    }
    else if(index % 3 == 1) {
      return 'ad';
    }
    else {
      return 'grafiti';
    }
  });

  @override
  initState() {
    super.initState();
    for(int i = 0 ; i < widget.count ; i++)
    {
      gridItems.add(CardPortrait2(name: "Brand New",imageName: imageNames[widget.row * 3 + i],));
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
              maxHeight: height * 0.170 * 1,
              maxWidth: width * 0.250 * 2,
              minHeight: height * 0.170
          ),
          // height: height * 0.170 * 2.9,
          // width: width * 0.250 * 3.8,
          color: Colors.white,
          margin: EdgeInsets.only(left: 10),
        ),
        GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          // itemCount: 3,
          shrinkWrap: true,
          childAspectRatio: 4.5/6,
          // itemBuilder: (context,index){
          //   return CardPortrait2(name: "Posh Villa", price: "345", distance: "65", isPremium: true,isAd: false,imageName: imageNames[widget.row * 3],);
          // },
          children: gridItems,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(5),
          crossAxisCount: 3,
        ),
      ],
    );
  }
}
