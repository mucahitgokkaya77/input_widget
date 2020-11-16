import 'package:flutter/material.dart';

class StepperKullanim extends StatefulWidget {
  @override
  _StepperKullanimState createState() => _StepperKullanimState();
}

class _StepperKullanimState extends State<StepperKullanim> {
  int _aktifStep = 0;
  String isim, mail, sifre;
  List<Step> tumStepler;
  bool hata = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tumStepler = _tumStepler();
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper Örnek"),
      ),
      body: SingleChildScrollView(
        child: Stepper(
          steps: tumStepler,
          currentStep: _aktifStep,
          /*onStepTapped: (tiklananStep) {
            setState(() {
              _aktifStep = tiklananStep;
            });
          },*/
          onStepContinue: () {
            setState(() {
              _ileriButonKontrolu();
            });
          },
          onStepCancel: () {
            setState(() {
              if (_aktifStep > 0) {
                _aktifStep--;
              } else {
                _aktifStep = 0;
              }
            });
          },
        ),
      ),
    );
  }

  List<Step> _tumStepler() {
    List<Step> stepler = [
      Step(
        title: Text("Username"),
        subtitle: Text("Kullanıcı Adınız"),
        state: _stateleriAyarla(0),
        isActive: true,
        content: TextFormField(
          key: key0,
          decoration: InputDecoration(
            labelText: "Username",
            hintText: "Kullanıcı Adı",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "Kullanıcı Adınız En Az 6 Karakter Olmalıdır";
            }
          },
          onSaved: (girilenDeger) {
            isim = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("E-Mail"),
        subtitle: Text("Mail Adresiniz"),
        state: _stateleriAyarla(1),
        isActive: true,
        content: TextFormField(
          key: key1,
          decoration: InputDecoration(
            labelText: "E-Mail",
            hintText: "Mail Adresiniz",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6 || !girilenDeger.contains("@")) {
              return "Mail Adresiniz En Az 6 Karakter Olmalıdır";
            }
          },
          onSaved: (girilenDeger) {
            mail = girilenDeger;
          },
        ),
      ),
      Step(
        title: Text("Password"),
        subtitle: Text("Şifreniz"),
        state: _stateleriAyarla(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Şifreniz",
            border: OutlineInputBorder(),
          ),
          validator: (girilenDeger) {
            if (girilenDeger.length < 6) {
              return "Şifreniz En Az 6 Karakter Olmalıdır";
            }
          },
          onSaved: (girilenDeger) {
            sifre = girilenDeger;
          },
        ),
      ),
    ];
    return stepler;
  }

  StepState _stateleriAyarla(int oAnkiStep) {
    if (_aktifStep == oAnkiStep) {
      if (hata) {
        return StepState.error;
      } else {
        return StepState.editing;
      }
    } else {
      return StepState.complete;
    }
  }

  void _ileriButonKontrolu() {
    switch (_aktifStep) {
      case 0:
        if (key0.currentState.validate()) {
          key0.currentState.save();
          hata = false;
          _aktifStep = 1;
        } else {
          hata = true;
        }
        break;
      case 1:
        if (key1.currentState.validate()) {
          key1.currentState.save();
          hata = false;
          _aktifStep = 2;
        } else {
          hata = true;
        }
        break;
      case 2:
        if (key2.currentState.validate()) {
          key2.currentState.save();
          hata = false;
          _aktifStep = 2;
          formTamamlandi();
        } else {
          hata = true;
        }
        break;
    }
  }

  void formTamamlandi() {
    debugPrint("Username:$isim  E-Mail:$mail  Password:$sifre");
  }
}
