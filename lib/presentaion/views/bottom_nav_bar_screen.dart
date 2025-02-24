import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentaion/views/downloads/downloads_screen.dart';
import 'package:movie_app/presentaion/views/profile/profile_screen.dart';
import 'package:movie_app/presentaion/views/search/search_screen.dart';
import '../widgets/floating_bottom_nav_bar.dart';
import 'home/homa_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  BottomNavBarScreenState createState() => BottomNavBarScreenState();
}

class BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const DownloadsScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _screens[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: FloatingBottomNavBar(
                currentIndex: _currentIndex,
                onTap: _onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
