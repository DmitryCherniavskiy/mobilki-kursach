import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RawAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;

  const RawAppBar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.black,
      centerTitle: false,
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

}