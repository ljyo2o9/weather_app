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

    final tmp = weatherViewModel.category['tmp'];

    final wsdValue = weatherViewModel.category['wsd'];
    double wsd = 0.0; // 기본값 설정
    if (wsdValue != null) {
      double? parsedWsd = double.tryParse(wsdValue);
      if (parsedWsd != null) {
        wsd = parsedWsd * 3.6;
      }
    }

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
            //
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
            /// 바람 세기
            Padding(
              padding: EdgeInsets.only(top: 48.h),
              child: Text(
                '풍속: ${wsd.toStringAsFixed(2)}km/h',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.3.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
