import 'package:flutter/material.dart';
import '../MyProfile/my_profile_screen.dart';
import 'Booking_Screen/booking_screen.dart';
import 'drawer_widget.dart';
import 'Home_Screen/home_screen.dart';

class Dashboard extends StatefulWidget {
  final int initialIndex;
  const Dashboard({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


class _DashboardState extends State<Dashboard> {

  List<Widget> pages = [
    HomeScreen(
      scaffoldKey: _scaffoldKey,
    ),
    BookingScreen(),
    // MyProfileScreen(),
  ];

  late int idx;

  @override
  void initState() {
    super.initState();
    idx = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(),
      bottomNavigationBar: Theme(
        data: ThemeData(),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          useLegacyColorScheme: false,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: idx,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home,
                color: idx == 0 ? Theme.of(context).primaryColor : Colors.grey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_outline,
                color: idx == 1 ? Theme.of(context).primaryColor : Colors.grey,
              ),
              label: "Bookings",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.person_outline_rounded,
            //     color: idx == 2 ? Theme.of(context).primaryColor : Colors.grey,
            //   ),
            //   label: "Profile",
            // ),
          ],
        ),
      ),
      // body: IndexedStack(
      //   children: pages,
      //   index: idx,
      // ),
      body: pages.elementAt(idx),
    );
  }
}
