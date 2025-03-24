import 'package:flutter/material.dart';

import '../../../../services/input_decoration.dart';
class SearchLocation extends StatelessWidget {
  const SearchLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(

            keyboardType: TextInputType.text,
            decoration: CustomDecoration.inputDecoration(
              hint: "Search here",
              hintStyle: TextStyle(color: Colors.grey),
              borderRadius: 8,
              icon: Icon(Icons.search_rounded),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(child: Text("Search Location")),

      ),
    );
  }
}
