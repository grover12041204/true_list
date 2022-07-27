import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:true_list/Chat/pages/home_page.dart';
import 'package:true_list/Chat/pages/login_page.dart';
import 'package:true_list/Chat/pages/register_page.dart';
import 'package:true_list/Chat/pages/splash_page.dart';
import 'package:true_list/Chat/providers/authentication_provider.dart';
import 'package:true_list/Chat/services/navigation_service.dart';
import 'package:true_list/checking_data.dart';
import 'package:true_list/sarthak/Home/home_screen.dart';
import 'package:true_list/screens/login_screens/profile_info.dart';
import 'package:true_list/screens/login_screens/signIn_screen.dart';
import 'package:true_list/screens/post_screens/post_full_detail_screen.dart';
import 'package:true_list/screens/post_screens/post_photo_screen.dart';
import 'package:true_list/sujith/Accounts/Screens/Accounts_page.dart';

import 'sarthak/dbHelper/mongodb.dart';
import 'screens/account_settings/new_home_screen.dart';
import 'sujith/Accounts/Helpscreen/chatScreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(SplashPage(
    onInitializationComplete: () {
      runApp(MainApp());
    },
    key: UniqueKey(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(builder: (context, orientation, deviceType) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           backgroundColor: HexColor("#1F2A4A"),
//         ),
//         home: SignInScreen(),
//         //  FutureBuilder(
//         //   future: Firebase.initializeApp(),
//         //   builder: (context, AsyncSnapshot snapshot) {
//         //     if (snapshot.hasError) {
//         //       return Text("Error: ${snapshot.error}");
//         //     } else if (snapshot.connectionState == ConnectionState.done) {
//         //       print("Firebase Connected");
//         //       return AccountSettingScreen();
//         //     }
//         //     return Center(
//         //       child: CircularProgressIndicator(),
//         //     );
//         //   },
//         // ),
//         // onGenerateRoute: RouteGenerator.generateRoute,
//       );
//     });
//   }
// }

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'True List',
        // theme: ThemeData(
        //   backgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
        //   scaffoldBackgroundColor: Color.fromARGB(255, 37, 35, 71),
        //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //     backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
        //   ),
        // ),
        // navigatorKey: NavigationService.navigatorKey,
        // initialRoute: '/login',
        // routes: {
        //   '/login': (context) => LoginPage(),
        //   '/register': (context) => RegisterPage(),
        //   '/home': (context) => HomePage(),
        // },
        home: checkiingButton(),
      ),
    );
  }
}
