import 'package:flutter/material.dart';
import 'package:flutter_service/scenes/home/view/home.view.dart';
import 'package:flutter_service/scenes/home/viewmodel/home.viewmodel.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<HomeViewModel>(HomeViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomeView(),
    );
  }
}
