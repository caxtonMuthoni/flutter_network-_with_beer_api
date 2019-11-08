import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final double height=85.0;


  const MyAppBar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(vertical: 10,horizontal: 0) ,
      height: height,
      child: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 30.0,
            ),
            Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            ),
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30.0,
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        gradient:LinearGradient(
          colors: [
            Colors.blueAccent,
            Colors.purpleAccent
          ],
          begin: FractionalOffset(0.0,0.0),
          end: FractionalOffset(1.0,0.0),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp
        ) ,
         borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70.0),
              bottomRight: Radius.circular(70.0)
          )
      )
    );
  }
}
