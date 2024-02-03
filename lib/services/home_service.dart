import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:khisoft_homepage_modular/widgets/components/banner_full.dart';
import 'package:khisoft_homepage_modular/widgets/components/banner_list.dart';
import 'package:khisoft_homepage_modular/widgets/components/grid_feature_list.dart';
import 'package:flutter/material.dart';

Future<String> _loadFileFromAssets(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<dynamic>> _parseJsonFromAssets(String path) async {
  final String jsonStr = await _loadFileFromAssets(path);
  final dynamic data = json.decode(jsonStr);

  if (data is Map<String, dynamic>) {
    return data['components'] as List<dynamic>;
  }
  return [];
}

Future<List<Widget>> getComponents(String path) async {
  var components = await _parseJsonFromAssets(path);
  List<Widget> widgets = [];
  for (var component in components) {
    String name = component['name'];
    String title = component['title'] ?? '';
    Map<String, dynamic> data = component['data'];

    switch (component['type']) {
      case 'grid-feature-list':
        widgets.add(
          GridFeatureList(
            name: name,
            title: title,
            data: data,
          ),
        );
        break;
      case 'grid-gallery':
        // widgets.add(
        //   GridGallery(
        //     name: name,
        //     data: data,
        //   ),
        // );
        break;
      case 'banner-full':
        widgets.add(
          BannerFull(
            name: name,
            title: title,
            data: data,
          ),
        );
        break;
      case 'banner-list':
        widgets.add(
          BannerList(
            name: name,
            title: title,
            data: data,
          ),
        );
        break;
    }
  }

  return widgets;
}
