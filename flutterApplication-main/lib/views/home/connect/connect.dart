import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:gehnamall/constants/constants.dart';

class ConnectWithUs extends StatefulWidget {
  const ConnectWithUs({super.key});

  @override
  State<ConnectWithUs> createState() => _ConnectWithUsState();
}

class _ConnectWithUsState extends State<ConnectWithUs> {
  // Function to open WhatsApp with a pre-filled message
  void _openWhatsApp() async {
    String phoneNumber = "+91982031621"; // Indian phone number
    String message =
        "Hello, I have a question regarding the product from your app.";
    String url =
        "https://api.whatsapp.com/send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("WhatsApp is not installed or cannot be launched.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: _openWhatsApp, // Navigate to WhatsApp
          child: Card(
            color: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r), // Responsive radius
            ),
            elevation: 4,
            margin: EdgeInsets.all(8.r), // Responsive margin
            child: Container(
              width: 100.w, // Reduced width
              height: 100.h, // Reduced height
              padding: EdgeInsets.all(12.r), // Responsive padding
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/whatsapp.png',
                    height: 40.h, // Responsive height
                    fit: BoxFit.contain,
                  ),
                 SizedBox(
                  height: 5.h,
                 ),
                  Text(
                    'Connect on Whatsapp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp, // Responsive font size
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _openWhatsApp, // Navigate to WhatsApp
          child: Card(
            color: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 4,
            margin: EdgeInsets.all(8.r),
            child: Container(
              width: 100.w, // Reduced width
              height: 100.h, // Reduced height
              padding: EdgeInsets.all(12.r),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/videocall.png',
                    color: kDark,
                    height: 40.h,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Schedule\nvideo call',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: _openWhatsApp, // Navigate to WhatsApp
          child: Card(
            color: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            elevation: 4,
            margin: EdgeInsets.all(8.r),
            child: Container(
              width: 100.w, // Reduced width
              height: 100.h, // Reduced height
              padding: EdgeInsets.all(12.r),
              child: Column(
                children: [
                  Icon(
                    FontAwesomeIcons.clockRotateLeft,
                    size: 35.sp, // Responsive icon size
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Latest\nUpdate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
