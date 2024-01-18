import 'package:flutter/material.dart';

import 'Accueil.dart';
import 'emploi.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
 int selectedIndex = 0;
class _MyHomePageState extends State<MyHomePage> {
 
  static  TextStyle optionStyle =
      const TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static  final List<Widget> _widgetOptions = <Widget>[
  PresentationPage(),
  TimetableView(),
   dwarerHeadF('Index 2:'),
    dwarerHeadF('Index 2:'),
  ];


static dwarerHeadF(text)
{
  return  Text(
      text,
      style: optionStyle,
    );
}

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: _widgetOptions[selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('OFPPT ISTA Maamora Kenitra'),
            ),
            dRawerdata('Accueil',0),
            dRawerdata('Affichage d\'emploi du temps',1),
            dRawerdata('Espace d\'affichage',2),
            dRawerdata('Le règlement intérieur',3),
      
          ],
        ),
      ),
    );
  }


dRawerdata(text,id)
{
   return  ListTile(
              title:  Text(text),
              selected: selectedIndex == id,
              onTap: () {
                // Update the state of the app
                _onItemTapped(id);
                // Then close the drawer
                Navigator.pop(context);
                
              },
            );
      
  
}


}