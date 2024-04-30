import 'package:flutter/material.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/favourite_sent_favourite_received_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/like_sent_like_received_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/swiping_screens.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/user_details_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/view_sent_view_received_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int screenIndex = 0;

List tabScreenList = const [
  SwipingScreens(),
  ViewSentViewReceivedScreen(),
  FavouriteSentFavouriteReceivedScreen(),
  LikeSentLikeReceivedScreen(),
  UserDetailsScreen()
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: tabScreenList[screenIndex],
        bottomNavigationBar: _bottomNavigationBarWidget(context),
      ),
    );
  }

  _bottomNavigationBarWidget(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                screenIndex = 0;
                print(screenIndex);
              });
            },
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.home,
                              color: screenIndex == 0 ? Colors.white : Color.fromARGB(255, 143, 142, 142),
), Text('Home')],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                screenIndex = 1;
                print(screenIndex);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.remove_red_eye,
                  color: screenIndex == 1
                      ? Colors.white
                      : const Color.fromARGB(255, 143, 142, 142),
                ),
                const Text('Home')
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                screenIndex = 2;
                print(screenIndex);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: screenIndex == 2
                      ? Colors.white
                      : const Color.fromARGB(255, 143, 142, 142),
                ),
                Text('Home')
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                screenIndex = 3;
                print(screenIndex);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite,
                  color: screenIndex == 3
                      ? Colors.white
                      : const Color.fromARGB(255, 143, 142, 142),
                ),
                Text('Home')
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                screenIndex = 4;
                print(screenIndex);
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color: screenIndex == 4
                      ? Colors.white
                      : const Color.fromARGB(255, 143, 142, 142),
                ),
                Text('Home')
              ],
            ),
          ),
        ],
      ),
    );
    //    BottomNavigationBar(
    //       currentIndex: screenIndex,
    //       backgroundColor: Colors.white,
    //       elevation: 0,
    //       // selectedFontSiSze: 20,

    //       selectedItemColor: Colors.red,
    //       onTap: (value) {
    //         setState(() {
    //           screenIndex = value;
    //         });
    //       },
    //       items: const [
    //         BottomNavigationBarItem(
    //           label: "Home",
    //           icon: Icon(Icons.add),
    //         ),
    //         BottomNavigationBarItem(label: "Home", icon: Icon(Icons.add)),
    //          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.add)),
    //           BottomNavigationBarItem(label: "Home", icon: Icon(Icons.add)),
    //            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
    //       ]);
    // }
  }
}
