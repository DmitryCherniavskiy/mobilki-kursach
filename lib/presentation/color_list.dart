import 'dart:math';
import 'package:flutter/material.dart';

import 'components/raw_appbar.dart';

class ColorList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColorListState();
  }
}

class _ColorListState extends State<ColorList> {
  static const int sizeOfList = 1000;
  late final List<Color> colors;

  @override
  initState() {
    colors = generateList(sizeOfList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RawAppBar(title: 'Цветной список'),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () => setState(() {
          colors = generateList(sizeOfList);
        }),
        child: const Icon(Icons.palette_outlined, color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: sizeOfList,
          itemBuilder: (context, index) =>
              RawListContainer(color: colors[index])),
    );
  }

  List<Color> generateList(int sizeOfList) {
    return List.generate(
        sizeOfList, (index) => Color(Random().nextInt(0xffffffff)));
  }
}

class RawListContainer extends StatelessWidget {
  final Color color;
  const RawListContainer({Key? key, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
      ),
    );
  }
}
