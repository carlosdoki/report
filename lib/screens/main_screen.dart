import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porto_hack_santos/componentes/topo.dart';
import 'package:porto_hack_santos/constans.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:porto_hack_santos/componentes/bottomButton.dart';
import 'package:porto_hack_santos/screens/second_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

int _currentIndex = 0;

_getData() async {
  final response = await http
      .get('https://test.godigibee.io/pipeline/demo/v1/portohack', headers: {
    "apikey": "W1C1Q5han9i5AAOM0lGbXaOzEuMM25PY",
    HttpHeaders.contentTypeHeader: "application/json"
  });

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    return map;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  bool showSpinner = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
    );
    _fcm.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _fcm.getToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFEDEDED),
        appBar: topoTela(nomePagina: 'Alertas'),
        body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return ListView.builder(
                itemCount: snapshot.data['rowCount'] == null
                    ? 0
                    : snapshot.data['rowCount'],
                itemBuilder: (BuildContext context, int index) {
                  String dd = snapshot.data['data'][index]['sinistros'][0]
                              ["data_inicio"] ==
                          null
                      ? ''
                      : snapshot.data['data'][index]['sinistros'][0]
                              ["data_inicio"]
                          .substring(0, 10);
                  String hh = snapshot.data['data'][index]['sinistros'][0]
                              ["data_inicio"] ==
                          null
                      ? ''
                      : snapshot.data['data'][index]['sinistros'][0]
                              ["data_inicio"]
                          .substring(10);
                  String statusTxt = '';
                  List<Color> cColors = [];
                  if (snapshot.data['data'][index]['sinistros'][0]["status"] ==
                      "1") {
                    statusTxt = "INICIADO";
                    cColors = [
                      Colors.red,
                      Colors.redAccent,
                      Colors.deepOrange,
                      Colors.purpleAccent,
                    ];
                  }
                  ;
                  if (snapshot.data['data'][index]['sinistros'][0]["status"] ==
                      "2") {
                    statusTxt = "EM ANDAMENTO";
                    cColors = [
                      Colors.yellow,
                      Colors.yellowAccent,
                      Colors.amber,
                      Colors.amberAccent,
                    ];
                  }
                  ;
                  if (snapshot.data['data'][index]['sinistros'][0]["status"] ==
                      "3") {
                    statusTxt = "RESOLVIDO";
                    cColors = [
                      Colors.green,
                      Colors.greenAccent,
                      Colors.lightGreen,
                      Colors.lightGreenAccent,
                    ];
                  }
                  ;
                  return new Card(
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondScreen()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: Color(0xFFFF5C5C),
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data['data'][index]["terminal"],
                                      style: kTilteStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Data De Inicio: $dd',
                                    style: kTextStyle,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    '',
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Hora Inicio: $hh',
                                    style: kTextStyle,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    '',
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  ColorizeAnimatedTextKit(
                                    duration: Duration(milliseconds: 1000),
                                    text: ['Status: ' + statusTxt],
                                    textStyle: TextStyle(
                                      fontSize: 17.0,
                                    ),
                                    colors: cColors,
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  Text(
                                    '',
                                    style: kTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
//                    FlatButton(child: new Text(snapshot.data['data'][index]["terminal"]),),
                  );
                },
              );
          },
        ),
        bottomNavigationBar: BottomButton(),
      ),
    );
  }
}

class Listview extends StatelessWidget {
  Listview({this.context, this.snapshot});

  final BuildContext context;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    print(json.decode(snapshot.data));
//    Iterable list = json.decode(response.body);
//    users = list.map((model) => User.fromJson(model)).toList();
//
    return new Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFFF5C5C),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTilteStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Data De Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Hora Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Status:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFFF5C5C),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Santos,São Paulo',
                          style: kTilteStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Data De Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Hora Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Status:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Color(0xFFFF5C5C),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Santos,São Paulo',
                          style: kTilteStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Data De Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Hora Inicio:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Status:',
                          style: kTextStyle,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '',
                          style: kTextStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
