import 'package:flutter/material.dart';

class DetallesDifusion extends StatelessWidget {
  String titulo;
  String descripcion;
  String imagen;
  String tipo;
  DetallesDifusion({Key key, @required this.titulo, @required this.descripcion, @required this.imagen,@required this.tipo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tipo),
      ),
      body: ListView(        
          children:<Widget>[
            Card(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.orange,
                    child: Text(titulo),
                  ),                  
                  SizedBox(height: 10.0,),
                  Container(
                    child: Image.network(imagen),
                  ),
                  SizedBox(height: 10.0,),
                  Text(descripcion),
                ],
              ),
          ),
          ],
      ),
    );
  }
}