import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:requests/requests.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';


class HomeSearch extends StatefulWidget {
  const HomeSearch({Key? key}) : super(key: key);

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {

  late bool selected;

  @override
  void initState() {
    // TODO: implement initState
    checkGps();
    super.initState();
    selected = false;
    // searchPlace.text = "Hitech City, Hyderabad";
    placeName = "Hitech City, Hyderabad";
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
      print("lat: $lat");
      print("long: $long");
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }


  final kGoogleApiKey = "AIzaSyD5z4kop-eoO-xW6rUFJSxLO8PdRNX6Gj8";
  List finalresponses = List.empty(growable: true);

  TextEditingController searchPlace = TextEditingController();
  late String placeName ;
  int length = 0;
  // List<dynamic> res = List.empty(growable: true);

  Future<int?> findPlace(String placename) async{
    finalresponses.clear();
    if(placename.length > 1)
      {
        String autoCompleteURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${placeName}&radius=500&components=country:in&&location=37.76999%2C-122.44696&types=geocode&key=${kGoogleApiKey}';
        var res = await Requests.get(autoCompleteURL);

        if(res == "Failed")
          {
            return 0;
          }
        var json = jsonDecode(res.body);
        List responses = json['predictions'];
        length = responses.length;
        for(int i = 0 ; i < responses.length ; i++)
          {
            finalresponses.add(responses[i]['description']);
          }

        for(int i = 0 ; i < responses.length ; i++)
          {
            print(finalresponses[i]);
          }

        return json['predictions'].length;

      }
  }

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
          constraints: BoxConstraints(
              maxHeight: double.infinity,
              minHeight: height
          ),
          child: ListView(
            shrinkWrap: true,
            // clipBehavior: Clip.none,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 28,),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,size: 20,),onPressed: (){
                      Navigator.pop(context);
                    },),
                    SizedBox(width: 10,),
                    Text("Home - Search",style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(height: 21,),
              Container(
                width: double.maxFinite,
                 height: height * 0.850,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
                ),
                padding: EdgeInsets.only(left: 20,right: 20,top: 34),

                child: Column(
                  children: [
                    TextField(
                      style: GoogleFonts.poppins(color: HexColor("#616161"),fontSize: 14,fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[50],
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: GestureDetector(child: Icon(Icons.location_on,color: HexColor("#616161"),size: 20,),onTap: (){
                            print(servicestatus? "GPS is Enabled": "GPS is disabled.");
                            print(haspermission? "GPS is Enabled": "GPS is disabled.");
                            checkGps();
                            print(lat);
                            print(long);


                          },),
                          suffixIcon: GestureDetector(child: Icon(Icons.cancel,color: HexColor("#616161"),size: 20,),onTap: (){searchPlace.clear();},),
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade50,style: BorderStyle.none,width: 0.0),borderRadius: BorderRadius.circular(10)),
                          contentPadding: EdgeInsets.only(left: 14,top: 13,bottom: 9),
                          hintText: "Hitech City, Hyderabad",
                          hintStyle: GoogleFonts.poppins(color: HexColor("#616161"),fontSize: 14,fontWeight: FontWeight.w400),
                        ),
                      controller: searchPlace,
                      onChanged: (value){
                        // setState((){
                        //   placeName = value;
                        // });
                      },
                      onSubmitted: (value){
                        setState((){
                          placeName = value;
                        });
                        findPlace(placeName);
                      },
                      ),
                    Container(
                      child: FutureBuilder(
                        future: findPlace(placeName),
                        builder: (context,AsyncSnapshot snapshot){
                          if(snapshot.connectionState == ConnectionState.none){
                            return Center(child: Text("No Location Found"),);
                          }
                          if(snapshot.connectionState == ConnectionState.done){
                            if(finalresponses.length > 1)
                              {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: length,
                                  itemBuilder: (context,index){
                                    return GestureDetector(onTap: (){
                                      setState((){
                                        placeName = finalresponses[index];
                                        searchPlace.text = finalresponses[index];
                                        selected = true;
                                        // checkGps();
                                        Navigator.of(context).pop([placeName]);
                                      });
                                    } ,
                                        child: ListTile(title: Text("${finalresponses[index]}",style: GoogleFonts.poppins(color: Colors.black,fontSize: 14),),),
                                    );
                                  },
                                );
                              }
                          }
                          return Padding(padding: EdgeInsets.only(top: 100),child: Text("No Location Found"));

                        },
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
