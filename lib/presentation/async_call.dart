import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'components/raw_appbar.dart';

class AsyncCall extends StatefulWidget{

  List listPhotos=[];

  AsyncCall({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AsyncCall();
  }
}


class _AsyncCall extends State<AsyncCall>{
  Future<bool> getPhotos() async {
    const baseUrl = 'https://jsonplaceholder.typicode.com/photos';
    await Dio().get(baseUrl).then(
            (response){
              widget.listPhotos=response.data;
            }
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const RawAppBar(title: 'Асинхронный вызов'),
      body: FutureBuilder(
        future: getPhotos(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.data != null){
            return ListView.builder(
                itemCount: widget.listPhotos.length,
                itemBuilder: (BuildContext context,int index)=>Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.network(widget.listPhotos[index]['url']),
                      Container(
                        color: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child:Text(
                            '${widget.listPhotos[index]['title']}',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black
                          ),
                        )
                      )
                    ],
                  ),
                )
            );
          }else{
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }
        },
      ),
    );
  }

}