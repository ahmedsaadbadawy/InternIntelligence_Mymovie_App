import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      decoration: const BoxDecoration(color: Colors.black54),
      child: Column(
        children: [
          const Center(
            heightFactor: 2,
            child: Text('Dialogs', style: TextStyle(fontSize: 20)),
          ),
          ListTile(
            title: const Text('FeedBack', style: TextStyle(fontSize: 16)),
            onTap: () {},
          ),
          ListTile(
            title: const Text('About Us', style: TextStyle(fontSize: 16)),
            onTap: () {
              // Handle item 2 tap
            },
          ),
        ],
      ),
    );
  }
}
