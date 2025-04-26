import 'package:flutter/material.dart';

class ChallengeCompletedPage extends StatefulWidget {
  const ChallengeCompletedPage({super.key});

  @override
  State<ChallengeCompletedPage> createState() => _ChallengeCompletedPageState();
}

class _ChallengeCompletedPageState extends State<ChallengeCompletedPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Page d'accueil", style: TextStyle(fontSize: 22))),
    Center(child: Text("Galerie de photos", style: TextStyle(fontSize: 22))),
    Center(child: Text("Profil utilisateur", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    const orangeColor = Color(0xFFFC8C1F);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _selectedIndex == 0
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80), // espace après la flèche
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "🎉 BRAVO 🎉\n",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFC8C1F),
                            letterSpacing: 1.5,
                          ),
                        ),
                        TextSpan(
                          text: "Tu as terminé ton défi du jour",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 160,
                    width: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 160,
                          width: 160,
                          child: CircularProgressIndicator(
                            value: 0.65,
                            strokeWidth: 20,
                            backgroundColor: Colors.grey.shade200,
                            color: orangeColor,
                          ),
                        ),
                        const Text(
                          "65%",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "progress",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        // Action pour partager la photo
                      },
                      child: const Text(
                        "Partager la photo\nde la recette",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              )
                  : _pages[_selectedIndex],
            ),
            // ✅ La flèche personnalisée en haut à gauche
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Retour à la page précédente
                },
                child: const Text(
                  "<",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moi',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
