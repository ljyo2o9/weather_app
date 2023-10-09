import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:weather_app/ui/viewModel/weather_view_model.dart';
import 'package:weather_app/ui/viewModel/date_view_model.dart';

import 'package:weather_app/ui/function/row_category.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /// weekViewModel
    var dateViewModel = Provider.of<DateViewModel>(context);

    /// weatherViewModel
    var weatherViewModel = Provider.of<WeatherViewModel>(context);

    if (weatherViewModel.weatherList.isNotEmpty) {
      //
      /// 요일
      String dayOfWeek = dateViewModel.dayOfWeek;
      //
      /// 일
      var day = DateTime.now().day >= 10
          ? DateTime.now().day
          : '0${DateTime.now().day}';
      //
      /// 월
      String month = dateViewModel.monthData;

      /// 온도
      final tmp =
          double.parse(weatherViewModel.weatherList[3].obsrValue.toString())
              .toStringAsFixed(0);
      //
      /// 풍속
      final wsd = weatherViewModel.weatherList[7].obsrValue;
      //
      ///강수 확률
      final pop = weatherViewModel.weatherList[0].obsrValue;
      return Scaffold(
        body: Padding(
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
                  '유성구',
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
                  '$dayOfWeek - $day $month',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.3.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //
              /// 온도
              int.parse(tmp) < 0
                  ? Padding(
                      padding: EdgeInsets.only(top: 31.h, bottom: 35.h),
                      child: Text(
                        '$tmp°',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 165.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: Text(
                        '$tmp°',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 200.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),

              /// 날씨
              Text(
                'It\'s sun time',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
              //
              /// RowCategory
              Padding(
                padding: EdgeInsets.only(top: 48.h),
                child: rowCategory('Wind: ${wsd}m/s', 'Probability: $pop%'),
              ),
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
