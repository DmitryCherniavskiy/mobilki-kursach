import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task1/presentation/components/raw_appbar.dart';

class FourSquares extends StatefulWidget {
  const FourSquares({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FourSquaresState();
  }
}

class _FourSquaresState extends State<FourSquares> {
  late List<Color> colors;

  @override
  initState() {
    colors = generateList();
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
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () => setState(() {
          colors = generateList();
        }),
        child: const Icon(Icons.palette_outlined, color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 0; i < 2; i++) RawSquare(color: colors[i])
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (int i = 2; i < 4; i++) RawSquare(color: colors[i])
          ])
        ],
      ),
    );
  }

  List<Color> generateList() {
    return List.generate(4, (index) => Color(Random().nextInt(0xffffffff)));
  }
}

class RawSquare extends StatelessWidget {
  final Color color;
  const RawSquare({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: width * 0.4,
        height: width * 0.4,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}
