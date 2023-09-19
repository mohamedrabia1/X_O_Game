import 'package:flutter/material.dart';
import 'package:x_o/game_board.dart';

import 'game_board_splash.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoardSplash.routeName: (_) => GameBoardSplash(),
        GameBoard.routeName: (_) => GameBoard(),

      },
      initialRoute: GameBoardSplash.routeName ,
    );
  }
}

