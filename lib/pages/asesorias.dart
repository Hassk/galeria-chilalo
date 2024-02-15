import 'dart:ui';

import 'package:appucv2/helper/colorsys.dart';
import 'package:appucv2/models/Post.dart';
import 'package:appucv2/data/Sample.dart';
import 'package:appucv2/models/User.dart';
import 'package:appucv2/pages/SinglePost.dart';
import 'package:appucv2/pages/SingleUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Asesorias extends StatefulWidget {
  @override
  _AsesoriasState createState() => _AsesoriasState();
}

class _AsesoriasState extends State<Asesorias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorsys.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colorsys.lightGrey,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colorsys.darkGrey,
          ),
          onPressed: () {
            //    Navigator.push(
            //   context,
            //    MaterialPageRoute(
            // builder: (context) => SingleUser(),
            //  ));
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            searchBox(),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Para tí",
                    style: TextStyle(
                        color: Colorsys.darkGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colorsys.lightGrey))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Recomendado",
                              style: TextStyle(
                                  color: Colorsys.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Container(
                              width: 50,
                              padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colorsys.orange, width: 3))),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Nuevo",
                          style: TextStyle(
                              color: Colorsys.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  makePost(Sample.postOne),
                  makePost(Sample.postTwo),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makePost(Post post) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SingleUser(user: post.user as User)));
            },
            child: Row(
              children: <Widget>[
                Hero(
                  transitionOnUserGestures: true,
                  tag: post.user.username,
                  child: CircleAvatar(
                    maxRadius: 28,
                    backgroundImage: AssetImage(post.user.profilePicture),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post.user.name,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          post.location,
                          style: TextStyle(fontSize: 13, color: Colorsys.grey),
                        ),
                        Text(
                          post.dateAgo,
                          style: TextStyle(fontSize: 13, color: Colorsys.grey),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: post.photos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SinglePost(
                                  post: post,
                                  image: post.photos[index],
                                )));
                  },
                  child: AspectRatio(
                    aspectRatio: 1.2 / 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(post.photos[index]),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              margin: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/galeriachilalo.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ClipRect(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey[600]),
                                        child: Center(
                                          child: Image.asset(
                                              'assets/images/galeriachilalo.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            "Apoyando el	\nEmprendimiento Local ",
            style: TextStyle(
                fontSize: 22,
                color: Colorsys.darkGrey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 20, right: 3, top: 3, bottom: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Buscar",
                      hintStyle: TextStyle(color: Colorsys.grey),
                      border: InputBorder.none),
                )),
                MaterialButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  height: double.infinity,
                  minWidth: 50,
                  elevation: 0,
                  color: Colorsys.orange,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
