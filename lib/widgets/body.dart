// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import "package:khisoft_homepage_modular/services/home_service.dart";

class Body extends StatelessWidget {
  final components = getComponents('lib/assets/mock-api.json');

  @override
  Widget build(BuildContext build) {
    return FutureBuilder<List<Widget>>(
      future: components,
      builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: snapshot.data!,
          );
        }
      },
    );
  }
}
