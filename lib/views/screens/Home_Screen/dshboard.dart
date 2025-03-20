import 'package:flutter/material.dart';
import 'package:logistics/views/screens/Home_Screen/home_screen.dart';

class Dshboard extends StatefulWidget {
  const Dshboard({super.key});

  @override
  State<Dshboard> createState() => _DshboardState();
}

class _DshboardState extends State<Dshboard> {
  List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    // MyTripPage(),
    // FavoriteTripsPage(),
    // ProfilePage(),
  ];

  int idx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            idx = index;
          });
        },
        selectedItemColor: Colors.black,
        currentIndex: idx,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: idx == 0 ? Colors.black : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outline,
              color: idx == 1 ? Colors.red : Colors.grey,
            ),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_rounded,
              color: idx == 2 ? Colors.black : Colors.grey,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: idx,
      ),
    );
  }
}
