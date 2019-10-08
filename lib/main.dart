import 'package:flutter/material.dart';
import './estadisticos/Estadisticas.dart';
import './unidadesSalud/Unidades.dart';
import './materialDifusion/Difusion.dart';
import './tramitesServicios/Servicios.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  int _selectedPage = 1;
  final _pageOptions = [
    Unidades(),
    Servicios(),
    Difusion(),
    Estadisticas()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        //appBar:AppBar(title: Text('Bottom Nav Bar'),),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.location_searching),
                title: Text('Unidades')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pregnant_woman),
                title: Text('Servicios')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                title: Text('Publicaciones')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.equalizer),
                title: Text('Estadísticas')
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

// BottomNavigationBar: https://www.youtube.com/watch?v=n_FRmFm9Tyw