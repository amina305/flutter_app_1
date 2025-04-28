import 'package:flutter/material.dart';
import 'info.dart';
import 'science.dart';
class ScienceStatePage extends StatefulWidget {
  const ScienceStatePage({super.key});

  @override
  ScienceState createState() => ScienceState();
}

class ScienceState extends State<ScienceStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar: Back button + Logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Science()),
                      );
                    },
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.person, size: 50, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // Corps centré verticalement
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // important pour centrer
                  children: [
                    // Premier bouton (Cœur)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PageUnique()),
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF92D3B0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Le cœur et le système circulatoire',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/image/human-heart-anatomy-png 2.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person, size: 50, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Deuxième bouton (Cellules et ADN)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF92D3B0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Les cellules\net l’ADN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              '🧬',
                              style: TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Navigation bar en bas
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, size: 30, color: Colors.black),
                  Icon(Icons.image, size: 30, color: Colors.black),
                  Icon(Icons.person, size: 30, color: Colors.black),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

