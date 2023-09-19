import 'package:flutter/material.dart';
import 'package:x_o/game_board_arugs.dart';

import '../game_board_botton.dart';

class GameBoard extends StatefulWidget {
 static String routeName = "game board";

  @override
  State<GameBoard> createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard> {
 List<String> board = [
   "" , "" , "",
   "" , "" , "",
   "" , "" , ""
 ];
 int counter = 0;
 int player1Scoer = 0;
 int player2Scoer = 0;

  @override
  Widget build(BuildContext context) {
   GameBoardArugs args = ModalRoute.of(context)!.settings.arguments as GameBoardArugs;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("GameBoard")),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${args.player1Name}: $player1Scoer", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              Text("${args.player2Name}: $player2Scoer", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ],
          )
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardBotton(symbol: board[0],onClick: onButtonClick, index: 0),
                GameBoardBotton(symbol: board[1],onClick: onButtonClick, index: 1),
                GameBoardBotton(symbol: board[2],onClick: onButtonClick, index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardBotton(symbol: board[3],onClick: onButtonClick, index: 3),
                GameBoardBotton(symbol: board[4],onClick: onButtonClick, index: 4),
                GameBoardBotton(symbol: board[5],onClick: onButtonClick, index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GameBoardBotton(symbol: board[6],onClick: onButtonClick, index: 6),
                GameBoardBotton(symbol: board[7],onClick: onButtonClick, index: 7),
                GameBoardBotton(symbol: board[8],onClick: onButtonClick, index: 8),
              ],
            ),
          )

        ],
      )
    );
  
  }
 onButtonClick(int index){
    if(board[index].isNotEmpty) return;
    String symbol = counter % 2 == 0 ? "X" : "O";
    board[index] = symbol;
    counter++;
    if(checkWinner(symbol)){
      if(symbol == "X") player1Scoer++;
      else player2Scoer++;
      restBoard();
    }
    if(counter == 9){
      restBoard();
    }
    setState(() {});
 }
 restBoard(){
   board = [
     "" , "" , "",
     "" , "" , "",
     "" , "" , ""
   ];
   counter=0;
   setState(() {});
 }
 bool checkWinner(symbol){
    if(symbol == board[0] && symbol == board[4] && symbol == board[8]){
      return true;
    }
    if(symbol == board[2] && symbol == board[4] && symbol == board[6]){
      return true;
    }
    for(int i = 0 ; i <=6 ; i+=3){
      if(symbol == board[i] && symbol == board[i+1] && symbol == board[i+2]){
        return true;
      }
    }
    for(int i = 0 ; i <=2 ; i++){
      if(symbol == board[i] && symbol == board[i+3] && symbol == board[i+6]){
        return true;
      }
    }
    return false;
 }
}
