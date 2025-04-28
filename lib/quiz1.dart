import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  QuizAppState createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return const ChallengeQuiz(); // Affiche le quiz
  }
}

class ChallengeQuiz extends StatefulWidget {
  const ChallengeQuiz({super.key});

  @override
  _ChallengeQuizState createState() => _ChallengeQuizState();
}

class _ChallengeQuizState extends State<ChallengeQuiz> {
  int _selectedIndex = 0; // Variable pour suivre l'index sélectionné
  String? _feedbackMessage; // Message de feedback (bravo ou triste)
  Color _buttonColor = const Color(0xFF92D3B0); // Couleur par défaut des boutons

  // Liste des options et la bonne réponse
  final List<String> _options = [
    'Filtrer le sang',
    'Pomper le sang dans \ntout le corps',
    'Produire des globules rouges'
  ];
  final String _correctAnswer = 'Pomper le sang dans \ntout le corps';

  @override
  Widget build(BuildContext context) {
    const Color quizTitleColor = Color(0xFF1DA55C); // Couleur pour le titre

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar : bouton retour + image
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

              // Titre avec nouvelle couleur
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

              // Boutons de réponse
              Column(
                children: _options.map((option) {
                  return QuizOption(
                    text: option,
                    onPressed: () {
                      _checkAnswer(option);
                    },
                    buttonColor: option == _correctAnswer
                        ? Colors.green
                        : (_feedbackMessage != null && option != _correctAnswer)
                        ? Colors.red
                        : _buttonColor,
                  );
                }).toList(),
              ),

              // Message de feedback
              if (_feedbackMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    _feedbackMessage!,
                    style: TextStyle(
                      fontSize: 20,
                      color: _feedbackMessage == 'Bravo!' ? Colors.green : Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Méthode pour vérifier la réponse
  void _checkAnswer(String selectedOption) {
    setState(() {
      if (selectedOption == _correctAnswer) {
        _feedbackMessage = 'Bravo!';
      } else {
        _feedbackMessage = 'Triste... Ce n\'est pas la bonne réponse.';
      }
    });
  }
}

class QuizOption extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final Color buttonColor;

  const QuizOption({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32), // Augmenter l'espace ici
      child: SizedBox(
        width: 263,
        height: 80,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: buttonColor,
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
