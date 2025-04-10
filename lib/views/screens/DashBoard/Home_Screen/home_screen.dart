import 'package:flutter/material.dart';

import 'Components/midsection.dart';
import 'Components/top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TopSection(scaffoldKey: widget.scaffoldKey),
            TopSection(),
            // SizedBox(height: 15,),
            MidSection(),
        
          ]
        ),
      ),
    );
  }
}
