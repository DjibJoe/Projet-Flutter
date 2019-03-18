import 'package:flutter/material.dart';
import 'package:top_services/pages/PageUne.dart';
import 'package:top_services/pages/PageDeux.dart';
import 'package:top_services/pages/PageTrois.dart';
import 'package:top_services/pages/PageQuatre.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Top services'
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Services'),
          backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.format_align_justify),
        title: new Text('Formulaire'),
    backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Resultat'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.group),
          title: Text('Developpeur'),
        backgroundColor: Theme.of(context).primaryColor,
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        PageUne(),
        PageDeux(),
        PageTrois(),
        PageQuatre()
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}



