// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import "package:flutter/material.dart";

class BannerFull extends StatefulWidget {
  final String name;
  final Map<String, dynamic> data;

  const BannerFull({Key? key, required this.name, required this.data})
      : super(key: key);

  @override
  BannerFullState createState() => BannerFullState();
}

class BannerFullState extends State<BannerFull> {
  late Banner data;

  @override
  void initState() {
    super.initState();
    data = Banner.fromJson(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      child: SizedBox(
        width: screenWidth,
        child: GestureDetector(
          onTap: () => print(data.redirectionUrl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.title != ""
                  ? Text(
                      data.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                height: 110,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Banner {
  final String title;
  final String imgUrl;
  final String redirectionUrl;

  Banner(
      {required this.title,
      required this.imgUrl,
      required this.redirectionUrl});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
        title: json['title'] ?? "",
        imgUrl: json['imgUrl'] ?? "",
        redirectionUrl: json['redirectionUrl'] ?? "");
  }
}
