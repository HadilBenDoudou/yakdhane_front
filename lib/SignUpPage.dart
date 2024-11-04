import 'dart:convert'; // Importer le package pour convertir en JSON
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Importer le package HTTP

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  String? _firstName, _lastName, _cin, _email, _address, _phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registre",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color(0xFFF6FAF8),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.jpg'), // Remplacez par votre image de fond
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 350, // Largeur fixe du cadre
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2), // Fond noir avec opacité
              borderRadius: BorderRadius.circular(10.0), // Coins arrondis
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5), // Ombre plus sombre
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3), // Décalage de l'ombre
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Limiter la taille de la colonne
              children: [
                Text(
                  'Registre',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Inscrivez-vous pour consulter nos services.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nom',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                        onSaved: (value) => _lastName = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Prénom',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre prénom';
                          }
                          return null;
                        },
                        onSaved: (value) => _firstName = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'CIN',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre CIN';
                          }
                          return null;
                        },
                        onSaved: (value) => _cin = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty || !value.contains('@')) {
                            return 'Veuillez entrer un email valide';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Adresse',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre adresse';
                          }
                          return null;
                        },
                        onSaved: (value) => _address = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Téléphone',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez entrer votre numéro de téléphone';
                          }
                          return null;
                        },
                        onSaved: (value) => _phone = value,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            // Préparez les données à envoyer
                            final userData = {
                              'firstName': _firstName,
                              'lastName': _lastName,
                              'cin': _cin,
                              'email': _email,
                              'address': _address,
                              'phone': _phone,
                            };

                            try {
                              // Envoyer la requête POST à votre API
                              final response = await http.post(
                                Uri.parse('http://10.0.2.2:9991/api/users/register'), // Pour un émulateur
                                // Ou pour un appareil physique
                                // Uri.parse('http://<your_ip_address>:8080/api/users/register'),
                                headers: {'Content-Type': 'application/json'},
                                body: json.encode(userData),
                              );



                              if (response.statusCode == 200) {
                                // Inscription réussie
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Inscription réussie')),
                                );
                              } else {
                                // Gérer l'erreur
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Erreur lors de l\'inscription')),
                                );
                              }
                            } catch (e) {
                              // Gérer l'erreur de connexion
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Erreur de connexion')),
                              );
                            }
                          }
                        },
                        child: Text('S\'inscrire'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
