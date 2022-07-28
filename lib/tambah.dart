import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'view.dart';
import 'dart:async';
import 'dart:convert';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "https://kelompok.kangoding.com/adddata.php";

    http.post(Uri.parse(url), body: {
      "nama": controllerCode.text,
      "nim": controllerName.text,
      "jurusan": controllerPrice.text,
      "angkatan": controllerStock.text
    });
  }

  void error(BuildContext context, String error) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(error),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tambah Data", style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor:Color.fromARGB(255, 18, 170, 152),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerCode,
                  decoration: new InputDecoration(
                      hintText: "Nama",
                      labelText: "Nama",),
                ),
                new TextField(
                  controller: controllerName,
                  style: TextStyle(fontFamily: "Netflix", fontSize: 15),
                  decoration: new InputDecoration(
                      hintText: "NIM",
                      hintStyle: TextStyle(fontFamily: "Netflix"),
                      labelText: "NIM"),
                ),
                
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                          //Navigator.pop(context);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text("Kembali", style: TextStyle(color: Colors.white),),
                        color:Color.fromARGB(255, 18, 170, 152),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: RaisedButton(
                        onPressed: () {
                         
                            addData();
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          

                          // Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          //     builder: (BuildContext context) => new Home()));
                        },
                        child: new Text(
                          "Tambah Data",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
