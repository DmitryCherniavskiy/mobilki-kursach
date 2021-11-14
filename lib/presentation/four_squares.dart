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

  late List<Color> colors;
  List<Alignment> align = [Alignment.topLeft,Alignment.topRight,Alignment.bottomLeft,Alignment.bottomRight];

  @override initState(){
    setColors();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const RawAppBar(title: '4 квадрата'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black)
        ),
        onPressed: ()=>setState((){
          setColors();
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

  setColors(){
    colors = List.generate(4, (index) => Color(Random().nextInt(0xffffffff)));
  }
}

class RawSquare extends StatelessWidget{
  final Color color;
  const RawSquare({Key? key,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: width*0.4, //Так как мы не обсуждали, насколько дизайн должен быть резиновым, можно просто было задать конкретные развмеры.
        height: width*0.4,
        decoration: BoxDecoration(
            color: color
        ),
      ),
    );
  }
}

