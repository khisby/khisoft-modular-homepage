import "package:flutter/material.dart";
import "package:khisoft_homepage_modular/services/home_service.dart";

class Body extends StatelessWidget {
  final components =
      getComponents('lib/assets/mock-body-component-response-api.json');

  @override
  Widget build(BuildContext context) {
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
