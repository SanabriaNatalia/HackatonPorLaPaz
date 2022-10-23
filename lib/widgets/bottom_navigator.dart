import 'package:flutter/material.dart';
import 'package:gabo/screens/binnacle_screen.dart';
import 'package:gabo/screens/home_screen.dart';
import 'package:gabo/screens/warning_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  static const routeName = '/bottomNavigator';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _NavigationModel(),
        child: const Scaffold(body: _Tabs(), bottomNavigationBar: _Nav()));
  }
}

class _Nav extends StatelessWidget {
  const _Nav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 30,
      selectedItemColor: Colors.red,
      currentIndex: navigationModel.currentScreen,
      onTap: (int index) {
        navigationModel.currentScreen = index;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.warning_rounded),
          label: 'Warning',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.insert_chart_outlined),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded),
          label: 'Bitacora',
        ),
      ],
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      children: const [WarningScreen(), HomeScreen(), BinnacleScreen()],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentScreen = 0;
  final PageController _pageController = PageController();

  PageController get pageController => _pageController;

  int get currentScreen => _currentScreen;

  set currentScreen(int value) {
    _currentScreen = value;
    _pageController.animateToPage(value,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
