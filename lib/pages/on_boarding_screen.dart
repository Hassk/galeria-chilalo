// ignore_for_file: prefer_const_constructors

import 'package:appucv2/pages/asesorias.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController = PageController();
  int currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (i) {
              setState(() {
                currentPageIndex = i;
              });
            },
            controller: _pageController,
            children: [
              Container(
                  color: Colors.orange.shade100,
                  child: _page(
                      "assets/images/galeriachilalo.png",
                      "Bienvenido a la Galería Chilalo",
                      "Te brindaremos una pequeña guía de cómo funciona nuestra app ")),
              Container(
                  color: Colors.orange.shade300,
                  child: _page(
                      "assets/images/galeriachilalo.png",
                      "Grandes Artistas",
                      "En esta galería podrás subir tu arte y poder promocionarlo a nivel local ")),
              Container(
                  color: Colors.orange.shade200,
                  child: _page("assets/images/galeriachilalo.png",
                      "Ayuda en Proyectos", "wa ")),
              Container(
                  color: Colors.orange.shade100,
                  child: _page(
                      "assets/images/galeriachilalo.png",
                      "Solicitar asesorías",
                      "Cada que solicites una asesoría, se le notificará al Asesor y podrán ver el horario más adecuado para poder apoyarte.")),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 4,
                  onDotClicked: (index) {
                    _pageController.jumpToPage(index);
                  },
                ),
              )),
          if (currentPageIndex == 3)
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(64),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Asesorias(),
                            ));
                      },
                      child: Text("Comenzar")),
                ))
        ],
      ),
    );
  }

  Widget _page(String imagePath, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 200,
          ),
          SizedBox(
            height: 100,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 32,
              color: Colors.teal.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              )),
        ],
      ),
    );
  }
}
