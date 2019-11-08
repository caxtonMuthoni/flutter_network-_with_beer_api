import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:postapi/CustomWidgets/customappbar.dart';
import 'package:postapi/CustomWidgets/drawer.dart';
import 'package:postapi/main.dart';





class DetailPage extends StatefulWidget {
  final Beer beer;

  const DetailPage({Key key, this.beer}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: MyDrawer(),
      appBar:CustomAppBar(
        title: widget.beer.name,
        onPressed: (){
          _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 40, 20,0),
        children: <Widget>[
          Text(widget.beer.name,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                letterSpacing: 2
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15,),
          Image.network(widget.beer.image_url,
          height: 100,
          width: 80,),

          Divider(
            height: 20,
            color: Colors.grey[450],
          ),
          Text(widget.beer.tagline,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'BowlbyOneSC',
              fontSize: 12,
            ),
          ),
          Text(widget.beer.description,
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'YeonSung',
          ),),
          SizedBox(height: 20,),
          Text("First Brewed in "+widget.beer.first_brewed,
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.grey[400],
          ),)
        ],
      ),
    );
  }

}



