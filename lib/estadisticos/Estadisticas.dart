import 'package:flutter/material.dart';
import 'package:flutter_app/estadisticos/DonutAutoLabelChart.dart';
import 'package:flutter_app/estadisticos/GroupedBarChart.dart';

class Estadisticas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de estadísticas"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container( 
                width: MediaQuery.of(context).size.width-20,
                height: 350.0,
                child: Card(                  
                  child: DonutAutoLabelChart.withSampleData()),
              ),
              Container(                
                width: MediaQuery.of(context).size.width-20,
                height: 350.0,                
                child: Card(                  
                  child:GroupedBarChart.withSampleData()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}