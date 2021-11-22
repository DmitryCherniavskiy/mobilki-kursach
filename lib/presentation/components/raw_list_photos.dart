import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/data/data.dart';

class RawListPhotos extends StatelessWidget {
  final List<PhotoResponse> listPhotos;

  const RawListPhotos({Key? key, required this.listPhotos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listPhotos.length,
        itemBuilder: (BuildContext context, int index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Image.network(listPhotos[index].url),
              Container(
                  color: Colors.blue,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Text(
                    listPhotos[index].thumbnailUrl,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                        fontSize: 18.0, color: Colors.black),
                  ))
            ],
          ),
        ));
  }
}