import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'components/raw_appbar.dart';

enum ScreenState { error, loaded, loading }

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
  const AsyncCall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AsyncCallState();
  }
}

class _AsyncCallState extends State<AsyncCall> {
  late ScreenState state = ScreenState.error;
  List<PhotoResponse> listPhotos = [];

  Future<List> getPhotos() async {
    const baseUrl = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await Dio().get<List>(baseUrl);
      final parsedData = response.data
              ?.map((element) => PhotoResponse.fromJson(element))
              .toList() ??
          [];
      listPhotos = parsedData;
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
            backgroundColor: MaterialStateProperty.all(Colors.black)
          ),
          onPressed: () async {
            setState(() {
              state = ScreenState.loading;
            });
            await getPhotos();
            setState(() {
              state = ScreenState.loaded;
            });
          },
          child: const Icon(Icons.edit_outlined, color: Colors.white),
        ),
        body: AsyncCallBody(
          listPhotos: listPhotos,
          state: state,
        ));
  }
}

class AsyncCallBody extends StatelessWidget {
  final List<PhotoResponse> listPhotos;
  final ScreenState state;

  const AsyncCallBody({Key? key, required this.state, required this.listPhotos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ScreenState.loading:
        {
          print('loading');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 8.0,
                ),
              )
            ],
          );
        }
      case ScreenState.error:
        {
          print('error');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.hourglass_empty,
                size: 200,
                color: Colors.white,
              ),
              SizedBox(height: 15),
              Text(
                'Нет данных в текущий момент.\nНажмите на кнопку',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          );
        }
      case ScreenState.loaded:
        {
          print('data');
          return RawListPhotos(listPhotos: listPhotos);
        }
    }
  }
}

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
