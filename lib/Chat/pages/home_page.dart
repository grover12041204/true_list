//Packages
import 'package:flutter/material.dart';
import 'package:true_list/sujith/Models/Constants.dart';

//Pages
import '../../sarthak/Home/home_screen.dart';
import '../pages/chats_page.dart';
import '../pages/users_page.dart';


import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    ChatsPage(),
    UsersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildUI2();
  }

  Widget _buildUI() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: Color.fromRGBO(0, 82, 218, 1.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
              ),
            ],
            title: Text('Chats'),
            bottom: TabBar(
              tabs: [
                Tab(
                    icon: Icon(
                      Icons.chat_bubble_sharp,
                    ),
                    text: "Buying"),
                Tab(
                    icon: Icon(
                      Icons.supervised_user_circle_sharp,
                    ),
                    text: "Selling")
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ChatsPage(),
            UsersPage(),
          ],
        ),
        // _pages[_currentPage],
        // bottomNavigationBar: BottomNavigationBar(

        //   currentIndex: _currentPage,
        //   onTap: (_index) {
        //     setState(() {
        //       _currentPage = _index;
        //     });
        //   },
        //   items: [
        //     BottomNavigationBarItem(
        //       label: "Buying",
        //       icon: Icon(
        //         Icons.chat_bubble_sharp,
        //       ),
        //     ),
        //     BottomNavigationBarItem(
        //       label: "Selling",
        //       icon: Icon(
        //         Icons.supervised_user_circle_sharp,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget _buildUI2() {
     return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () => null, icon: Icon(Icons.logout)),
          ],
          title: Text("Chats"),
            leading: IconButton(
              onPressed: Navigator.of(context).pop,
               icon: Icon(Icons.arrow_back)),
          backgroundColor: appBackGroundcolor,
          // centerTitle: true,
          elevation: 0.0,
        
        ),
        body:Container(
          color: appBackGroundcolor,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(3.5.w),
                topRight: Radius.circular(3.5.w),
              ),
            ),
            child: Column(
              children:[
                Container(
                  child: TabBar(tabs: [
                   Tab(
                    icon: Icon(Icons.chat_bubble_sharp,),
                    text: "Buying"
                    ),
                    Tab(
                    icon: Icon(Icons.supervised_user_circle_sharp,),
                    text: "Selling"),
                  ],
                  labelColor: appBackGroundcolor,
                  indicatorColor: appBackGroundcolor,
                  ),
                ),

                Expanded(child: TabBarView(children: [
                   ChatsPage(),
                   UsersPage(),
                ]),)
              ]
            ),
          )
        )
        ),
    );
 
}
}

