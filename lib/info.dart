import 'package:flutter/material.dart';
import 'obj_scentifique.dart';
import 'quiz1.dart';
void main() => runApp(const MonApp());

class MonApp extends StatelessWidget {
  const MonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PageUnique(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageUnique extends StatelessWidget {
  const PageUnique({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- UNE SEULE barre supérieure (chevron + image) ---
              const HeaderRow(),
              const SizedBox(height: 10),

              // --- Section 1 ---
              Text(
                "Le cœur et le système\ncirculatoire",
                style: TextStyle(
                  color: Color(0xFF1DA55C),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const BulletText("Le cœur bat environ 100 000 fois par jour, pompant environ 5 litres de sang par minute."),
              const SizedBox(height: 8),
              const BulletText("Les artères transportent le sang oxygéné du cœur vers le reste du corps, tandis que les veines ramènent le sang appauvri en oxygène vers le cœur."),

              const SizedBox(height: 40),

              // --- Section 2 (sans header) ---
              const BulletText("Un réseau de vaisseaux sanguins parcourant le corps mesure environ 100 000 km – soit plus du double de la circonférence de la Terre !"),

              const SizedBox(height: 40),

              // --- Section 3 (sans header) ---
              Text(
                "Conseils",
                style: TextStyle(
                  color: Color(0xFF1DA55C),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Pratiquez au moins 30 minutes d'exercice par jour, comme la marche rapide, la natation ou le vélo. Votre cœur est un muscle, plus vous le sollicitez, plus il devient fort ! 💪🏽🚶‍♀️🚴‍♂️",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    // Navigation vers QuizApp
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const QuizApp()),
                    );
                  },
                  child: const Text("Next"), // `child` reste en dernier
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 80, height: 48),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/galerie 1.png', width: 30, height: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 80, height: 48),
            label: "",
          ),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

// Barre supérieure avec chevron + image
class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>   ScienceStatePage()),
            );
          },
        ),
        Image.asset(
          'assets/icons/Frame 13.png',
          height: 40,
        ),
      ],
    );
  }
}

// Texte avec puce rouge
class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "🔴 ",
          style: TextStyle(fontSize: 14),
        ),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
