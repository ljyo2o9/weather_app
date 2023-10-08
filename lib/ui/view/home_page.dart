import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/ui/viewModel/weather_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var weatherViewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      body: weatherViewModel.weatherList.isNotEmpty
          ? Padding(
              padding: EdgeInsets.only(left: 31.w, right: 31.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Divider
                  Padding(
                    padding: EdgeInsets.only(top: 132.h),
                    child: Container(
                      color: Colors.black,
                      width: double.infinity,
                      height: 1.h,
                    ),
                  ), //
                  /// 지역
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Text(
                      'Helsinki',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.3.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ), //
                  /// 날짜
                  Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: Text(
                      'Wednesday - 29 May',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24.3.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
