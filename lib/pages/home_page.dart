import 'package:flutter/material.dart';
import 'package:stay_home_polls_app/pages/feed_content.dart';
import 'package:stay_home_polls_app/pages/user_content.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          FeedContent(),
          UserContent(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _pageController.hasClients ? _pageController.page.floor() : 0,
        onTap: (tabIndex) {
          setState(() {
            _pageController.jumpToPage(tabIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Feed'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Me'),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        showUnselectedLabels: false,
      ),
    );
  }
}
