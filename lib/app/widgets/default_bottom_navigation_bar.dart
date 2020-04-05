import 'package:flutter/material.dart';

class DefaultBottomNavigationBar extends StatefulWidget {
  const DefaultBottomNavigationBar({Key key}) : super(key: key);

  @override
  _DefaultBottomNavigationBarState createState() => _DefaultBottomNavigationBarState();
}

class _DefaultBottomNavigationBarState extends State<DefaultBottomNavigationBar> {

  List<BottomNavigationBarItem> items = [
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
  ];

  double heigthUnderline = 10;
  double width = 0;
  double _getIndicatorPosition(int index) => (-1 + (2 / (items.length - 1) * index));

  Duration duration = Duration(milliseconds: 270);

  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    double widthItem = width / items.length;

    return Stack(
      children: <Widget>[
        BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Theme.of(context).accentColor,
          items: items,
          currentIndex: currentPosition,
          onTap: (int indexToSelected){
            setState(() {
              currentPosition = indexToSelected;
            });
          },
        ),
        Positioned(
          bottom: -(heigthUnderline / 2),
          width: width,
          child: AnimatedAlign(
            alignment: Alignment(_getIndicatorPosition(currentPosition), 0),
            duration: duration,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: widthItem * .35),
              width: widthItem,
              height: heigthUnderline,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(100)
                ),
                width: double.infinity,
                height: double.infinity,
              ),
            )
          )
        )
      ],
    );
  }
}