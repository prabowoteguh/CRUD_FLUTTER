import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'view.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerCode;
  late TextEditingController controllerName;
  late TextEditingController controllerPrice;
  late TextEditingController controllerStock;

  void editData() {
    var url = "https://kelompok.kangoding.com/editdata.php";
    http.post(Uri.parse(url), body: {
      "id": widget.list[widget.index]['id'],
      "nama": controllerCode.text,
      "nim": controllerName.text,
    });
  }

  @override
  void initState() {
    controllerCode =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['nim']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['jurusan']);
    controllerStock =
        new TextEditingController(text: widget.list[widget.index]['angkatan']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Ubah Data",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Color.fromARGB(255, 18, 170, 152),
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
                      hintText: "Nama", labelText: "Nama"),
                ),
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "NIM", labelText: "NIM"),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    child: new Text(
                      "Edit Data",
                      style:
                          TextStyle(fontFamily: "Netflix", color: Colors.white),
                    ),
                    color: Color.fromARGB(255, 18, 170, 152),
                    onPressed: () {
                      editData();
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                  child: Text("Kembali ke menu", style: TextStyle(fontFamily: "Netflix", color: Colors.white),),
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
