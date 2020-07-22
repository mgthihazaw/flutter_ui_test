import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui_component/core/const.dart';
import 'package:ui_component/core/my_flutter_app_icons.dart';
import 'package:ui_component/model/shoe_model.dart';
import 'package:ui_component/widget/app_clipper.dart';
import 'dart:math' as math;

class ShoeDetail extends StatefulWidget {
  @override
  final ShoeModel shoe;

  ShoeDetail(this.shoe);
  _ShoeDetailState createState() => _ShoeDetailState();
}

class _ShoeDetailState extends State<ShoeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.shoe.color,
      appBar: AppBar(
        title: Text("CATEGORIES"),
        backgroundColor: widget.shoe.color,
        leading: IconButton(icon: Icon(MyFlutterApp.left_open_big),onPressed: (){
          Navigator.of(context).pop();
        },),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(cornerSize: 50, diagonalHeight: 200),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 200, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            // padding: EdgeInsets.symmetric(horizontal: 16),
                            width: 300,
                            child: Text(
                              "${widget.shoe.name}",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: widget.shoe.color,
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: 16,
                        ),
                        buildRating(),
                        SizedBox(
                          height: 24,
                        ),
                        Text("DETAILS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(
                          height: 16,
                        ),
                        Text("${widget.shoe.desc}",
                            softWrap: true,
                            style: TextStyle(
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w300,
                                fontSize: 16,
                                color: Colors.black45)),
                        SizedBox(
                          height: 24,
                        ),
                        Text("COLOR OPTIONS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            buildColor(AppColors.blueColor),
                            buildColor(AppColors.greenColor),
                            buildColor(AppColors.redColor),
                            buildColor(AppColors.yellowColor),
                            buildColor(AppColors.orangeColor),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Hero(
                tag: "hero${widget.shoe.imgPath}",
                              child: Transform.rotate(
                    angle: -math.pi * 0.1,
                    child: Image(
                      image: AssetImage("assets/${widget.shoe.imgPath}"),width:MediaQuery.of(context).size.width * 0.9,
                    )),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 2),
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Price",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black38)),
                Text("\$${widget.shoe.price.toInt()}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black38,
              ),
              child: Text(
                "ADD TO CART",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildColor(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 20,
      height: 20,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50), color: color),
    );
  }

  Row buildRating() {
    return Row(
      children: [
        RatingBar(
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 25,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "200 Reviews",
          style: TextStyle(color: Colors.black26),
        )
      ],
    );
  }
}
