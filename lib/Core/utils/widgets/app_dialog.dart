import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/utils/themes/theme_color.dart';
import 'package:movie_app/Core/utils/widgets/button.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: 32,
      insetPadding: EdgeInsets.all(32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Container(
        width: 300.w,
        height: 350.h,
        padding:
            EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: 16,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14.sp, color: Colors.white),
              ),
              SizedBox(height: 2.h),
              const Divider(thickness: 0.5),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10.sp, color: Colors.white),
                ),
              ),
              if (image != null) image!,
              Button(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: buttonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
