import 'package:flutter/material.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/favourite_sent_favourite_received_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/like_sent_like_received_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/swiping_screens.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/user_details_screen.dart';
import 'package:tinder_clone_flutter_getx/tab_screens/view_sent_view_received_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

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
        body: tabScreenList[0],
      ),
      
    );
  }
}