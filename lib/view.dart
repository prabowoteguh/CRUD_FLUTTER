// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Detail.dart';
import 'tambah.dart';
import 'homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  Future<List> getData() async{
    final String url = "https://kelompok.kangoding.com/getdata.php";
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Mahasiswa",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Color.fromARGB(255, 18, 170, 152),actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Data',
            onPressed: () {
              Navigator.of(context).pushReplacement(new MaterialPageRoute(
                  builder: (BuildContext context) => new AddData()));
            },
          ),
        ],
      ),
      body: Container(
        
        child: new FutureBuilder<List>(
          
          future: getData(),
          builder: (context,snapshot){
            if(snapshot.hasError) print(snapshot.error);
            

            return snapshot.hasData 
            ? new ItemList(list: snapshot.data!,) 
            : new Center(
              child: new CircularProgressIndicator(),
            );
          },

        ),
      ),
      
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          child: new GestureDetector(
            onTap: () =>
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                          list: list,
                          index: i,
                        ))),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  list[i]['nama'],
                  style: TextStyle(fontFamily: "Netflix"),
                ),
                subtitle: new Text("NIM : ${list[i]['nim']}"),
              ),
            ),
          ),
        );
      },
    );
  }

}

