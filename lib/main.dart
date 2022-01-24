// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  int score = 9998;

  var textoIteso =
      "El ITESO, Universidad Jesuita de Guadalajara es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.";
  var pressedLike = false;
  var pressedDislike = false;

  var _pressedEmail = false;
  var _pressedTel = false;
  var _pressedDir = false;

  Color _likeColor = Colors.black;
  Color _dislikeColor = Colors.black;
  Color _emailColor = Colors.black;
  Color _callColor = Colors.black;
  Color _dirColor = Colors.black;

  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Iteso'),
        ),
        body: Column(
          children: [
            Image.network(
              "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("El ITESO, Universidad Jesuita de Guadalajara",
                        style: TextStyle(
                            fontSize: 13.0, fontWeight: FontWeight.bold)),
                    subtitle: Text("San Pedro Tlaquepaque, Jal."),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pressedLike = !pressedLike;
                              _likeColor = Colors.yellow;
                              if (pressedLike == true) {
                                score += 1;
                                _likeColor = Colors.blue;
                              } else {
                                score -= 1;
                                _likeColor = Colors.black;
                              }
                            });
                            print(pressedLike);
                          },
                          icon: Icon(Icons.thumb_up, color: _likeColor),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pressedDislike = !pressedDislike;
                              _dislikeColor = Colors.yellow;
                              if (pressedDislike == true) {
                                score -= 1;
                                _dislikeColor = Colors.red;
                              } else {
                                score += 1;
                                _dislikeColor = Colors.black;
                              }
                            });
                            print(pressedDislike);
                          },
                          icon: Icon(Icons.thumb_down, color: _dislikeColor),
                        ),
                      ],
                    ),
                    Text(score.toString()),
                  ],
                )
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Row contents horizontally,
              crossAxisAlignment:
                  CrossAxisAlignment.center, //Center Row contents vertically,
              children: [
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _pressedEmail = !_pressedEmail;
                          if (_pressedEmail == true) {
                            _emailColor = Colors.blue;
                          } else {
                            _emailColor = Colors.black;
                          }
                        });
                        _messengerKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Email Copiado al Portapapeles'),
                          action: SnackBarAction(
                            label: 'Cerrar',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                        print("Pressed Email button");
                      },
                      icon: Icon(Icons.mail),
                      iconSize: 45.0,
                      color: _emailColor,
                    ),
                    Text("Correo")
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _pressedTel = !_pressedTel;
                          if (_pressedTel == true) {
                            _callColor = Colors.blue;
                          } else {
                            _callColor = Colors.black;
                          }
                        });
                        _messengerKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Telefono Copiado al Portapapeles'),
                          action: SnackBarAction(
                            label: 'Cerrar',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                        print("Clicked");
                      },
                      icon: Icon(Icons.add_call),
                      iconSize: 45.0,
                      color: _callColor,
                    ),
                    Text("Llamada")
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _pressedDir = !_pressedDir;
                          if (_pressedDir == true) {
                            _dirColor = Colors.blue;
                          } else {
                            _dirColor = Colors.black;
                          }
                        });
                        _messengerKey.currentState!.showSnackBar(SnackBar(
                          content: Text('Direccion Copiada al Portapapeles'),
                          action: SnackBarAction(
                            label: 'Cerrar',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        ));
                        print("Clicked");
                      },
                      icon: Icon(Icons.directions),
                      iconSize: 45.0,
                      color: _dirColor,
                    ),
                    Text("Ruta")
                  ],
                ),
                Spacer()
              ],
            ),
            Spacer(),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 20, 35, 30),
                child: Text(
                  textoIteso,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
