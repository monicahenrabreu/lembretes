import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lembretes/ui/screens/home_page/home_page.dart';
import 'package:lembretes/ui/screens/past_lembretes_page/past_lembretes_page.dart';

class BasePage extends StatefulWidget {

  static String id = 'base';

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const PastLembretesPage()
  ];

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: _widgetOptions,
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.event,
          color: Theme.of(context).colorScheme.primary,
        ),
        label: AppLocalizations.of(context)!.bottomNavigationFuture,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.primary,
        ),
        label: AppLocalizations.of(context)!.bottomNavigationPast,
      ),
    ];
  }

  _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      items: _buildBottomNavBarItems(),
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Theme.of(context).colorScheme.primary,
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'Lembretes',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          centerTitle: true,
        ),
        body: buildPageView(),
        bottomNavigationBar: _bottomNavigationBar(context),
      );
  }
}
