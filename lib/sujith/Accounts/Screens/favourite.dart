// import 'dart:convert';

// import 'package:depp_nucleus/Accounts/MyAds/sellingTab.dart';
// import 'package:depp_nucleus/Models/Constants.dart';
// import 'package:depp_nucleus/ad_Helper/ad_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:sizer/sizer.dart';
// import 'package:http/http.dart' as http;

// class favourite extends StatefulWidget {
//   const favourite({Key? key}) : super(key: key);

//   @override
//   State<favourite> createState() => _favouriteState();
// }

// class _favouriteState extends State<favourite> {

//   static final _kAdIndex = 3;
//   BannerAd? _ad;

//   bool istrue = false; 
//   int x = 0;

//   List data = [
//     // true,
//     false,
//     false,
//     true,
//     false,
//     true,
//     false
//   ];

//   @override
//   List bools = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     postData();
//     for(int i =0;i<data.length ;i++){
//       bools.add(false);
//     }
//     adload();
    
//   }
//   //dispose
//   @override
//   void dispose() {
//     _ad?.dispose();

//   super.dispose();
//   }

//   //int length = data.length;

//   adload(){
//     BannerAd(
//     adUnitId: AdHelper.bannerAdUnitId,
//     size: AdSize.banner,
//     request: AdRequest(),
//     listener: BannerAdListener(
//       onAdLoaded: (ad) {
//         setState(() {
//           _ad = ad as BannerAd;
//         });
//       },
//       onAdFailedToLoad: (ad, error) {
//         // Releases an ad resource when it fails to load
//         ad.dispose();
//         print('Ad load failed (code=${error.code} message=${error.message})');
//       },
//     ),
//   ).load();
//   }
  

//   postData() async{
//     const url = 'https://deep-nucleus1.azurewebsites.net/api/v1/favouriteAds';
//     final response = await http.post(
//         Uri.parse(url));
//         var decodeJsom = jsonDecode(response.body);
//       print(decodeJsom);
//   }

//   @override
//   Widget build(BuildContext context) {
//     var favouritetextColor = Color(0xfff616161);
//     return Scaffold(
//       appBar:AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: (){
//            // Navigator.pop(context);
//           },
//         ),
//         title: Text("Favourite",),
//         backgroundColor: appBackGroundcolor,
//         elevation: 0,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.filter),
//             onPressed: (){},
//           ),
//          ],
//       ),
//       body:  Container(
//         //height: 100.h,
//         color: appBackGroundcolor,
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 //height: 88.5.h,
//                 decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(3.h),
//                    topRight: Radius.circular(3.h),
//                  ),
//                ),
//                //height: 89.h,
//                child: Padding(
//                  padding: EdgeInsets.symmetric(horizontal: 2.w),
//                  child: Column(
//                  children: [
//                       SizedBox(height: 3.h,),
//                     //topContent
//                       Container(
//                         height: 10.h,
//                         color: Colors.blue,
//                         child: Center(
//                           child: Text("Top Content"),
//                         ),
//                       ),
//                       SizedBox(height: 1.h,),
                    
//                      Expanded(child: ListView.builder(
//                         itemCount: data.length + (_ad != null ? 1 : 0),
//                         itemBuilder: (BuildContext context,index){
//                           print(index);
//                         if(_ad!=null && index == _kAdIndex){
//                            // i = index;
//                             return Container(
//                             width: _ad!.size.width.toDouble(),
//                             height: 7.h,
//                             alignment: Alignment.center,
//                             child: AdWidget(ad: _ad!),
//                            );
//                           }else{
//                             //Get adjusted item index from _getDestinationItemIndex()
//                             // print((data.length / 2).toInt());
//                             final adjustedIndex = _getDestinationItemIndex(index);

//                             return Container(
//                             margin: EdgeInsets.symmetric(vertical: 3.w),
//                             height: 15.h,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                             borderRadius: BorderRadius.all(Radius.circular(0.5.h)),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 offset: Offset(0.0, 1.0), //(x,y)
//                                 blurRadius: 6.0,
//                               ),
//                             ],
//                             ),
//                             child: Stack(
//                               children: [
//                                 Container(
//                                   //height: 14.h,
//                                   //color: Colors.blue,
//                                   child:Row(
//                                   children: [
//                                    //image container
//                                     Container(
//                                       height: MediaQuery.of(context).size.height,
//                                       width: 28.w,
//                                       decoration: BoxDecoration(
//                                         color: Colors.grey,
//                                         image:  DecorationImage(
//                                           image: AssetImage("images/car.jpg"),
//                                           fit: BoxFit.cover,
//                                         ),
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(0.5.h),
//                                           bottomLeft: Radius.circular(0.5.h),
//                                         ),
//                                       ),
//                                       //color: Colors.white,
//                                     ),
                                       
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(horizontal: 2.w),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           SingleChildScrollView(
//                                             scrollDirection: Axis.horizontal,
//                                             child: Text("Hyndai 250 CC",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.5.w,fontFamily: 'poppins'),)),
//                                           Container(
//                                           // : MediaQuery.of(context).size.width,
//                                             //color: Colors.blue,
//                                             constraints: BoxConstraints(
//                                               maxWidth: MediaQuery.of(context).size.width * 0.64,
//                                             ),
//                                             child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.25.w,fontFamily: 'poppins',color: favouritetextColor),)     
//                                           ),
                                          
//                                           Container(
//                                             //color: Colors.blue,
//                                             width: MediaQuery.of(context).size.width * 0.64,
//                                             child: Row(
//                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                               children: [
//                                                 Text("\$250",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.w,color: favouritetextColor,fontFamily: 'Poppins'),),
//                                                 //Text("250",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
//                                                 Row(
//                                                   children: [
//                                                     //heart icon
//                                                     IconButton(onPressed: () {
//                                                       setState(() {
//                                                       bools[adjustedIndex] = !bools[adjustedIndex];
//                                                       });
                                                    
//                                                     }, icon: Icon(Icons.favorite,color: bools[adjustedIndex]?Colors.red:Colors.black,),iconSize: 2.h,),
//                                                     //SizedBox(width: 0.5.h,),
//                                                     // Icon(Icons.,color: Colors.yellow,),
//                                                     Text("Saved on 1 Mar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 3.w,color: favouritetextColor,fontFamily: 'Poppins'),),
//                                                   ],
//                                                 ),
                                                
//                                               ],
//                                             ),
//                                           ),
//                                           // Text("1 year",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
//                                           // Text("1.5 km",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 1.5.h),),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
                                        
//                                 ),
//                                 data[adjustedIndex]?Positioned.fill(child: Container(
//                                   color:Colors.white.withOpacity(0.75),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: EdgeInsets.all(1.h),
//                                         child: Text("Sold Out",style:TextStyle(fontFamily: 'poppins',color: Colors.red,fontWeight: FontWeight.bold,fontSize: 4.w)),
//                                       ),
//                                       IconButton(
//                                         icon: Icon(Icons.close,color: Colors.red,),
//                                         onPressed: (){},
//                                       ),
//                                     ],
//                                   ),
//                                   )):Container(),
//                               ],
//                             ),
                            
                            
//                             //child:Container()
                                                   
//                             );
                          
//                           }
//                           //final isSelected = index;
                         
//                         }                       )
//                      )
                    
                  
//                  ],
                  
//                  ),
//                ),
               
//                ),
//             ),
           
//            ],
//          ),
//        ),
//     );
//   }

// int _getDestinationItemIndex(int rawIndex) {
//     if (rawIndex >= _kAdIndex && _ad != null) {
//       return rawIndex - 1;
//     }
//     return rawIndex;
//   }
// }