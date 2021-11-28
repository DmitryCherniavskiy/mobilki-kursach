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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              alignment:AlignmentDirectional.bottomCenter,
              children: [
                Image.network(listPhotos[index].url),
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            stops: [
                              0.1,
                              0.5,
                              0.9
                            ],
                            colors: [
                              Color(0xFF241163),
                              Color(0xCC241172),
                              Color(0xCC241347)
                            ]
                        )
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      listPhotos[index].thumbnailUrl,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 18.0, color: Colors.black),
                    )),

              ],
            ),
          ),
        ));
  }
}