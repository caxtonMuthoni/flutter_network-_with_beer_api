import 'package:flutter/material.dart';
import 'package:postapi/main.dart';



class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purpleAccent,Colors.blueAccent],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            subtitle: Text("Move back to home page"),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Home(),fullscreenDialog: true));
            },
          ),
          Divider(height: 30.0,
          color: Colors.grey,),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          Divider(height: 30.0,
            color: Colors.grey,),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('About App'),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
            },
          ),
          Divider(height: 30.0,
            color: Colors.grey,),
        ],
      ),
    );
  }
}
