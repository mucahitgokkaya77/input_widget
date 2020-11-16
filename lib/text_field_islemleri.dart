import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  String girilenMetin = "";
  int maxLine = 1;
  FocusNode _fNode;
  TextEditingController textController1;
  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    textController1 = TextEditingController(text: "varsayılan");
    _fNode.addListener(() {
      setState(() {
        if (_fNode.hasFocus) {
          maxLine = 3;
        } else {
          maxLine = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    textController1.dispose();
    _fNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("İnput İslemleri"),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 24,
              width: 24,
              child: FloatingActionButton(
                onPressed: () {
                  textController1.text = "Bu Butondan Geldim";
                },
                child: Icon(
                  Icons.edit,
                  size: 14,
                ),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                debugPrint(textController1.text..toString());
              },
              child: Icon(Icons.edit),
              mini: true,
              backgroundColor: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                FocusScope.of(context).requestFocus(_fNode);
              },
              child: Icon(Icons.edit),
            ),
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //klavyede sadece sayi
                textInputAction: TextInputAction.done,
                //tik işareti
                autofocus: false,
                maxLines: maxLine,
                //satir sayisi
                maxLength: 20,

                //max karakter
                focusNode: _fNode,
                controller: textController1,
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  hintText: "Metni Buraya Yazınız",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.done),
                  suffixIcon: Icon(Icons.add),
                  filled: true,
                  fillColor: Colors.red.shade50,
                ),
                onChanged: (String s) => debugPrint("On change: $s"),
                onSubmitted: (String s) {
                  debugPrint("On submit : $s");
                  girilenMetin = s;
                },
                cursorColor: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.number,
                //klavyede sadece sayi
                textInputAction: TextInputAction.done,
                //tik işareti
                autofocus: false,
                maxLines: 1,
                //satir sayisi
                maxLength: 20,
                //max karakter
                maxLengthEnforced: true,
                decoration: InputDecoration(
                  hintText: "Metni Buraya Yazınız",
                  labelText: "Başlık",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.done),
                  suffixIcon: Icon(Icons.add),
                  filled: true,
                  fillColor: Colors.red.shade50,
                ),
                onChanged: (String s) => debugPrint("On change: $s"),
                onSubmitted: (String s) {
                  debugPrint("On submit : $s");
                  girilenMetin = s;
                },
                cursorColor: Colors.pink,
              ),
            ),
            Container(
              color: Colors.red.shade300,
              margin: EdgeInsets.all(10),
              width: double.infinity,
              height: 200,
              child: Align(
                alignment: Alignment.center,
                child: Text(girilenMetin),
              ),
            ),
          ],
        ));
  }
}
