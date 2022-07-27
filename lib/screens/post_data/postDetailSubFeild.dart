import 'package:flutter/material.dart';
import 'package:true_list/color.dart';
import 'package:true_list/global_variables.dart';
import 'package:true_list/screens/post_data/post_detail_data.dart';
import 'package:true_list/screens/post_screens/post_details_screen.dart';
import 'package:true_list/widgets/textfeild.dart';

class PostDetainSubFeild extends StatefulWidget {
  final int index;
  const PostDetainSubFeild({Key? key, required this.index}) : super(key: key);

  @override
  State<PostDetainSubFeild> createState() => _PostDetainSubFeildState();
}

class _PostDetainSubFeildState extends State<PostDetainSubFeild> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            json[postMainCategory][postGlobalCategory][widget.index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            showBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 27),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/icons/add_icon.png',
                                height: 20,
                                color: Colors.black,
                              ),
                            ),
                            Spacer(),
                            Text(
                              json[postMainCategory][postGlobalCategory]
                                  [widget.index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    postGlobalValue = true;
                                  });

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              postDetailScreen()));
                                },
                                child: Container(
                                    alignment: Alignment.center,
                                    width: 67,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: appColors.darkBlue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Done',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            SizedBox(width: 30)
                          ],
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            json[postMainCategory][postGlobalCategory]
                                [widget.index],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        postDetailfield('New', controller),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print(controller.text);
                            setState(() {
                              if (PostGlobalData.fieldsArray.contains(
                                  json[postMainCategory][postGlobalCategory]
                                      [widget.index])) {
                                print(PostGlobalData.fieldsArray.contains(
                                    json[postMainCategory][postGlobalCategory]
                                        [widget.index]));
                                PostGlobalData.fieldsArray[
                                    json[postMainCategory][postGlobalCategory]
                                        [widget.index]] = controller.text;
                              }
                              PostGlobalData.fieldsArray.add({
                                json[postMainCategory][postGlobalCategory]
                                    [widget.index]: controller.text
                              });
                              PostGlobalData.fields.add(controller.text);
                              print(PostGlobalData.fields);
                              print(PostGlobalData.fields.length.toString() +
                                  ' Grover');
                              print(json[postMainCategory][postGlobalCategory]
                                      [widget.index] +
                                  'field name');
                              print(controller.text + 'field output');
                              print(PostGlobalData.fieldsArray);
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => postDetailScreen(),
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
                        SizedBox(height: 10),
                      ],
                    ),
                  );
                });
          },
          child: Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: appColors.postBackgroundColor),
              child: Row(
                children: [
                  (PostGlobalData.fields.length - 1 >= widget.index)
                      ? Text(
                          PostGlobalData.fields[widget.index],
                        )
                      : Text('Enter'),
                  Spacer(),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  )
                ],
              )),
        )
      ],
    ));
  }
}
