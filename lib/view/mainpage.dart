import 'package:astro/view/astrologer.dart';
import 'package:astro/view/home.dart';
import 'package:astro/view/question.dart';
import 'package:astro/view/report.dart';
import 'package:flutter/material.dart';

class MainPageActivity extends StatefulWidget {
  @override
  _MainPageActivityState createState() => _MainPageActivityState();
}

class _MainPageActivityState extends State<MainPageActivity> {
  int _seletedItem = 0;
  var _page = [
    HomeActivity(),
    AstrologerActivity(),
    QuestionActivity(),
    ReportsActivity()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo.png',
          height: 50,
        ),
        leading: IconButton(
          icon: Image.asset('assets/hamburger.png'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/profile.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: _page[_seletedItem],
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: Colors.orange[600],
        backgroundColor: Colors.grey[300],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _seletedItem == 0
                  ? Image.asset('assets/home.png', width: 20)
                  : Icon(
                      Icons.home_outlined,
                      color: Colors.black38,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _seletedItem == 1
                  ? Image.asset(
                      'assets/talk.png',
                      width: 20,
                      color: Colors.orange[600],
                    )
                  : Image.asset(
                      'assets/talk.png',
                      width: 20,
                    ),
              label: "Talk To Astrologer"),
          BottomNavigationBarItem(
              icon: _seletedItem == 2
                  ? Image.asset(
                      'assets/ask.png',
                      width: 20,
                      color: Colors.orange[600],
                    )
                  : Image.asset(
                      'assets/ask.png',
                      width: 20,
                    ),
              label: "Ask Question"),
          BottomNavigationBarItem(
              icon: _seletedItem == 3
                  ? Image.asset(
                      'assets/reports.png',
                      width: 20,
                      color: Colors.orange[600],
                    )
                  : Image.asset(
                      'assets/reports.png',
                      width: 20,
                    ),
              label: "Reports"),
        ],
        currentIndex: _seletedItem,
        onTap: (index) {
          setState(() {
            _seletedItem = index;
          });
        },
      ),
    );
  }
}
