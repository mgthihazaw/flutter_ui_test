import 'package:flutter/material.dart';
import 'package:ui_component/core/const.dart';
import 'package:ui_component/core/my_flutter_app_icons.dart';
import 'package:ui_component/model/shoe_model.dart';
import 'package:ui_component/page/shoe_detail.dart';
import 'package:ui_component/widget/app_clipper.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ShoeModel> shoeList = ShoeModel.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          MyFlutterApp.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
                IconButton(
                  icon: Icon(
                    MyFlutterApp.search,
                    color: Colors.black26,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
              height: 350,
              child: ListView.builder(
                  itemCount: shoeList.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ShoeDetail(shoeList[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10, left: 10),
                        width: 230,
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: buildClipPath(index, 230),
                            ),
                            Positioned(
                              bottom: 130,
                              right: 10,
                              child: Hero(
                                tag: "hero${shoeList[index].imgPath}",
                                                              child: Transform.rotate(
                                    angle: -math.pi / 7,
                                    child: Image(
                                      width: 230,
                                      image: AssetImage(
                                        "assets/${shoeList[index].imgPath}",
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("JUST FOR YOU",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  Text("VIEW ALL",
                      style: TextStyle(color: AppColors.greenColor)),
                ]),
          ),
          SizedBox(
            height: 20,
          ),
          ...shoeList.map((data) => GestureDetector(
             onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ShoeDetail(data)));
                      },
                      child: Container(
                  margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: Row(
                    children: [
                      Image(
                          image: AssetImage("assets/${data.imgPath}"),
                          width: 100,
                          height: 70),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Text(
                                  "${data.name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Text("${data.brand}",
                                style: TextStyle(color: Colors.black38))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          "\$${data.price.toInt()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.grey,
                              height: 1.5),
                        ),
                      )
                    ],
                  ),
                ),
          ))
        ],
      ),
      bottomNavigationBar: buildbottomNavBar(),
    );
  }

  Container buildbottomNavBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 1)
          ]),
      child: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: AppColors.greenColor,
        unselectedItemColor: Colors.black26,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.compass), title: Text("data")),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.list), title: Text("data")),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.bag), title: Text("data")),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.person_outline), title: Text("data"))
        ],
      ),
    );
  }

  ClipPath buildClipPath(int index, double width) {
    return ClipPath(
        clipper: AppClipper(diagonalHeight: 150, cornerSize: 25),
        child: Container(
          width: width,
          color: shoeList[index].color,
          padding: EdgeInsets.only(left: 12),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Icon(
                      MyFlutterApp.stars,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                      width: 125,
                      child: Text(
                        "${shoeList[index].name}",
                        style: TextStyle(color: Colors.white),
                      )),
                  SizedBox(height: 10),
                  Text("${shoeList[index].price}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                ],
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                      child: Center(
                        child: Icon(
                          MyFlutterApp.add,
                          color: Colors.white,
                        ),
                      ),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                          ),
                          color: AppColors.greenColor)))
            ],
          ),
        ));
  }
}
