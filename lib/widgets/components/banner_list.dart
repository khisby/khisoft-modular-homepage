import "package:flutter/material.dart";

class BannerList extends StatefulWidget {
  final String name;
  final String title;
  final Map<String, dynamic> data;

  const BannerList(
      {Key? key, required this.name, required this.title, required this.data})
      : super(key: key);

  @override
  BannerListState createState() => BannerListState();
}

class BannerListState extends State<BannerList> {
  late BannerListData data;

  @override
  void initState() {
    super.initState();
    data = BannerListData.fromJson(widget.data);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(top: 20, left: 15, right: 15),
      child: SizedBox(
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.title != ""
                ? Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : SizedBox.shrink(),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print(data.items[index].redirectionUrl);
                    },
                    child: Container(
                      height: 110,
                      width: screenWidth - 80,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(data.items[index].imgUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerListData {
  final List<Banner> items;

  BannerListData({required this.items});

  factory BannerListData.fromJson(Map<String, dynamic> json) {
    List<Banner> items = [];
    for (var item in json['items']) {
      items.add(Banner.fromJson(item));
    }
    return BannerListData(items: items);
  }
}

class Banner {
  final String imgUrl;
  final String redirectionUrl;

  Banner({required this.imgUrl, required this.redirectionUrl});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
        imgUrl: json['imgUrl'] ?? "",
        redirectionUrl: json['redirectionUrl'] ?? "");
  }
}
