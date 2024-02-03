import "package:flutter/material.dart";

class GridFeatureList extends StatefulWidget {
  final String name;
  final String title;
  final Map<String, dynamic> data;

  const GridFeatureList(
      {Key? key, required this.name, required this.title, required this.data})
      : super(key: key);

  @override
  GridFeatureListState createState() => GridFeatureListState();
}

class GridFeatureListState extends State<GridFeatureList> {
  late FeatureList data;
  late List<Color> colorList;
  Color color = Colors.white;

  @override
  void initState() {
    super.initState();
    data = FeatureList.fromJson(widget.data);

    colorList = List<Color>.filled(data.items.length, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTapDown: (TapDownDetails details) {
                setState(() {
                  colorList[index] = Colors.white.withOpacity(0.5);
                });
              },
              onTapUp: (TapUpDetails details) {
                setState(() {
                  colorList[index] = Colors.white.withOpacity(1.0);
                });
              },
              onTap: () => print(data.items[index].redirectionUrl),
              child: Container(
                decoration: BoxDecoration(
                  color: colorList[index],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      data.items[index].iconUrl,
                      width: 50,
                      height: 50,
                    ),
                    Text(data.items[index].title),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class Feature {
  final String title;
  final String iconUrl;
  final String redirectionUrl;

  Feature(
      {required this.title,
      required this.iconUrl,
      required this.redirectionUrl});

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      title: json['title'] ?? "",
      iconUrl: json['iconUrl'] ?? "",
      redirectionUrl: json['redirectionUrl'] ?? "",
    );
  }
}

class FeatureList {
  final List<Feature> items;

  FeatureList({required this.items});

  factory FeatureList.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Feature> items = list.map((i) => Feature.fromJson(i)).toList();

    return FeatureList(items: items);
  }
}
