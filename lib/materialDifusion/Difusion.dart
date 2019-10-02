import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'DetallesDifusion.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(Difusion());

class Difusion extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material de difusión",
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: DifusionData(title: "Eventos"),
    );
  }
}

class DifusionData extends StatefulWidget{
  DifusionData({Key key, this.title}): super(key:key);
  final String title;
  @override
  _DifusionDataState createState() => _DifusionDataState();
}

class _DifusionDataState extends State<DifusionData>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text("Publicaciones", style: TextStyle()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search,
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
        stream: Firestore.instance.collection('difusion').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
                child: SpinKitFadingCircle(color: Colors.blue,  size: 50.0,)
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                DocumentSnapshot materialDifusion=snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 350.0,
                            child: Padding(
                              padding: EdgeInsets.only(top:8.0,bottom:8.0),
                              child:Material(
                                color:Colors.white,
                                elevation: 14.0,
                                shadowColor: Color(0x802196F3),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 200.0,
                                          child: Image.network('${materialDifusion['url_imagen_material_dif']}',fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Text('${materialDifusion['titulo_material_dif']}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10.0),
                                        Text('${materialDifusion['tipo_material_dif']}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}