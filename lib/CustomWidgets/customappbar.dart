import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key, this.title, this.onPressed, this.onTitleTapped, this.child}) : super(key: key);

  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:EdgeInsets.symmetric(vertical: 10,horizontal: 0) ,
        child: Center(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                iconSize: 30.0,
                onPressed: onPressed,

              ),

              Text(title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 30.0,
                ),
                iconSize: 30.0,
                onPressed: (){},

              ),

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
