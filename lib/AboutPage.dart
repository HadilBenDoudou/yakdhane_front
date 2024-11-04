import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(AboutPage());
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yakdhane',
      theme: ThemeData(
        primaryColor: Color(0xFF05124A),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF05124A), fontSize: 18),
          bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Extend body behind the app bar and status bar
      appBar: AppBar(
        toolbarHeight: 250,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/yakdhane.png',
                  height: 80,
                ),
                SizedBox(height: 10),
                Text(
                  'Your trusted partner in security solutions.',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Our Services:',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 10),
            ServicesList(),
            SizedBox(height: 20),
            Text(
              'Contact Us:',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 10),
            ContactInfo(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation or functionality here
              },
              child: Text('Learn More'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Color(0xFF05124A),
                textStyle: TextStyle(color: CupertinoColors.white),
              ),
            ),
            SizedBox(height: 20),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class ServicesList extends StatelessWidget {
  final List<String> services = [
    'Security Consulting',
    'CCTV Installation',
    'Alarm Systems',
    'Access Control',
    'Fire Safety Systems',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services.map((service) {
        return ServiceBox(service: service);  // Use the new ServiceBox widget
      }).toList(),
    );
  }
}

class ServiceBox extends StatefulWidget {
  final String service;

  ServiceBox({required this.service});

  @override
  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),  // Smooth transition
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isHovered ? Color(0xFF05124A) : Colors.white,  // Change color on hover
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFF05124A), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.service,
            style: TextStyle(
              color: _isHovered ? Colors.white : Color(0xFF05124A),  // Text color changes on hover
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email: contact@yakdhane.com',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          'Phone: +123 456 7890',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF05124A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Follow Us',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                onPressed: () {
                  // Link to Facebook
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                onPressed: () {
                  // Link to Twitter
                },
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                onPressed: () {
                  // Link to Instagram
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}