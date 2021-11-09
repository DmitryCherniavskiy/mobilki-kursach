import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget rawAppBar(double height,String title)=>AppBar(
  automaticallyImplyLeading: true,
  toolbarHeight: height*0.12,
  backgroundColor: Colors.black,
  centerTitle: false,
  title: Text(title),
);