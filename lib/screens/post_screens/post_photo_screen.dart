import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_data/post_detail_data.dart';
import 'package:true_list/screens/post_screens/post_details_screen.dart';
import 'package:true_list/screens/post_screens/post_full_detail_screen.dart';
import 'package:true_list/widgets/post_image_container.dart';
import 'package:true_list/widgets/profile_pick_image.dart';
import 'package:true_list/widgets/textfeild.dart';

class PostPhotoScreen extends StatefulWidget {
  PostPhotoScreen({Key? key}) : super(key: key);

  @override
  State<PostPhotoScreen> createState() => _PostPhotoScreenState();
}

class _PostPhotoScreenState extends State<PostPhotoScreen> {
  TextEditingController titleController = TextEditingController();
  bool homeColor = false;
  bool deleteColor = false;
  int homeIndex = 0;
  final ImagePicker _picker = ImagePicker();
  bool dataTrue = false;
  List<XFile>? imageList = [];
  void selectImageFromGallery() async {
    // Uint8List im = await pickImage(ImageSource.gallery);
    XFile? im = await _picker.pickImage(source: ImageSource.gallery);

    if (im == null) {
      print('no image is selected');
    }
    if (imageList!.length > 15) {
      showInSnackBar('Image limit is excceded');
    } else {
      setState(() {
        imageList!.add(im!);
        globla_images!.add(im);
        dataTrue = true;
        print(imageList![0].path);
        print(globla_images![0].path);
      });
    }
  }

  void selectImageFromCamera() async {
    XFile? im = await _picker.pickImage(source: ImageSource.camera);
    if (imageList!.length > 15) {
      showInSnackBar('Image limit is excceded');
      setState(() {});
    } else {
      setState(() {
        imageList!.add(im!);
        globla_images!.add(im);
        dataTrue = true;
        print(imageList![0].path);
        print(globla_images![0].path);
      });
    }
  }

  void selectMultipleImageFromGallery() async {
    print('started');
    List<XFile>? pickedMultipleImages = await _picker.pickMultiImage();
    print(pickedMultipleImages);
    print('image picked');
    if (pickedMultipleImages == null) {
      print(pickedMultipleImages!.length.toString() + 'fsdf');
    }
    if (pickedMultipleImages.length + globla_images!.length > 16) {
      showInSnackBar('Image limit is excceded');
    } else {
      print(pickedMultipleImages.length.toString() + 'fsdf');
      setState(() {
        print('restarted image');
        imageList!.addAll(pickedMultipleImages);
        globla_images!.addAll(pickedMultipleImages);
        dataTrue = true;
        print('horing');
      });
    }
  }

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
                  // Navigator.pop(context);
                },
                icon: Image.asset(
                  'assets/icons/left_arrow.png',
                  height: 24,
                ),
              ),
              Text(
                'Post screen',
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
                child: ListView(
                  children: [
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Table(
                        children: [
                          TableRow(children: [
                            Image.asset('assets/icons/post_current_bar.png'),
                            Image.asset('assets/icons/post_bar2.png'),
                            Image.asset('assets/icons/post_bar2.png'),
                            Image.asset('assets/icons/post_bar2.png'),
                          ]),
                          const TableRow(children: [
                            SizedBox(height: 15),
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                            SizedBox(height: 10),
                          ]),
                          const TableRow(children: [
                            Center(child: Text("1. Photo")),
                            Center(child: Text("2. Details")),
                            Center(child: Text('3. Price')),
                            Center(child: Text('4. Finish')),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 36),
                    Container(
                        height: 200,
                        child: ListView.builder(
                          itemCount: globla_images!.isNotEmpty
                              ? globla_images!.length
                              : 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return globla_images!.isNotEmpty
                                ? Align(
                                    // widthFactor: 180,
                                    // heightFactor: 190,
                                    // alignment: Alignment.,
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(File(
                                                globla_images![index].path)),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1, color: Colors.black)),
                                      width: 170,
                                      height: 180,
                                      child: Stack(
                                        children: [
                                          // Image.file(
                                          //   File(imageList![index].path),
                                          //   fit: BoxFit.fill,
                                          // ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5.0, right: 5),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.home,
                                                    size: 30,
                                                    color: index != 0
                                                        ? Colors.white
                                                        : Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      final temp =
                                                          globla_images![0];
                                                      globla_images![0] =
                                                          globla_images![index];
                                                      globla_images![index] =
                                                          temp;
                                                      homeIndex = index;
                                                    });
                                                  },
                                                ),
                                              )),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 10.0, left: 10),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      globla_images!
                                                          .removeAt(index);
                                                      imageList!
                                                          .removeAt(index);
                                                    });
                                                  },
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(width: 20),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Colors.black)),
                                        width: 170,
                                        height: 180,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/gallery_icon.png'),
                                            SizedBox(height: 5),
                                            Text(
                                              'post an item',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: appColors
                                                      .secondgreyColor),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                width: 1, color: Colors.black)),
                                        width: 170,
                                        height: 180,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/gallery_icon.png'),
                                            SizedBox(height: 5),
                                            Text(
                                              'Select photo',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: appColors
                                                      .secondgreyColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        )),
                    // Container(
                    //   height: 200,
                    //   child: ListView(
                    //     scrollDirection: Axis.horizontal,
                    //     children: [
                    //       SizedBox(width: 20),
                    //       InkWell(
                    //         onTap: () {
                    //           selectImageFromGallery();
                    //         },
                    //         child: postContainer(
                    //           170,
                    //           180,
                    //           'assets/icons/camera_icon.png',
                    //           'Post an item',
                    //         ),
                    //       ),
                    //       SizedBox(width: 10),
                    //       postContainer(
                    //         170,
                    //         180,
                    //         'assets/icons/gallery_icon.png',
                    //         'Post an item',
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 163,
                              // color: Colors.green,
                              child: ListView(
                                children: [
                                  SizedBox(height: 19),
                                  Row(
                                    children: [
                                      SizedBox(width: 40),
                                      const Text(
                                        'Profile Photo',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () => Navigator.pop(context),
                                        icon: const Icon(
                                            Icons.cancel_presentation_sharp),
                                      ),
                                      SizedBox(width: 20),
                                    ],
                                  ),
                                  Table(
                                    children: [
                                      TableRow(children: [
                                        IconButton(
                                          onPressed: () {
                                            selectImageFromCamera();
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(
                                              Icons.camera_alt_outlined,
                                              size: 25),
                                        ),
                                        // IconButton(
                                        //   onPressed: () {
                                        //     selectImageFromGallery();
                                        //     Navigator.pop(context);
                                        //   },
                                        //   icon: Icon(Icons.image_outlined,
                                        //       size: 25),
                                        // ),
                                        IconButton(
                                          onPressed: () {
                                            selectMultipleImageFromGallery();
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.image,
                                            size: 25,
                                          ),
                                        )
                                      ]),
                                      TableRow(children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Camera',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Gallery',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        // Align(
                                        //   alignment: Alignment.center,
                                        //   child: Text(
                                        //     'Multiple Images',
                                        //     style: TextStyle(
                                        //         fontSize: 16,
                                        //         fontWeight: FontWeight.w400),
                                        //   ),
                                        // )
                                      ]),
                                    ],
                                  ),
                                  // SizedBox(height: 15),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(width: 30),
                                  //     IconButton(
                                  //       onPressed: () {
                                  //         selectImageFromCamera();
                                  //         Navigator.pop(context);
                                  //       },
                                  //       icon: const Icon(
                                  //           Icons.camera_alt_outlined,
                                  //           size: 25),
                                  //     ),
                                  //     SizedBox(width: 68),
                                  //     IconButton(
                                  //       onPressed: () {
                                  //         selectImageFromGallery();
                                  //         Navigator.pop(context);
                                  //       },
                                  //       icon: Icon(Icons.image_outlined,
                                  //           size: 25),
                                  //     ),
                                  //     SizedBox(width: 68),
                                  //     IconButton(
                                  //       onPressed: () {
                                  //         selectMultipleImageFromGallery();
                                  //         Navigator.pop(context);
                                  //       },
                                  //       icon: Icon(
                                  //         Icons.delete_forever_outlined,
                                  //         size: 25,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Camera',
                                  //       style: TextStyle(
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //     Text(
                                  //       'Gallery',
                                  //       style: TextStyle(
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //     Text(
                                  //       'Multiple Images',
                                  //       style: TextStyle(
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w400),
                                  //     )
                                  //   ],
                                  // )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 50,
                          width: 200,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: appColors.darkBlue,
                          ),
                          child: Text(
                            'Add Image ${globla_images!.length.toString()}/16',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Title *',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: postTextfield(titleController),
                    ),
                    SizedBox(height: 7),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'For example: Write a line about your product by stating its Brand, model, color, size etc.',
                        style: TextStyle(color: appColors.greyLoginText),
                      ),
                    ),
                    // Spacer(),
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          PostGlobalData.image = globla_images!;
                          PostGlobalData.imageTitle = titleController.text;
                          print(PostGlobalData.image);
                          print(PostGlobalData.imageTitle);
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => postDetailScreen(),
                          ),
                        );
                        titleController.text.isNotEmpty
                            ? print(titleController.text)
                            : showInSnackBar('Textfield is cannot be Empty');
                        imageList!.isNotEmpty
                            ? print(globla_images)
                            : showInSnackBar('Image is cannot be Empty');
                        print(imageList![1].path);
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
                            'Next',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    SizedBox(height: 100),
                    // SizedBox(height: 35)
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepOrange,
        content: Text(value),
      ),
    );
  }
}

// DefaultTabController(
//                       length: 4,
//                       child: TabBar(
//                           indicator: UnderlineTabIndicator(
//                             borderSide:
//                                 BorderSide(color: appColors.darkBlue, width: 5),
//                             insets: EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 45.0),
//                           ),
//                           tabs: [
//                             Tab(
//                                 child: Text(
//                               '1. Photo',
//                               style: TextStyle(
//                                 color: appColors.darkBlue,
//                                 fontSize: 16,
//                               ),
//                             )),
//                             Tab(
//                               child: Text(
//                                 '2. Details',
//                                 style: TextStyle(
//                                   color: appColors.darkBlue,
//                                   fontSize: 14,
//                                 ),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 '3. Price',
//                                 style: TextStyle(
//                                   color: appColors.darkBlue,
//                                 ),
//                               ),
//                             ),
//                             Tab(
//                               child: Text(
//                                 '3. Price',
//                                 style: TextStyle(color: appColors.darkBlue),
//                               ),
//                             ),
//                           ]),
//                     )
