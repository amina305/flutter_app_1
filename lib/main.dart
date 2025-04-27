import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'categorie.dart'; // Importer la nouvelle page
import 'sport.dart';
import 'pause.dart';
import 'deficuisine.dart';
import 'science.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Votre Application',
      debugShowCheckedModeBanner: false,
      home: const Profil(),
    );
  }
}

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  String userName = "Radja";
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: userName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(  // Ajoutez ce widget pour rendre l'écran défilable
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Avatar centré en haut
              Center(
                child: Image.asset(
                  'assets/avatar.png', // Vérifie que le fichier existe dans assets/
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.person, size: 100, color: Colors.grey),
                ),
              ),

              const SizedBox(height: 50),

              // Ligne contenant le champ de saisie du nom à gauche et le drapeau à droite
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: "Votre nom",
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            userName = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 5),

                    // Drapeau avec fond blanc
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(
                              alpha: 25, // 10% of 255
                              red:   0,
                              green: 0,
                              blue:  0,
                            ),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        'assets/drapaux.png',
                        width: 64,
                        height: 44,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.flag, size: 44, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Text(userName, style: const TextStyle(fontSize: 19, color: Colors.grey)),
              const SizedBox(height: 5),
              const Text(
                "Membre depuis janvier 2025",
                style: TextStyle(fontSize: 21, color: Colors.grey),
              ),
              const SizedBox(height: 20),

              const Text(
                "Tu es tout proche du but,",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const Text(
                "ne lâche rien !",
                style: TextStyle(fontSize: 35),
              ),

              const SizedBox(height: 30),

              Center(
                child: _buildImage(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/v1/Sc0iOjd/k1d8cxDk3vn_AR1Xg3p0.png",
                  width: 202,
                  height: 109,
                ),
              ),

              const SizedBox(height: 30),

              // Les 4 images de progression (corrigées)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLocalImage("assets/salad.png"),
                  _buildLocalImage("assets/pasta.png"),
                  _buildLocalImage("assets/salad.png"),
                  _buildLocalImage("assets/patte.png"),
                ],
              ),
              const SizedBox(height: 30),

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Categorie()),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Aller à Catégorie"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
              ),

              const SizedBox(height: 20), // Ajoute un peu de marge en bas pour éviter l'overflow
            ],
          ),
        ),
      ),
    );
  }

  // Widget pour afficher une image avec un cache
  Widget _buildImage(String url, {double width = 91, double height = 91}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: CachedNetworkImage(
        imageUrl: url,
        width: width,
        height: height,
        fit: BoxFit.fill,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error, color: Colors.red),
      ),
    );
  }

  // Widget pour afficher une image locale avec gestion des erreurs
  Widget _buildLocalImage(String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.asset(
        assetPath,
        width: 85,
        height: 85,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.broken_image, size: 85, color: Colors.grey),
      ),
    );
  }
}
