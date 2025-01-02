import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/constants.dart';

class YourFeedback extends StatefulWidget {
  const YourFeedback({super.key});

  @override
  State<YourFeedback> createState() => _YourFeedbackState();
}

class _YourFeedbackState extends State<YourFeedback> {
  // URL for Google Review
  final String reviewUrl =
      'https://search.google.com/local/writereview?placeid=ChIJ78nbKCr9DDkRCUdu1MEiAwM&noredir=1';

  // Function to open the URL
  void _openReviewUrl() async {
    final Uri url = Uri.parse(reviewUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $reviewUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: 260.w,
          height: 220.h,
          padding:  EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/rate12.png',
                height: 37.h,
              ),
               SizedBox(height: 15.h),
              // Feedback Text
              Padding(
                padding: EdgeInsets.all(14.0.r),
                child:  Text(
                  "Your feedback is a gem! Rate us to help us improve and keep dazzling you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
              ),
               SizedBox(height: 10.h),
              // Rate Us Button
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: kGray, fixedSize: Size(80.w, 15.h)),
                  onPressed: _openReviewUrl,
                  child: Text(
                    'RATE US',
                    style: TextStyle(color: kWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
