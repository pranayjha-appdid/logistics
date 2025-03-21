import 'package:flutter/material.dart';

import 'Components/midsection.dart';
import 'Components/top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;  // Add scaffoldKey to the constructor

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TopSection(scaffoldKey: widget.scaffoldKey),  // Pass the scaffoldKey to TopSection
          SizedBox(height: 15,),
          MidSection(),
      
        ]
      ),
    );
  }
}
