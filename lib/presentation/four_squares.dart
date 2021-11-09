import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task1/presentation/components/raw_appbar.dart';

class FourSquares extends StatefulWidget{
  const FourSquares({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _FourSquares();
  }
}

class _FourSquares extends State<FourSquares>{
  List<Color> colors = List.generate(4, (index) => Color(Random().nextInt(0xffffffff)));
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: rawAppBar(height, '4 квадрата'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black)
        ),
        onPressed: ()=>setState((){
          colors=List.generate(4, (index) => Color(Random().nextInt(0xffffffff)));
        }),
        child: const Icon(
            Icons.palette_outlined,
            color: Colors.white
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
            for(int i=0;i<2;i++)RawSquare(color: colors[i])
          ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            for(int i=2;i<4;i++)RawSquare(color: colors[i])
          ])
        ],
      ),
    );
  }

}

class RawSquare extends StatelessWidget{
  final Color color;
  const RawSquare({Key? key,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: width*0.4,
        height: width*0.4,
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2.5,
              spreadRadius: 1.5,
              offset: Offset(3, 3)
            )
          ],
            borderRadius: BorderRadius.circular(width*0.05),
            color: color
        ),
      ),
    );
  }
}

