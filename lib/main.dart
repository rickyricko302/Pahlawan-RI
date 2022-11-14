import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_cubit.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_state.dart';
import 'package:flutter_pahlawan_indonesia/screen/home/home_view.dart';
import 'package:flutter_pahlawan_indonesia/screen/splashscreen/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: ((context) {
        return HomeCubit();
      }),
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: SplashScreen(),
      ),
    );
  }
}
