import 'package:flutter/material.dart';
import 'package:quit_force/screens/home/Dashboard.dart';
import 'package:quit_force/screens/home/Map.dart';
import 'package:quit_force/screens/home/Profile.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar>
{
  int _currentIndex=0;
  final List<Widget> _children =
  [
    Dashboard(),
    Map(),
    Profile(),
  ];

  void onTappedBar(int index)
  {
    setState((){
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
      (
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar
        (
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items:
        [
          BottomNavigationBarItem
            (
              icon: new Icon(Icons.home),
              label: 'Dashboard',

          ),

          BottomNavigationBarItem
            (
              icon: new Icon(Icons.map),
              label: 'Map'
          ),

          BottomNavigationBarItem
            (
              icon: new Icon(Icons.person),
              label: 'Profile'
          ),
        ],
      ),
    );
  }
}