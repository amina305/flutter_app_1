
import 'package:flutter/material.dart';// ✅ Assure-toi que le fichier est bien dans "lib/" ou adapte le chemin
import 'package:flutter/services.dart';
import 'screen_two.dart';
import 'package:premier_projet/categorier.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:premier_projet/cuisine.dart';


void main() {
  // Masquer la barre de statut
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChallengeCompletedPage(),
    );
  }
}

      //home: RestPage(
        //onRestEnd: () {
          //print("Repos terminé !");
          // Ici, tu peux ajouter une navigation vers une autre page si nécessaire
        //},
        //audioPlayer: AudioPlayer(), // Assure-toi d'utiliser un AudioPlayer valide
      //),

    //);
  //}
//}

class ChallengeScreen extends StatelessWidget {
  const ChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              const Text(
                "Bienvenue dans le \nmonde du challenge!\n",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              // Image principale
              SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth * 0.8,
                child: Image.network(
                  "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/5zmgz3i0.png",
                  fit: BoxFit.contain,
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: const Text(
                  "Chaque petit pas te rapproche de\n\nla réussite.Prêt à relever le défi?\n\nC’est à toi de jouer.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const Spacer(),

              // ✅ Bouton "Get Started" avec navigation vers ScreenTwo
              Align(
                alignment: Alignment.topCenter, // Aligne le bouton en haut du centre
                child: Padding(
                  padding: const EdgeInsets.only(top: 50), // Marge du haut, ajuste la valeur selon tes besoins
                  child: SizedBox(
                    height: 50, // Hauteur réduite du bouton
                    width: screenWidth * 0.6, // Largeur de 60% de la largeur de l'écran
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScreenTwo()), // ✅ Navigation correcte
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 16, // Réduit la taille du texte
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03), // Ajout d'espace sous le bouton
            ],
          ),
        ),
      ),
    );
  }
}


