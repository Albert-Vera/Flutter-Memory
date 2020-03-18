import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Stack(
        children: <Widget>[
        new GradientBack(),
    new Container(
      margin:EdgeInsets.only(
        top: 50.0,
        bottom: 40.0,
        right: 40.0,
        left: 40.0
      ),
          decoration: new BoxDecoration(
            border: Border.all(),
              color: Colors.white,
              boxShadow: [
                new BoxShadow(
                    color: Color(0xFFc5cdd9),

                    offset: new Offset(10.0, 10.0),
                    blurRadius: 10.0
                )
              ],
              borderRadius: new BorderRadius.circular(30.0),

              gradient: new LinearGradient(
          colors: [
          Color(0xFFf38c02),
          Color(0xFFf38c02)
        ],
        begin: const FractionalOffset(1.0,0.1 ),
        end: const FractionalOffset(1.0, 0.9)
    )
    ),
    ),
    ],
    );
  }


}
class GradientBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
         color: Colors.black12,
      ),
    );
  }

}