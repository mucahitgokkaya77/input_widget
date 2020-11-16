import 'package:flutter/material.dart';

class DigerFormElemanlari extends StatefulWidget {
  @override
  _DigerFormElemanlariState createState() => _DigerFormElemanlariState();
}

class _DigerFormElemanlariState extends State<DigerFormElemanlari> {
  bool checkBoxState = false;
  String sehir = "";
  double sliderDeger = 0;
  String secilenRenk = "Kirmizi";
  bool switchState = false;
  List<String> sehirler = ["Ankara", "İzmir", "İstanbul", "Yalova"];
  String secilenSehir = "Ankara";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: Text("Diğer Form Elemanları"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Slider(
              value: sliderDeger,
              onChanged: (deger) {
                setState(() {
                  sliderDeger = deger;
                });
              },
              min: 0,
              max: 10,
              divisions: 20,
              label: sliderDeger.toString(),
            ),
            CheckboxListTile(
              value: checkBoxState,
              onChanged: (secildi) {
                setState(() {
                  checkBoxState = secildi;
                });
              },
              activeColor: Colors.teal,
              title: Text("CheckBox Başlık"),
              subtitle: Text("CheckBox Alt Başlık"),
              secondary: Icon(Icons.add),
              selected: true,
            ),
            RadioListTile(
              value: "Ankara",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen Şehir: $deger");
                });
              },
              title: Text(
                "Ankara",
                style: TextStyle(color: Colors.teal.shade300),
              ),
              subtitle: Text(
                "RadioList Alt Başlık",
                style: TextStyle(color: Colors.teal.shade300),
              ),
              secondary: Icon(Icons.add),
              activeColor: Colors.teal.shade300,
            ),
            RadioListTile(
              value: "İzmir",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen Şehir: $deger");
                });
              },
              title: Text(
                "İzmir",
                style: TextStyle(color: Colors.teal.shade500),
              ),
              subtitle: Text(
                "RadioList Alt Başlık",
                style: TextStyle(color: Colors.teal.shade500),
              ),
              secondary: Icon(Icons.add),
              activeColor: Colors.teal.shade500,
            ),
            RadioListTile(
              value: "Yalova",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger;
                  debugPrint("Seçilen Şehir: $deger");
                });
              },
              title: Text(
                "Yalova",
                style: TextStyle(color: Colors.teal.shade700),
              ),
              subtitle: Text(
                "RadioList Alt Başlık",
                style: TextStyle(color: Colors.teal.shade700),
              ),
              secondary: Icon(Icons.add),
              activeColor: Colors.teal.shade700,
            ),
            SwitchListTile(
              value: switchState,
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                });
              },
              title: Text("Sözleşmeyi Onayla"),
              subtitle: Text("Kabul Ediyormusun"),
              secondary: Icon(Icons.refresh),
            ),
            DropdownButton(
              items: [
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        color: Colors.red,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Kırmızı"),
                    ],
                  ),
                  value: "Kirmizi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        color: Colors.blue,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Mavi"),
                    ],
                  ),
                  value: "Mavi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 24,
                        color: Colors.green,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text("Yeşil"),
                    ],
                  ),
                  value: "Yesil",
                ),
              ],
              onChanged: (secilen) {
                setState(() {
                  secilenRenk = secilen;
                });
              },
              hint: Text("Seçiniz"),
              value: secilenRenk,
            ),
            DropdownButton<String>(
              items: sehirler.map((oAnkiDeger) {
                return DropdownMenuItem<String>(
                  child: Text(oAnkiDeger),
                  value: oAnkiDeger,
                );
              }).toList(),
              onChanged: (secilen) {
                setState(() {
                  secilenSehir = secilen;
                });
              },
              value: secilenSehir,
            ),
          ],
        ),
      ),
    );
  }
}
