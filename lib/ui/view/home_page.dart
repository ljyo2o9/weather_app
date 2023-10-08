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
    var viewModel = Provider.of<WeatherViewModel>(context);
    return Scaffold(
      body: viewModel.weatherList.isNotEmpty
          ? Column(
              children: [],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
