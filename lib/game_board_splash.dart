import 'package:flutter/material.dart';
import 'package:x_o/game_board.dart';
import 'package:x_o/game_board_arugs.dart';

class GameBoardSplash extends StatelessWidget {
  static String routeName = "game board splash";
  TextEditingController Player1Controller = TextEditingController();
  TextEditingController Player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Center(child: Text("XO")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: Player1Controller,
              decoration: InputDecoration(
                labelText: "Player1"
              ),
            ),
          ),
    Container(
    margin: EdgeInsets.all(10),
    child: TextField(
      controller: Player2Controller,
    decoration: InputDecoration(
    labelText: "Player2"
    ),
    ),
    ),
          Spacer(),
          Container(
            margin: EdgeInsets.all(15),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, GameBoard.routeName,
                arguments: GameBoardArugs(player1Name: Player1Controller.text, player2Name: Player2Controller.text)
                );
              }, child: Text("Start")))
        ],
      ),
    );
  }
}
