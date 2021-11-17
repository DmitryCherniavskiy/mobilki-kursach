import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'components/raw_appbar.dart';

class PhotoResponse {
  PhotoResponse(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.thumbnailUrl,
      required this.url});
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoResponse.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}

class AsyncCall extends StatefulWidget {
  AsyncCall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AsyncCallState();
  }
}

class _AsyncCallState extends State<AsyncCall> {
  List<PhotoResponse> listPhotos = [];

  Future<List> getPhotos() async {
    const baseUrl = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await Dio().get<List>(baseUrl);
      final parsedData = response.data
              ?.map((element) => PhotoResponse.fromJson(element))
              .toList() ??
          [];
      setState(() {
        listPhotos = parsedData;
      });
      return listPhotos;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const RawAppBar(title: 'Асинхронный вызов'),
        floatingActionButton: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size.square(50)),
          ),
          onPressed: () async {
            await getPhotos();
            setState(() {});
          },
          child: const Icon(Icons.edit_outlined, color: Colors.white),
        ),
        body: ListView.builder(
            itemCount: listPhotos.length,
            itemBuilder: (BuildContext context, int index) => Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                )));
  }
}
