import 'package:flutter/material.dart';
import 'Post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'postlistesi.dart';
import 'kullanicilistesi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Parse',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
            title: Text("Json Parçalama")
        ),
        body:KullaniciListesi(),
      )
    );
  }
}


