import 'package:flutter/material.dart';
import 'package:flutter_case_study/resources/constants.dart';
import 'package:flutter_case_study/resources/size_config.dart';
import 'package:flutter_case_study/screens/home/home_screen.dart';
import 'package:flutter_case_study/screens/ticket/ticket_screen.dart';

class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  List<Map<String, Widget>> _pages = [
    {
      "page": HomeScreen(),
    },
    {
      "page": TicketScreen(),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  BottomNavigationBarItem _bottomBarItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(
        icon,
        size: getProportionateScreenWidth(19),
      ),
      label: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _pages[_selectedPageIndex]["page"],
      backgroundColor: white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.white,
        selectedItemColor: lightRed,
        unselectedItemColor: black,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: getProportionateScreenWidth(13),
        selectedFontSize: getProportionateScreenWidth(13),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
        ),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: "WorkSans",
        ),
        items: [
          _bottomBarItem(Icons.home, "Homescreen"),
          _bottomBarItem(Icons.text_snippet, "Tickets"),
        ],
      ),
    );
  }
}
