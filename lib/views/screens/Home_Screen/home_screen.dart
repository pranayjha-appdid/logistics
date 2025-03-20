import 'package:flutter/material.dart';

import 'Components/top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopSection()

      ]
    );
  }
}
