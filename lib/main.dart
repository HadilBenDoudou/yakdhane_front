import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'AboutPage.dart';  // Import de la page AboutPage
import 'SignUpPage.dart'; // Importez la page SignUpPage
import 'apropos.dart';  // Import de la page apropos


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Initialisation du Timer pour changer d'image toutes les 2 secondes
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();  // Annulation du Timer lorsqu'on quitte la page
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        backgroundColor: Colors.white,
      ),

      // Drawer pour la navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF01197B),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo3.jpeg',
                    height: 90,
                    width: 90,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AproposPage()), // Naviguer vers AproposPage
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Services'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text('S\'inscrire'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()), // Redirection vers la page d'inscription
                );
              },
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          // Carrousel automatique d'images
          PageView(
            controller: _pageController,
            children: [
              Image.asset('images/test10.jpg', fit: BoxFit.cover),
              Image.asset('images/test12.jpeg', fit: BoxFit.cover),
              Image.asset('images/test13.jpeg', fit: BoxFit.cover),
              Image.asset('images/test14.jpg', fit: BoxFit.cover),
              Image.asset('images/test15.avif', fit: BoxFit.cover),
              Image.asset('images/test16.avif', fit: BoxFit.cover),
            ],
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Align(
              alignment: Alignment.centerLeft, // Aligne le texte à gauche
              child: Container(
                margin: EdgeInsets.only(left: 30), // Marge à gauche
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Aligner le texte à gauche
                  children: [
                    // Texte "yakdhane Service de Sécurité"
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'yakdhane Service de Sécurité', // Le texte apparaîtra sur la même ligne
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 500),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                    ),
                    SizedBox(height: 20), // Espace entre le titre et le paragraphe

                    // Paragraphe qui s'affiche ligne par ligne
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Aligner à gauche
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'semble être un terme associé à des services de télésurveillance',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'et de détection d\'intrusion, souvent mentionné dans des',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'contextes liés à la sécurité domestique et professionnelle.',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'Ces services incluent des alarmes, un contrôle d\'accès,',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'et des caméras de surveillance. Il est recommandé de consulter',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'des experts pour ces installations afin d\'assurer',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                            TypewriterAnimatedText(
                              'la sécurité de votre investissement.',
                              speed: const Duration(milliseconds: 100),
                              textStyle: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                          totalRepeatCount: 1,
                          pause: const Duration(milliseconds: 500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton.extended(
              backgroundColor: Color(0xFF01197B),
              onPressed: () {
                // Logique pour contacter
              },
              label: Text('Contact Us', style: TextStyle(color: Colors.white)),
              icon: Icon(Icons.chat, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
