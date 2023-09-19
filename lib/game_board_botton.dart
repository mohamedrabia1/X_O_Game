import 'package:flutter/material.dart';

class GameBoardBotton extends StatelessWidget {
 String symbol;
 Function onClick;
 int index;
 GameBoardBotton({required this.symbol ,required this.onClick, required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        child:
          ElevatedButton(onPressed: (){
            onClick(index);
          }, child: Text(symbol)),
      ),
    );
  }
}
