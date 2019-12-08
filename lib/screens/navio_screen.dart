import 'package:flutter/material.dart';
import 'package:porto_hack_santos/componentes/rounded_button.dart';
import 'dart:async';
import 'package:porto_hack_santos/componentes/topo.dart';
import 'package:porto_hack_santos/componentes/bottomButton.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

_getData() async {
  final response = await http.post(
    'https://educ4feelsrv.brazilsouth.cloudapp.azure.com/cargas',
    headers: {
      "apikey": "W1C1Q5han9i5AAOM0lGbXaOzEuMM25PY",
      HttpHeaders.contentTypeHeader: "application/json"
    },
    body: {"navio": "MAERSK LINS"},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> map = json.decode(response.body);
    return map;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class NavioScreen extends StatefulWidget {
  static const String id = 'navio_screen';
  @override
  _NavioScreenState createState() => _NavioScreenState();
}

class _NavioScreenState extends State<NavioScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: topoTela(nomePagina: 'Alertas'),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'MARIA',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      'Status: ATRACACAO',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
//                https://educ4feelsrv.brazilsouth.cloudapp.azure.com/cargas
                children: <Widget>[
                  Container(
                    child: Text(
                      'Tipo de carga nos conteiners:',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
//                https://educ4feelsrv.brazilsouth.cloudapp.azure.com/cargas
                children: <Widget>[
                  Container(
                    child: Text(
                      'ACUCAR A GRANEL',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/portohack-eb525.appspot.com/o/Screen%20Shot%202019-12-08%20at%2009.07.53.png?alt=media&token=7815499d-4775-4d90-afe1-91193b9aad1d',
                    width: 375,
                    height: 307,
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              RoundedButton(
                title: 'OK',
                colour: Color(0xFFFFE467),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomButton(),
      ),
    );
  }
}
