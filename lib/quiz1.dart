<<<<<<< HEAD
import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChallengeQuiz(),
    );
  }
}

class ChallengeQuiz extends StatefulWidget {
  const ChallengeQuiz({super.key});

  @override
  _ChallengeQuizState createState() => _ChallengeQuizState();
}

class _ChallengeQuizState extends State<ChallengeQuiz> {
  int _selectedIndex = 0; // Variable to track the selected index

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF92D3B0);
    const Color quizTitleColor = Color(0xFF1DA55C); // Couleur pour le titre

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar: back button + image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, size: 28),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      'assets/image/image1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Title with new color
              Text(
                'QUIZ 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: quizTitleColor, // Changer la couleur ici à 1DA55C
                ),
              ),
              const SizedBox(height: 16),

              // Question
              const Text(
                'Quel est le rôle\nprincipal du cœur ?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // Answer buttons centered
              Center(child: QuizOption(text: 'Filtrer le sang')),
              Center(child: QuizOption(text: 'Pomper le sang dans \ntout le corps')),
              Center(child: QuizOption(text: 'Produire des globules rouges')),
            ],
          ),
        ),
      ),

      // Bottom Navigation with original style
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
        selectedItemColor: Colors.blue, // Couleur de l'élément sélectionné
        unselectedItemColor: Colors.grey, // Couleur de l'élément non sélectionné
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Met à jour l'index sélectionné
          });
        },
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String text;
  const QuizOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32), // Augmenter l'espace ici
      child: SizedBox(
        width: 263,
        height: 80,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFF92D3B0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 4,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
=======
import 'package:flutter/material.dart';

void main() => runApp(const QuizApp());

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChallengeQuiz(),
    );
  }
}

class ChallengeQuiz extends StatefulWidget {
  const ChallengeQuiz({super.key});

  @override
  _ChallengeQuizState createState() => _ChallengeQuizState();
}

class _ChallengeQuizState extends State<ChallengeQuiz> {
  int _selectedIndex = 0; // Variable to track the selected index

  @override
  Widget build(BuildContext context) {
    const Color greenColor = Color(0xFF92D3B0);
    const Color quizTitleColor = Color(0xFF1DA55C); // Couleur pour le titre

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar: back button + image
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back, size: 28),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.asset(
                      'assets/image/image1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Title with new color
              Text(
                'QUIZ 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: quizTitleColor, // Changer la couleur ici à 1DA55C
                ),
              ),
              const SizedBox(height: 16),

              // Question
              const Text(
                'Quel est le rôle\nprincipal du cœur ?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),

              // Answer buttons centered
              Center(child: QuizOption(text: 'Filtrer le sang')),
              Center(child: QuizOption(text: 'Pomper le sang dans \ntout le corps')),
              Center(child: QuizOption(text: 'Produire des globules rouges')),
            ],
          ),
        ),
      ),

      // Bottom Navigation with original style
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
        selectedItemColor: Colors.blue, // Couleur de l'élément sélectionné
        unselectedItemColor: Colors.grey, // Couleur de l'élément non sélectionné
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Met à jour l'index sélectionné
          });
        },
      ),
    );
  }
}

class QuizOption extends StatelessWidget {
  final String text;
  const QuizOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32), // Augmenter l'espace ici
      child: SizedBox(
        width: 263,
        height: 80,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFF92D3B0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            elevation: 4,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
>>>>>>> dc71bafebd4d95ae216dca0be4a0c09e7248ce80
