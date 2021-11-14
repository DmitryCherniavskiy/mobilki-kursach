import 'package:flutter/material.dart';

import 'components/raw_appbar.dart';

class AsyncCall extends StatefulWidget{
  const AsyncCall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AsyncCall();
  }
}


class _AsyncCall extends State<AsyncCall>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: RawAppBar(title: 'Асинхронный вызов'),
      body: Text('1123'),
    );
  }

}