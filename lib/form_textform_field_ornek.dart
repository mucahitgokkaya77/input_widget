import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormveTextFormField extends StatefulWidget {
  @override
  _FormveTextFormFieldState createState() => _FormveTextFormFieldState();
}

class _FormveTextFormFieldState extends State<FormveTextFormField> {
  String _adSoyad, _email, _sifre;
  bool otomatikKontrol = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.indigo,
          accentColor: Colors.red,
          hintColor: Colors.teal,
        ),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.save),
          ),
          appBar: AppBar(
            title: Text("Form ve TextFormField"),
          ),
          body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              // ignore: deprecated_member_use
              autovalidate: otomatikKontrol,
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_circle),
                      hintText: "Adınız ve Soyadınız",
                      labelText: "AD SOYAD",
                      border: OutlineInputBorder(),
                    ),
                    validator: _isimKontrol,
                    onSaved: (deger) => _adSoyad = deger,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "E-Mail adresiniz",
                      labelText: "E-MAİL",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2,
                      )),
                    ),
                    validator: _emailKontrol,
                    onSaved: (deger) => _email = deger,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Şifreniz",
                      labelText: "ŞİFRE",
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2,
                      )),
                    ),
                    validator: (String girilenVeri) {
                      if (girilenVeri.length < 6) {
                        return "Şifre en az 6 karakter olmalı";
                      }
                    },
                    onSaved: (deger) => _sifre = deger,
                  ),
                  SizedBox(height: 10),
                  RaisedButton.icon(
                    icon: Icon(Icons.save),
                    onPressed: _girisBilgileriniOnayla,
                    label: Text("KAYDET"),
                    color: Colors.teal,
                    disabledColor: Colors.teal,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _girisBilgileriniOnayla() {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      debugPrint(
          "Girilen ad soyad: $_adSoyad   Girilen e-mail: $_email   Girilen şifre: $_sifre");
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  String _isimKontrol(String isim) {
    RegExp regex = RegExp("^[a-zA-Z]+\$");
    if (!regex.hasMatch(isim))
      return 'Isim numara içermemeli';
    else
      return null;
  }
}
