import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lembretes/src/features/home/home_view.dart';
import 'package:lembretes/src/features/passed_lembretes/passed_lembretes_view.dart';

class BaseView extends StatefulWidget {

  static String id = 'base';

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeView(),
    const PassedLembretesView(),
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
        icon: const Icon(
          Icons.event,
          color: const Color(0xff544646),
        ),
        label: AppLocalizations.of(context)?.bottomNavigationFuture,
      ),
      BottomNavigationBarItem(
        icon: const Icon(
          Icons.check,
          color: const Color(0xff544646),
        ),
        label: AppLocalizations.of(context)?.bottomNavigationPast,
      ),
    ];
  }

  _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      items: _buildBottomNavBarItems(),
      currentIndex: _selectedIndex,
      selectedItemColor: const Color(0xff544646),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: const Color(0xff544646),
      onTap: _onItemTapped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'Lembretes',
            style: TextStyle(color: Color(0xff544646)),
          ),
          centerTitle: true,
        ),
        body: buildPageView(),
        bottomNavigationBar: _bottomNavigationBar(context),
      );
  }
}
