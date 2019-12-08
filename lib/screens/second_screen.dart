import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:porto_hack_santos/constans.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:porto_hack_santos/componentes/topo.dart';
import 'package:porto_hack_santos/componentes/bottomButton.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SecondScreen extends StatefulWidget {
  static const String id = 'second_screen';
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: topoTela(nomePagina: 'Alertas'),
        body: WebView(
          initialUrl:
              'https://www.marinetraffic.com/en/ais/home/centerx:-46.342/centery:-23.943/zoom:13',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
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
