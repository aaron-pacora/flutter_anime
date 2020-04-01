import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  String imageUrl = "https://vignette.wikia.nocookie.net/key/images/e/ec/CLANNAD_visual_novel.jpg/revision/latest?cb=20160514100833&path-prefix=es";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      bottomNavigationBar: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36)
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Inicio")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video),
              title: Text("En emisión")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text("Mi lista")
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text("Más")
            ),
          ],
        ),
      ),
      body: ListView(
        // padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 6,
                height: 14,
                color: Theme.of(context).accentColor,
              ),
              Text("Lunes, 30 de Marzo, 2020")
            ],
          ),
          getCard(title: "Anohana", subtitle: "Pelicula", urlImage: imageUrl,),
          getCard(title: "ELfen Lied", subtitle: "Pelicula", urlImage: imageUrl,),
          getCard(title: "Litter Busted!", subtitle: "Pelicula", urlImage: imageUrl,),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                width: 6,
                height: 14,
                color: Theme.of(context).accentColor,
              ),
              Text("Domingo, 29 de Marzo, 2020")
            ],
          ),
          getCard(title: "Anohana", subtitle: "Pelicula", urlImage: imageUrl,),
          getCard(title: "Anohana", subtitle: "Pelicula", urlImage: imageUrl,),
          getCard(title: "Anohana", subtitle: "Pelicula", urlImage: imageUrl,),
        ],
      ),
    );
  }

  Widget getCard({@required String title, @required String urlImage, @required String subtitle}){
    double heigthContainer = 100;
    return Stack(
      children: <Widget>[
        Card(
          margin: EdgeInsets.only(top: 10, left: 0, right: 12, bottom: 10),
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(36),
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: heigthContainer,
            child: Row(
              children: <Widget>[
                Container(
                  width: heigthContainer,
                  height: heigthContainer,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    placeholder: (context, url) => Container(
                      child: Center(child: CircularProgressIndicator(),)
                    ),
                    errorWidget: (context, url, error) => Container(
                      child: Center(child: CircularProgressIndicator(),)
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                title,
                                style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis, maxLines: 4,
                              )
                            ),
                            InkWell(
                              child: ClipRect(
                                child: Container(
                                  padding: EdgeInsets.only(left: 4, right: 4, top: 12, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                  ),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                    child: Icon(Icons.bookmark_border),
                                  )
                                ),
                              ),
                              onTap: (){
                                print("add to my list");
                              },
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(subtitle, style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor))
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            onTap: (){
              print("reproduce :v");
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).accentColor
              ),
              child: Icon(Icons.play_arrow, size: 28,),
            ),
          ),
        )
      ],
    );
  }
}