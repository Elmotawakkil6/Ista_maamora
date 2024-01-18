// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'Accueil.dart';
import 'DrawerHeader.dart';
import 'home.dart';


class MainP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Emplois du temps d\'ISTA Maamora',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white)),
          backgroundColor: Colors.lightBlue
        ),
        drawer:  MyHomePage(title: "OFPPT ISTA Maamora Kenitra"),
        body: HomePage(),
      ),
    );
  }
}

