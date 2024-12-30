import 'package:completwether/cubit/wether_cubit/wether_cubit.dart';
import 'package:completwether/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WetherCubit(),
      child: MaterialApp(
        home: HomePageWether(),
      ),
    );
  }
}
