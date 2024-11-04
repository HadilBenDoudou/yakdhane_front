import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yakdhan - À Propos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AproposPage(),
    );
  }
}

class AproposPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À Propos de Yakdhan'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo3.jpeg'), // Assurez-vous que le chemin est correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteneur semi-transparent
          Container(
            color: Colors.black.withOpacity(0.5), // Couleur de fond semi-transparente
          ),
          // Conteneur avec texte
          Container(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Centre le contenu
                children: [
                  Text(
                    'Yakdhan Sécurité',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Couleur du grand titre
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          blurRadius: 6.0,
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center, // Centre le texte
                  ),
                  SizedBox(height: 20),

                  _buildAnimatedCard(
                    title: 'Qui sommes-nous ?',
                    content: 'Yakdhan est un leader dans le domaine de la sécurité domestique et commerciale. '
                        'Nous proposons des solutions de sécurité avancées, y compris des systèmes d\'alarme '
                        'et des caméras de surveillance de haute qualité.',
                    icon: Icons.info,
                  ),

                  _buildAnimatedCard(
                    title: 'Notre Mission',
                    content: 'Notre mission est de protéger ce qui compte le plus pour vous. '
                        'Nous nous engageons à fournir des produits et services fiables, '
                        'tout en assurant une tranquillité d\'esprit à nos clients.',
                    icon: Icons.security,
                  ),

                  _buildAnimatedCard(
                    title: 'Nos Services',
                    content: '1. Systèmes d\'alarme personnalisés\n'
                        '2. Caméras de surveillance 24/7\n'
                        '3. Monitoring à distance\n'
                        '4. Consultation en sécurité',
                    icon: Icons.build,
                  ),

                  _buildAnimatedCard(
                    title: 'Contactez-nous',
                    content: 'info@yakdhan.com\nTéléphone : +123 456 7890',
                    icon: Icons.contact_mail,
                  ),

                  SizedBox(height: 20),
                  // Liens vers les réseaux sociaux
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.facebook, color: Colors.blue[900]),
                        onPressed: () {
                          // Action pour Facebook
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.photo, color: Colors.blue[900]), // Remplacez par une icône Instagram
                        onPressed: () {
                          // Action pour Instagram
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.blue[900]), // Remplacez par une icône pour X
                        onPressed: () {
                          // Action pour X
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Action pour contacter
                      },
                      icon: Icon(Icons.contact_mail),
                      label: Text('Contactez-nous'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCard({required String title, required String content, IconData? icon}) {
    return Card(
      color: Colors.white.withOpacity(0.7), // Couleur de la carte semi-transparente
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Row(
                children: [
                  Icon(icon, color: Colors.blue[900], size: 28), // Couleur des icônes en bleu roi
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Couleur du titre
                    ),
                  ),
                ],
              ),
            ] else ...[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Couleur du titre
                ),
              ),
            ],
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black, // Couleur du texte dans la carte
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}