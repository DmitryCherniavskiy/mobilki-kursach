import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task1/presentation/components/raw_appbar.dart';

class ColorList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ColorList();
  }
}

class _ColorList extends State<ColorList>{
  @override
  Widget build(BuildContext context) {
    final int sizeOfList=100;
    final height = MediaQuery.of(context).size.height;
    List<Color> colors = List.generate(sizeOfList, (index) => Color(Random().nextInt(0xffffffff)));
    return Scaffold(
      appBar: rawAppBar(height, 'Цветной список'),
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
      body: ListView.builder(
        itemCount: sizeOfList,
          itemBuilder: (context,index)=>RawListContainer(color: colors[index])
      ),
    );
  }
}

class RawListContainer extends StatelessWidget{
  final Color color;
  const RawListContainer({Key? key,required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:20,vertical: 15),
      child: Container(
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color
        ),
      ),
    );
  }

}