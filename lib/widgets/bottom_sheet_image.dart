// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:true_list/widgets/profile_pick_image.dart';

// class postAddImage extends StatefulWidget {
//   Function selectImage;
//   Function selectGallery;
//   Uint8List im;
//   postAddImage(
//       {Key? key, required this.selectImage, required this.selectGallery,
//       required this.im
//       })
//       : super(key: key);

//   @override
//   State<postAddImage> createState() => _postAddImageState();
// }

// class _postAddImageState extends State<postAddImage> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         onTap: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 163,
//                 // color: Colors.green,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 19),
//                     Row(
//                       children: [
//                         SizedBox(width: 40),
//                         const Text(
//                           'Profile Photo',
//                           style: TextStyle(
//                               fontSize: 18, fontWeight: FontWeight.w700),
//                         ),
//                         Spacer(),
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: Icon(Icons.cancel_presentation_sharp),
//                         ),
//                         SizedBox(width: 20),
//                       ],
//                     ),
//                     // SizedBox(height: 15),
//                     Row(
//                       children: [
//                         SizedBox(width: 30),
//                         IconButton(
//                           onPressed: () {
//                           selectGallery();
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(Icons.camera_alt_outlined, size: 25),
//                         ),
//                         SizedBox(width: 68),
//                         IconButton(
//                           onPressed: () {
//                             selectGallery();
//                             Navigator.pop(context);
//                           },
//                           icon: Icon(Icons.image_outlined, size: 25),
//                         ),
//                         SizedBox(width: 68),
//                         _image != null
//                             ? IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _image = null;
//                                   });
//                                   Navigator.pop(context);
//                                 },
//                                 icon: Icon(
//                                   Icons.delete_forever_outlined,
//                                   size: 25,
//                                 ),
//                               )
//                             : SizedBox()
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(width: 30),
//                         Text(
//                           'Camera',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(width: 55),
//                         Text(
//                           'Gallery',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w400),
//                         ),
//                         SizedBox(width: 55),
//                         _image != null
//                             ? Text(
//                                 'Delete',
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.w400),
//                               )
//                             : SizedBox()
//                       ],
//                     )
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         child: Container());
//   }
// }
