import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sales_commission_calculator/application/screen_bloc/bloc/screen_bloc.dart';

import 'Screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ScreenBloc(),
        child: Screen(),
      ),
    );
  }
}
