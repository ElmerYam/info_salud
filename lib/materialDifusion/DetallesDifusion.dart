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
        title: Text(tipo, style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.black,        
      ),
      body: ListView(        
          children:<Widget>[
            Column(
                children: <Widget>[                  
                  Container(
                    child: Image.network(imagen, fit: BoxFit.fill,),
                  ),
                  tipo!='infografia'? Container(
                    padding: EdgeInsets.all(6.0),
                    //color: Colors.white,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(titulo, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800)),
                  ):
                  SizedBox(height: 10.0,),
                  tipo!='infografia'? Container(
                    padding: EdgeInsets.all(15.0),
                    child:Text(descripcion),):
                    Container(),
                ],
              ),
          ],
      ),
    );
  }
}