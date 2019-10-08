import 'package:flutter/material.dart';
import 'package:flutter_app/tramitesServicios/Servicios.dart';

class DetallesServicios extends StatelessWidget {
  final Servicio servicio;

  DetallesServicios({ this.servicio });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del ${servicio.clasificacion}"),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(              
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.teal,
                  child: Text(servicio.nombre, style: TextStyle(fontWeight: FontWeight.bold, color:Colors.white),),
                ),
              ),
              Card(              
              child: Container(
                decoration:BoxDecoration(
                  border: Border.all(color: Colors.teal),
                ),
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Objetivo:", style: TextStyle( fontWeight: FontWeight.w700, color:Colors.teal)),                    
                    Text(servicio.descripcion[0].toUpperCase()+servicio.descripcion.substring(1)),
                    Divider(),                    
                    Text("Modalidad:", style: TextStyle(fontWeight: FontWeight.w700, color:Colors.teal)),
                    SizedBox(width: 10.0,),
                    Text(servicio.modalidad[0].toUpperCase()+servicio.modalidad.substring(1)),
                    Divider(),                    
                    Text("Costo:", style: TextStyle(fontWeight: FontWeight.w700, color:Colors.teal)),
                    SizedBox(width: 10.0,),
                    Text(servicio.costo[0].toUpperCase()+servicio.costo.substring(1)),                      
                    Divider(),                    
                    Text("Tiempo de respuesta:", style: TextStyle(fontWeight: FontWeight.w700, color:Colors.teal)),
                    SizedBox(width: 10.0,),
                    Text(servicio.tiempo_respuesta[0].toUpperCase()+servicio.tiempo_respuesta.substring(1)),                        
                    Divider(),
                    Text("Observaciones:", style: TextStyle( fontWeight: FontWeight.w700, color:Colors.teal)),                    
                    Text(servicio.observaciones[0].toUpperCase()+servicio.observaciones.substring(1)),
                    Divider(),
                  ],
                ),
              ),
            ),
            ],
          ),
        ],
      ),        
    );
  }
}