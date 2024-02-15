import 'dart:ui';

import 'package:appucv2/data/Sample.dart';
import 'package:appucv2/helper/colorsys.dart';
import 'package:appucv2/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SinglePost extends StatelessWidget {
  final Post post;
  final String image;

  const SinglePost({super.key, required this.post, required this.image});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 70,
                bottom: 20,
                right: 20,
                left: 20,
              ),
              height: height / 2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ClipRRect(
                        child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.black.withOpacity(0.2)),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          )),
                    )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            maxRadius: 28,
                            backgroundImage:
                                AssetImage(post.user.profilePicture),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            post.user.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            width: 32.0,
                            height: 32.0,
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.grey.withOpacity(0.1)),
                            child: Center(
                              child: Image.asset('assets/icons/link.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset('assets/icons/location.png', scale: 2.2),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Piura, Perú",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colorsys.grey),
                      )
                    ],
                  ),
                  makeRelatedPhotos(post)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeRelatedPhotos(Post post) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: List.generate(
        post.relatedPhotos.length,
        (index) => StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: index.isEven ? 3 : 2,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(post.relatedPhotos[index]),
              ),
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
