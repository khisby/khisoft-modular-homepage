import "package:flutter/material.dart";
import 'package:khisoft_homepage_modular/widgets/body.dart';
import 'package:khisoft_homepage_modular/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(),
          Body(),
        ],
      ),
    );
  }
}
