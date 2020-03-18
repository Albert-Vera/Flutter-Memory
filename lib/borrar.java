import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/BackScreen.dart';

class ScreenGame extends StatefulWidget{
    @override
    _ScreenGameState createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
    @override
    Widget build(BuildContext context) {

        return Scaffold(
                body: InkWell(

                child: Column(
                children: <Widget>[
        Container(


                color: Color(0xFF238391),



                child: Column(
                children: <Widget>[
        Stack(
                children: <Widget>[
        Container(
                margin: EdgeInsets.only(
                top: 100.0,
                bottom: 10.0,
                left: 15.0,
                right: 25.0
                        ),
        height: 500.0,
                width: 340.0,
                decoration: BoxDecoration(
                color: Colors.black,
                        ),
        child: GridView.extent(
                maxCrossAxisExtent: 120.0,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                children: gridImages(),
                        ),
                      )
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
}


    List<Widget> gridImages(){
        List<Container> containers = new List<Container>.generate(9, (int index){
//   final image = index < 0 ?
//       'image/memory0${index + 1}.jpeg ' : 'image/memory${index + 1}.jpeg';
            return new Container(
                    child: new Image.asset("image/memory$index.jpeg" ,
                    fit: BoxFit.cover
     ),
   );
        });
        return containers;
    }

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