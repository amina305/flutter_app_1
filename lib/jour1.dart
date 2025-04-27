import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'exercice_item.dart';
import 'play_page_ex1.dart';

class TestLottie extends StatelessWidget {
  const TestLottie({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/lottie/fente.json",
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Jour1 extends StatelessWidget {
  const Jour1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Entraînement Jour 1")),
      body: ListView(
        children: [
          ExerciceItem(
            nomExercice: "Jumping Jack",
            animationPath: "assets/animations/jumping_jack.json",
          ),
          ExerciceItem(
            nomExercice: "Burpees",
            animationPath: "assets/animations/burpees.json",
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Page2(),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  Page2State createState() => Page2State();
}

class Page2State extends State<Page2> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  int restTime = 30;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showRestTimePicker() {
    int selectedRestTime = restTime;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Minuteur de repos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Column(
                    children: [5, 10, 15, 20, 25].map((time) {
                      return ListTile(
                        title: Text("${time}s"),
                        tileColor: selectedRestTime == time ? Colors.grey[200] : null,
                        onTap: () {
                          setModalState(() {
                            selectedRestTime = time;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFC0B6FF), minimumSize: Size(double.infinity, 50)),
                    onPressed: () {
                      setState(() {
                        restTime = selectedRestTime;
                      });
                      Navigator.pop(context);
                    },
                    child: Text("TERMINÉ", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildExerciseTile(String title, String duration, String reps, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: imagePath.isNotEmpty
            ? (imagePath.endsWith(".json") // Vérifie si c'est un JSON (Lottie)
            ? Lottie.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover)
            : Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover))
            : null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(reps, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          ],
        ),
        subtitle: Text(duration),
        trailing: Padding(padding: const EdgeInsets.only(right: 20.0), child: Icon(Icons.chevron_right, color: Colors.grey)),
        tileColor: Colors.grey[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 32),
          onPressed: () {
            //Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Jour 1", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Column(
                            children: [
                              Text("5", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text("Exercices", style: TextStyle(color: Color(0xFF6D6E70))),
                            ],
                          ),
                          GestureDetector(
                            onTap: _showRestTimePicker,
                            child: Column(
                              children: [
                                Text("Réglages Min", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                Text("de repos >", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          const Column(
                            children: [
                              Text("92.1 Kcal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text("(=)", style: TextStyle(color: Color(0xFF616161))),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Exercices", style: TextStyle(color: Color(0xFF616161), fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          _buildExerciseTile("Jumping Jacks", "30s", "x3", "assets/lottie/abd.json"),
                          _buildExerciseTile("Burpees", "30s", "x3", "assets/lottie/burpees.json"),
                          _buildExerciseTile("Pompes", "15 reps", "x3", "assets/lottie/pompe.json"),
                          _buildExerciseTile("Fentes Alternées", "15 reps/jambe", "x3", "assets/lottie/fente2.json"),
                          _buildExerciseTile("Crunchs abs", "20 reps", "x3", "assets/lottie/jumping.json"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.25,
                right: MediaQuery.of(context).size.width * 0.25,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Exo()), // Remplace PageSuivante par ta page cible
                    );
                  },
                  child: Container(
                    width: 271,
                    height: 60, // Augmente la hauteur
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFC0B6FF), // Nouvelle couleur de la boîte
                      borderRadius: BorderRadius.circular(10), // Coins arrondis
                    ),
                    child: Center(
                      child: Text(
                        "Début",
                        style: TextStyle(
                          color: Colors.white, // Couleur du texte
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
