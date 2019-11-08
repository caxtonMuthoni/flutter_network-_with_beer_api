import 'dart:convert';

import 'package:awesome_loader/awesome_loader.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postapi/screens/detail_page.dart';
class Beer{
  final String tagline;
  final String description;
  final String image_url;
  final String name;
  final String first_brewed;

  Beer(this.tagline, this.description, this.image_url, this.name, this.first_brewed);


}


void main()=>runApp(MaterialApp(
 home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Beer>> _getBeers() async{
    var response = await  http.get("https://api.punkapi.com/v2/beers");
    var jsonData = json.decode(response.body);
    List<Beer> beers =[];
    for(var br in jsonData){
      Beer beer=Beer(br['tagline'], br["description"], br["image_url"],br["name"],br["first_brewed"]);
      beers.add(beer);
    }
    print(beers);
    return beers;
  }
  final _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        title: Text("Favorite beers"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body:FutureBuilder(
        future: _getBeers(),
          builder: (BuildContext context,AsyncSnapshot snapshot){
            if (snapshot.data == null) {
              return Center(child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AwesomeLoader(
                    loaderType: AwesomeLoader.AwesomeLoader2,
                    color: Colors.deepPurple,
                  ),
                  Text("Loading data...."),
                ],
              ));

            }
            else{
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context,index){
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading:CircleAvatar(
                            backgroundImage: NetworkImage(snapshot.data[index].image_url),
                          ),
                          title: Text(snapshot.data[index].name,
                          style: TextStyle(
                            fontFamily: "BowlbyOneSC",
                            color: Colors.deepPurple,
                          ),),
                          subtitle: Text(snapshot.data[index].description,
                          style: TextStyle(
                            fontFamily: "YeonSung"
                          ),),


                          onTap: (){

                           Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(beer:snapshot.data[index])));
                          },

                        ),
                        Divider(
                          color: Colors.deepPurple,
                          height: 30,
                        ),
                      ],
                    );
                  });
            }

          }
      ) ,
    );
  }
}
