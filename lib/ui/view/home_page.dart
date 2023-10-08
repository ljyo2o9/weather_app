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
                  ),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
