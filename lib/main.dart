import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/controller/gamepage_controller.dart';
import 'package:tic_tac_toe/view/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GamePageController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.amberAccent,
          primarySwatch: Colors.amber,
        ),
        home: const InitGamePage(),
      ),
    );
  }
}
