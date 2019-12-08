import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:porto_hack_santos/componentes/rounded_button.dart';
import 'dart:async';
import 'package:porto_hack_santos/componentes/topo.dart';
import 'package:porto_hack_santos/componentes/bottomButton.dart';
import 'package:pinch_zoom_image/pinch_zoom_image.dart';

class SecondScreen extends StatefulWidget {
  static const String id = 'second_screen';
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PinchZoomImage(
                    image: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/portohack-eb525.appspot.com/o/Screen%20Shot%202019-12-08%20at%2009.07.53.png?alt=media&token=7815499d-4775-4d90-afe1-91193b9aad1d',
                      width: 375,
                      height: 307,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: ColorizeAnimatedTextKit(
                      duration: Duration(milliseconds: 1000),
                      text: ['Status: INICIADO'],
                      textStyle: TextStyle(
                        fontSize: 17.0,
                      ),
                      colors: [
                        Colors.red,
                        Colors.redAccent,
                        Colors.deepOrange,
                        Colors.purpleAccent,
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'AÇÕES: EM ALERTA',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              RoundedButton(
                title: 'OK',
                colour: Color(0xFFFFE467),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),

//        body: GoogleMap(
//          mapType: MapType.hybrid,
//          initialCameraPosition: CameraPosition(
//            target: LatLng(40.688841, -74.044015),
//            zoom: 11,
//          ),
//        ),
        bottomNavigationBar: BottomButton(),
      ),
    );
  }
}
