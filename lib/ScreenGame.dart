import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/BackScreen.dart';

import 'Home.dart';




int level = 6;
var tamanyCuadricula = 2;
var puntuacion = 0;

class ScreenGame extends StatefulWidget{

  final int size;

  const ScreenGame({Key key, this.size = 6}) : super(key: key);


  @override
  _ScreenGameState createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {


  List<GlobalKey<FlipCardState>> cardStateKeys = [];
  List<bool> cardFlips = [];
  List<String> data = [];  // cartas
  int previousIndex = -1;
  var flip = false;

  var time = 0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.size; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
      cardFlips.add(true);
    }
    for (var i = 0; i < widget.size / 2; i++) {  // cartas
      data.add(i.toString());
    }
    for (var i = 0; i < widget.size / 2; i++) {  // duplicado de las cartas
      data.add(i.toString());
    }
    startTimer();
    data.shuffle();  // Con shuffle ... saca un lista de forma aleatoria
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.black,
//      ),
        body: InkWell(

            child: Column(
              children: <Widget>[
                Container(  // fondo pantalla
                    color: Color(0xFFc5cdd9),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(  // container timer
                              margin: EdgeInsets.only(
                                top: 50.0,
                                left: 15.0,
                                right: 25.0,
                              ),
                              height: 35.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: new BorderRadius.circular(10.0),

                              ),
                              child: Center(
                              child: Text(
                                "Tiempo: $time" + "  Puntos: $puntuacion",
                                style: TextStyle(
                                  fontSize: 30.0,

                                ),
                              ),

                            ),
                            ),// Timer
                            Container(  // tablero juego
                              margin: EdgeInsets.only(
                                  top: 100.0,
                                  bottom: 10.0,
                                  left: 15.0,
                                  right: 25.0
                              ),
                              height: 500.0,
                              width: 340.0,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: new BorderRadius.circular(10.0),

                              ),
                              child: GridView.builder( // grid de juego
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: tamanyCuadricula,
                                ),
                                itemBuilder: (context, index) => FlipCard(
                                  key: cardStateKeys[index],
                                  onFlip: () {  // voltea la carta
                                    if (!flip) {
                                      flip = true;
                                      previousIndex = index;
                                    } else {
                                      flip = false;
                                      if (previousIndex != index) {
                                        if (data[previousIndex] != data[index]) {
                                          cardStateKeys[previousIndex]
                                              .currentState
                                              .toggleCard();
                                          previousIndex = index;
                                        } else {
                                          cardFlips[previousIndex] = false;
                                          cardFlips[index] = false;
                                          print(cardFlips);
                                          puntuacion ++;

                                          if (cardFlips.every((t) => t == false)) {
                                            print("Ganaste");
                                            showResult();
                                          }
                                        }
                                      }
                                    }
                                  },
                                  direction: FlipDirection.HORIZONTAL,
                                  flipOnTouch: cardFlips[index],
                                  front: Container( //  carta cubierta
                                    margin: EdgeInsets.all(4.0),
                                  //  color: Colors.black26.withOpacity(0.7),
                                    decoration: BoxDecoration(
                                      color: Colors.black26.withOpacity(0.7),
                                      borderRadius: new BorderRadius.circular(60.0),

                                    ),
                                  ),
                                  back: Container( //  carta descubierta
                                    margin: EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: new BorderRadius.circular(60.0),

                                    ),
                                    //color: Colors.deepPurple,
                                    child: Center(
                                      child: Text(
                                        "${data[index]}", // valor carta
                                        style: Theme.of(context).textTheme.display2,
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: data.length,
                              ),
                            ), // Tablero
                            Container(  // boton Reiniciar
                              margin: EdgeInsets.only(
                                top: 605.0,
                                right: 25.0,
                                left: 15.0,

                              ),
                                height: 35.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                              child:  GestureDetector(
                                onTap: () {
                                  level = 6;
                                  tamanyCuadricula = 2;
                                  puntuacion = 0;
                                  Navigator.push(

                                      context,
                                      MaterialPageRoute(

                                        builder: (context) => ScreenGame(),

                                      ));
                                },
                                child: Center(
                                child: Text(
                                  "Reiniciar",
                                  style: TextStyle(
                                    fontSize: 30.0,

                                  ),
                                ),

                              ),
                              ),
                            ),// Reiniciar
                          ],
                        )

                      ],
                    )
                ),

              ],
            )
        )
    );
  }
  showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("Lo lograste!!!"),
        content: Text(
          "Tiempo: $time",
          style: Theme.of(context).textTheme.display2,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => ScreenGame(
                    size: level,
                  ),
                ),
              );
              if (level < 24) {
                level *= 2;
                tamanyCuadricula++;
              }
              if (level == 24 ){
                level += 6;
                tamanyCuadricula++;
              }

            },
            child: Text("Continuar"),
          ),
        ],
      ),
    );
  }
}










//List<Widget> gridImages(){
//  List<Container> containers = new List<Container>.generate(9, (int index){
////   final image = index < 0 ?
////       'image/memory0${index + 1}.jpeg ' : 'image/memory${index + 1}.jpeg';
//    return new Container(
//      child: new Image.asset("image/memory$index.jpeg" ,
//          fit: BoxFit.cover
//      ),
//    );
//  });
//  return containers;
//}

//List<Widget> gridImages(){
//  Container(
//    child: OrientationBuilder(builder: (context, orientation) {
//      return GridView.count(
//        crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
//        crossAxisSpacing: 2.0,
//        children: List.generate(6, (index){
//          return Image.asset("image/memory$index.jpeg",
//          width: 200.0,
//          height: 200.0,
//          );
//        }),
//      );
//    },
//    ),
//  );
//}