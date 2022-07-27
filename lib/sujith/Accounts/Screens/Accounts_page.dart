import 'package:flutter/material.dart';
import '../../Models/Constants.dart';
import '../Accounts_access/AccountsBelow.dart';
import '../Accounts_access/AccountsHeading.dart';
import '../Accounts_access/CreditsBelow.dart';
import '../Accounts_access/CreditsHeading.dart';
import '../Accounts_access/HelpBelow.dart';
import '../Accounts_access/HelpHeading.dart';
import '../Accounts_access/SaveHeadings.dart';
import '../Accounts_access/SavesBelow.dart';
import '../Accounts_access/VerifiedBelow.dart';
import '../Accounts_access/VerifiedHeading.dart';
import '../Accounts_access/Version.dart';
import '../Accounts_access/photoBar.dart';
import 'package:sizer/sizer.dart';
class accountspage extends StatefulWidget {
  const accountspage({Key? key}) : super(key: key);

  @override
  State<accountspage> createState() => _accountspageState();
}

class _accountspageState extends State<accountspage> {

  
  bool isVerified = true;
  bool isUpload = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Accounts'),
        backgroundColor: appBackGroundcolor,
        elevation: 0,
      ),

      body: ListView(
        children: [
          Container(
            color: appBackGroundcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                        PhotoBar(),
                        AccountsHeading(),
                        AccountsBelow(),
                        VerifiedHeading(),
                        VerifiedBelow(isVerified: isVerified, isUpload: isUpload),
                        CreditsHeading(),
                        CreditsBelow(),
                        SaveHeading(),
                        SavesBelow(),
                        HelpHeading(),
                        HelpBelow(),
                        Version()                    
                      ],
                    )
                  ),
                ],
              )
            );
            
          }
        }






