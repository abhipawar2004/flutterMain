import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gehnamall/common/custom_container.dart';
import 'package:gehnamall/common/custome_appbar.dart';
import 'package:gehnamall/constants/constants.dart';
import 'package:gehnamall/views/home/Banner/banner_list.dart';
import 'package:gehnamall/views/home/FollowButtons/followtabs.dart';
import 'package:gehnamall/views/home/Gifting/gifting_list.dart';
import 'package:gehnamall/views/home/Testimonial/testimonial_list.dart';
import 'package:gehnamall/views/home/about_company/about_company.dart';
import 'package:gehnamall/views/home/category/category_list.dart';
import 'package:gehnamall/views/home/connect/connect.dart';
import 'package:gehnamall/views/home/director_vision/director_vision.dart';
import 'package:gehnamall/views/home/feedback/feedback.dart';
import 'package:gehnamall/views/home/lightCategories/light_category_list.dart';
import 'package:gehnamall/views/home/occasion/occasion_list.dart';
import 'package:gehnamall/views/home/soulmate/soulmate_list.dart';
import 'package:gehnamall/views/home/store_location/store_location.dart';

import 'detail/detail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDark,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: CustomeAppbar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              // LightCategoryList(),
              //   BannerList(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.center,
                    heightFactor: 0.7, // Adjust this value to crop more or less
                    child: Image.asset(
                      'assets/images/ansurence.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              // CategoriesList(),
              SizedBox(height: 10.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 8.w, // Spacing to the text
                      ),
                    ),
                    Text(
                      "Gifting Guide",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 8.w, // Spacing to the text
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "🎁 Find the Perfect Present",
                style: TextStyle(
                  fontFamily: 'Cursive', // Ensures cursive font
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold, // Adjust font size as needed
                  color: kDark, // Dark red color
                ),
              ),
              // GiftingList(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 8.w, // Spacing to the text
                      ),
                    ),
                    Text(
                      "Gleam Follow and Shine !",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: kDark,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 8.w, // Spacing to the text
                      ),
                    ),
                  ],
                ),
              ),
              FollowTabs(),
              SizedBox(height: 15.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 8.w, // Spacing to the text
                      ),
                    ),
                    Text(
                      "For Yours Special",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: kDark,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 8.w, // Spacing to the text
                      ),
                    ),
                  ],
                ),
              ),
              SoulmateList(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 8.w, // Spacing to the text
                      ),
                    ),
                    Text(
                      "Shop For Occasions",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: kDark,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 8.w, // Spacing to the text
                      ),
                    ),
                  ],
                ),
              ),
              OccasionList(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 8.w, // Spacing to the text
                      ),
                    ),
                    Text(
                      "Testimonial",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20.sp,
                        color: kDark,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 8.w, // Spacing to the text
                      ),
                    ),
                  ],
                ),
              ),
              // const TestimonialList(),
              SizedBox(
                height: 50.h,
              ),
              _title("Director's Vision"),
              SizedBox(
                height: 20.h,
              ),
              DirectorVision(),
              SizedBox(
                height: 20.h,
              ),
              _title('About Company'),
              SizedBox(
                height: 20.h,
              ),
              AboutCompany(),
              SizedBox(
                height: 20.h,
              ),
              _title('Store Location'),
              SizedBox(
                height: 20.h,
              ),
              StoreLocation(),
              SizedBox(
                height: 20.h,
              ),
              _title('Your Feedback, Our Treasure!'),
              SizedBox(
                height: 20.h,
              ),
              YourFeedback(),
              SizedBox(
                height: 25.h,
              ),
              _title('Connect with us'),
              SizedBox(
                height: 20.h,
              ),
              ConnectWithUs(),
              SizedBox(
                height: 20.h,
              ),
              DetailScreen(),

              SizedBox(
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _title(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w), // Adjust padding
    child: Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            endIndent: 8.w, // Spacing to the text
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20.sp,
            color: kDark,
          ),
        ),
        Expanded(
          child: Divider(
            color: Colors.grey,
            thickness: 1,
            indent: 8.w, // Spacing to the text
          ),
        ),
      ],
    ),
  );
}
