import 'package:flutter/cupertino.dart';
import 'package:task1/presentation/async_call.dart';
import 'package:task1/presentation/codelab.dart';
import 'package:task1/presentation/color_list.dart';
import 'package:task1/presentation/four_squares.dart';
import 'package:task1/presentation/home.dart';

var routes = {
  '/': (BuildContext context) => const HomePage(),
  '/foursquares': (BuildContext context) => const FourSquares(),
  '/colorlist': (BuildContext context) => ColorList(),
  '/codelab': (BuildContext context) => InfiniteListView(),
  '/asynccall': (BuildContext context) => AsyncCall(),
};