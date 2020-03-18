import 'dart:math';

import 'package:flutter/material.dart';

import 'BackScreen.dart';
import 'ScreenGame.dart';
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new BackScreen(),
          new Container(

            child: new Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container( // imagenes cabecera
                      margin: new EdgeInsets.only(
                          top: 100.0,
                          left: 50.0,
                          right: 5
                      ),

                      height: 100,
                      width: 270,
                      decoration: new BoxDecoration(
                        color: Color(0xFFf38c02), // amarillo
                      ),
                      child: new Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0,
                                  right: 150,
                                ),
                                height: 100,
                                width: 100,

                                child: new Image.asset("image/memory4.jpeg"),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 0,
                                  left: 150,
                                ),
                                height: 100,
                                width: 100,

                                child: new Image.asset("image/memory2.jpeg"),
                              )
                            ],
                          )
                        ],
                      )
                    ),
                    Container( // imagen memory
                      margin: new EdgeInsets.only(
                          top: 250.0,
                          left: 100.0,
                          right: 5
                      ),

                      height: 170,
                      width: 170,
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: Color(0xFFf38c02), // amarillo
                      ),
                      child: new Image.asset("image/titol.jpg"),

                    ),
                    Container(  //boton jugar
                      margin: EdgeInsets.only(
                        top: 500.0,
                        left: 80.0
                      ),

                      height: 50,
                        width: 200,

                      color: Colors.black26,
                      child: GestureDetector(
                        // When the child is tapped, show a snackbar.
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ScreenGame(),
                              ));
                        },
                        // The custom button
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(8.0),

                          ),
                          child: Text('Jugar',
                          textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 30.0,
                          color: Colors.black,),
                        ),
                      ),


                      ),
                    )

                  ],
                )
              ],
            ),



          )
        ],
      ),
    );new BackScreen();


  }

}