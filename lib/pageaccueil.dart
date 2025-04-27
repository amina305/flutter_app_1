import 'package:flutter/material.dart'; // ✅ Assure-toi que le fichier est bien dans "lib/" ou adapte le chemin
//import 'package:flutter/services.dart';
import 'screen_two.dart';
import 'package:premier_projet/categorier.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:premier_projet/cuisine.dart';
void main() {
  runApp(const MaterialApp(
    home: ChallengeCompletedPage2(),
  ));
}

class ChallengeCompletedPage2 extends StatefulWidget {
  const ChallengeCompletedPage2({super.key});

  @override
  State<ChallengeCompletedPage2> createState() => _ChallengeCompletedPageState2();
}

class _ChallengeCompletedPageState2 extends State<ChallengeCompletedPage2> {
  @override
  Widget build(BuildContext context) {
    return const ChallengeScreen();
  }
}

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
              SizedBox(
                height: screenHeight * 0.3,
                width: screenWidth * 0.8,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                child: const Text(
                  "Chaque petit pas te rapproche de\n\nla réussite. Prêt à relever le défi?\n\nC’est à toi de jouer.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 50,
                    width: screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ScreenTwo()),
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
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
