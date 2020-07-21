import 'package:flutter/material.dart';
import 'package:ui_component/core/const.dart';
import 'package:ui_component/core/my_flutter_app_icons.dart';
import 'package:ui_component/model/shoe_model.dart';

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
          Container(height: 300,color: AppColors.blueColor,),
          SizedBox(height: 20,),
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
          SizedBox(height: 20,),
          ...shoeList.map((data) => Container(
                margin:
                    EdgeInsets.only(left: 16, right: 16, bottom: 16),
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
              ))
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10,spreadRadius: 1)]),
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
      ),
    );
  }
}
