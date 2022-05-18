import 'package:chewata/home/screens/index.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _HomePageState();
}

class _HomePageState extends State<LandingPage> {
  int currentIndex = 0;
  final pageController = PageController();
  final pages = const [HomeScreen(), GamesScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        controller: pageController,
        onPageChanged: (int i) => setState(() => currentIndex = i),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (int i) {
          setState(() => currentIndex = i);
          pageController.animateToPage(
            i,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeIn,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: "Games",
          ),
        ],
      ),
    );
  }
}
