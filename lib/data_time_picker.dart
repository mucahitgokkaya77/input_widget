import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class TarihSaatOrnek extends StatefulWidget {
  @override
  _TarihSaatOrnekState createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime ucAyOncesi = DateTime(2020, suan.month - 3);
    DateTime yirmiGunSonrasi = DateTime(2020, 11, suan.day + 20);
    TimeOfDay suankiSaat = TimeOfDay.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Time Picker"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: suan,
                        firstDate: ucAyOncesi,
                        lastDate: yirmiGunSonrasi)
                    .then((secilenTarih) {
                  debugPrint(secilenTarih.toString());
                  debugPrint(secilenTarih.microsecondsSinceEpoch.toString());
                  debugPrint(secilenTarih.toIso8601String());
                  debugPrint(secilenTarih.toUtc().toIso8601String());
                  print(formatDate(secilenTarih, [yyyy, '-', mm, '-', dd]));
                });
              },
              color: Colors.green,
              child: Text("Tarih Seç"),
            ),
            RaisedButton(
              onPressed: () {
                showTimePicker(context: context, initialTime: suankiSaat)
                    .then((secilenSaatDegeri) {
                  debugPrint(secilenSaatDegeri.format(context));
                  debugPrint(secilenSaatDegeri.hour.toString() +
                      ":" +
                      secilenSaatDegeri.minute.toString());
                });
              },
              color: Colors.red,
              child: Text("Saat Seç"),
            ),
          ],
        ),
      ),
    );
  }
}
