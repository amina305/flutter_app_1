import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Pause extends StatefulWidget {
  const Pause({super.key});

  @override
  PauseState createState() => PauseState();
}

class PauseState extends State<Pause> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints.expand(),
            color: const Color(0xFFBEBBD0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Retour arrière
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context); // <-- Ça revient à l'écran précédent (Sport)
                      },
                    ),
                  ),
                ),
                // Image principale (GIF) et texte "Pause"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/animation.json',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Pause",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // Bouton "Reprendre" avec texte intégré
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Reprendre",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6B39F8),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Faites confiance à votre pouvoir de réussir.",
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xFF6B39F8),
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward, color: Color(0xFF6B39F8)),
                          onPressed: () {
                            print('Reprendre Pressed');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Bouton "Recommencer"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    onPressed: () {
                      print('Recommencer Pressed');
                    },
                    child: const Center(
                      child: Text(
                        "Recommencer",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
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
