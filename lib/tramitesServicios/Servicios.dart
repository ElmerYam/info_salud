import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'DetallesServicios.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Servicios());

class Servicios extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tramites y servicios",
      theme: ThemeData(
        primaryColor: Color(0Xff34387a),
      ),
      home: ServiciosData(title: "Tramites y servicios"),
    );
  }
}

class ServiciosData extends StatefulWidget{
  ServiciosData({Key key, this.title}): super(key:key);
  final String title;
  @override
  _ServiciosDataState createState() => _ServiciosDataState();
}

class _ServiciosDataState extends State<ServiciosData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Trámites y servicios", style: TextStyle()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search ,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: (){
              print("tested again");
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('tramites_servicios').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
                child: SpinKitFadingCircle(color: Colors.blue,  size: 50.0,));
          }else{
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot tramiteServicio=snapshot.data.documents[index];
                return Card(
                  child: InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>DetallesServicios()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.amberAccent,
                                width: 3.0,
                              ),
                            )
                        ),
                        child:  Column(
                          children: <Widget>[
                             ListTile(
                                title: Text('${tramiteServicio['nombre_ts'].toUpperCase()}', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal)),
                                subtitle: Text('${tramiteServicio['clasificacion_ts'].toUpperCase()}', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 200,200, 200)))
                            ),
                          ],
                        ),
                      )
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}