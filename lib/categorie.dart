import 'package:flutter/material.dart';
import 'sport1.dart'; // Import de la page Sport (assurez-vous que ce fichier existe)
import 'deficuisine.dart'; // Import de la page Cuisine
import 'science.dart'; // Import de la page Science

class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  CategorieState createState() => CategorieState();
}

class CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Bouton retour
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // Retour au profil
                      },
                    ),
                  ),
                ),

                // Logo
                Image.asset(
                  "assets/logo.png",
                  width: 160,
                  height: 133,
                ),
                const SizedBox(height: 20),

                // Texte principal
                const Text(
                  "CHOISISSEZ VOTRE",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "DÉFI",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Boutons de catégories
                _buildCategorieButton(
                  color: const Color(0xFFC0B6FF),
                  imageUrl: "assets/yoga.png",
                  text: "Sport",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Page6()), // Page Sport
                    );
                  },
                ),
                _buildCategorieButton(
                  color: const Color(0xFFFC8C1F),
                  imageUrl: "assets/cuisine.png",
                  text: "Cuisine",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DefiCuisine()), // Page Cuisine
                    );
                  },
                ),
                _buildCategorieButton(
                  color: const Color(0xFF92D3B0),
                  imageUrl: "assets/science.png",
                  text: "Science",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Science()), // Page Science
                    );
                  },
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fonction pour générer les boutons de catégorie
  Widget _buildCategorieButton({
    required Color color,
    required String imageUrl,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              Image.asset(imageUrl, width: 70, height: 70),
              const SizedBox(width: 30),
              Text(
                text,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Categorie(), // La page de départ est Categorie
  ));
}
