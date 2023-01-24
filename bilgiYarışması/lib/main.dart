import 'package:flutter/material.dart';
import 'constans.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<bool> yanitlar = [false, true, false, true, true, false];

  List<Soru> soruHavuzu = [
    Soru(
        soruMetni:
            'Futbol dalında altın ayakkabı alan sporcumuz Tanju Çolak tır..',
        soruYaniti: true),
    Soru(
        soruMetni: 'İlk yazılım bir kadın tarfından gerçekleştirilmiştir',
        soruYaniti: true),
    Soru(soruMetni: 'İlk yerli tiyatro eseri Şinasidir.', soruYaniti: true),
    Soru(soruMetni: 'İstanbul en kalabalık şehridir', soruYaniti: false),
    Soru(
        soruMetni: 'Çocuk haklari günü 20 Kasım tarihinde kutlanmaktadir ?',
        soruYaniti: true),
    Soru(
        soruMetni: 'En geniş ormanlık alana sahip bölgemiz Akdenizdir',
        soruYaniti: false),
  ];

  int soruIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruHavuzu[soruIndex].soruMetni,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              soruHavuzu[soruIndex].soruYaniti == false
                                  ? secimler.add(kDogruIconu)
                                  : secimler.add(kYanlisIconu);
                              soruIndex++;
                              // secimler.add(kYanlisIconu);
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: RaisedButton(
                          padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              soruHavuzu[soruIndex].soruYaniti == true
                                  ? secimler.add(kDogruIconu)
                                  : secimler.add(kYanlisIconu);
                              soruIndex++;
                              //secimler.add(kDogruIconu);
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

class Soru {
  String soruMetni;
  bool soruYaniti;
  Soru({required this.soruMetni, required this.soruYaniti});
}
