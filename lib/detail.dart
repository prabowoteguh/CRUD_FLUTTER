import 'package:flutter/material.dart';
import 'ubah.dart';
import 'package:http/http.dart' as http;
import 'view.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({required this.index, required this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "https://kelompok.kangoding.com/deleteData.php";
    http.post(Uri.parse(url), body: {'id': widget.list[widget.index]['id']});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return Home();
    }));
    _DeleteData(context, "Data dihapus!");
  }

  void _DeleteData(BuildContext context, String error) {
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
        title: new Text(
          "Mahasiswa",
          style: TextStyle(fontFamily: "Netflix"),
        ),
        backgroundColor: Color.fromARGB(255, 18, 170, 152),actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Hapus Data',
            onPressed: () => deleteData(),
          ),
        ],
      ),
      body: new Container(
        height: 370.0,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  "Nama : "+widget.list[widget.index]['nama'],
                  style: new TextStyle(fontFamily: "Netflix", fontSize: 20.0),
                ),
                new Text(
                  "NIM : ${widget.list[widget.index]['nim']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                new Column(
                  //mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: new RaisedButton(
                        child: new Text(
                          "Ubah",
                          style: TextStyle(
                              fontFamily: "Netflix", color: Colors.white),
                        ),
                        color: Colors.green,
                        onPressed: () => Navigator.of(context)
                            .pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context) => new EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                    ),
                   
                  ],
                ),
                // new Padding(
                //   padding: const EdgeInsets.only(top: 30.0),
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Kembali",
                      style: TextStyle(color: Colors.white),
                    ),
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
          ),
        ),
      ),
    );
  }
}
