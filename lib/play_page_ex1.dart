import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import'jour1.dart';
import 'play_page_ex2.dart';

class Exo extends StatefulWidget {
  const Exo({super.key});

  @override
  ExoState createState() => ExoState();//jhgjyf
}


class ExoState extends State<Exo> with SingleTickerProviderStateMixin {
  bool isExiting = false;
  bool isWarningPlaying = false;
  late AnimationController _controller;
  late AudioPlayer _audioPlayer;
  bool isPlaying = true;
  bool isMusicPlaying = false;
  bool isLiked = false; // Gère l'état du bouton "J'aime"
  bool isDisliked = false; // Gère l'état du bouton "J'aime pas"
  int remainingTime = 30;
  int repetitions = 3;
  bool isResting = false;
  Timer? _timer;
  int currentMusicIndex = 0;
  void disposeAudio() {
    _audioPlayer.stop(); // Arrête complètement le son
  }
  void stopWarningSounds() {
    _audioPlayer.stop(); // Arrête immédiatement tout son en cours
  }


  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _startAutoStopTimer();
    _controller = AnimationController(vsync: this);
    _playSound('son/achive-sound-132273.mp3'); // Son au début de l'exercice

  }

  void _startAutoStopTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _timer?.cancel();
        if (repetitions > 1) {
          setState(() {
            repetitions--;
            isResting = true;
            _controller.stop();
          });
        } else {
          setState(() {
            isPlaying = false;
            _controller.stop();
          });
        }
      }
      if (remainingTime == 5) {
        _playSound('son/ticking-clock-sound-effect-1-mp3-edition-264451.mp3'); // Son à 5 secondes de la fin
      }
      if (remainingTime == 0) {
        _playSound('son/achive-sound-132273.mp3'); // Son à la fin
      }
      if (remainingTime == 5 && !isWarningPlaying) {
        _playWarningSound(); // Son à 5 secondes de la fin avec gestion pause/reprise
      }
    });

    if (remainingTime == 0) {
      _playSound('son/achive-sound-132273.mp3'); // Son à la fin
      Future.delayed(Duration(seconds: 1), () {
        // Vérification si la page est encore présente avant de naviguer
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Exo2()), // Exo2 est la page de play_page_ex2.dart
          );
        }
      });
    }
  }

  void _playSound(String fileName) async {
    if (isExiting && (fileName == 'son/ticking-clock-sound-effect-1-mp3-edition-264451.mp3' || fileName == 'son/achive-sound-132273.mp3')) {
      return; // Ne joue pas le son si on quitte la page
    }
    await _audioPlayer.play(AssetSource(fileName));
  }


  void _playWarningSound() async {
    if (isExiting) return; // Empêche la lecture si on quitte la page

    if (!isWarningPlaying) {
      isWarningPlaying = true;
      await _audioPlayer.play(AssetSource('warning.mp3'));
      isWarningPlaying = false;
    }
  }




  // Fonction pour activer/désactiver "J'aime"
  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) isDisliked = false; // Désactive "J'aime pas" si "J'aime" est activé
    });
  }

  // Fonction pour activer/désactiver "J'aime pas"
  void _toggleDislike() {
    setState(() {
      isDisliked = !isDisliked;
      if (isDisliked) isLiked = false; // Désactive "J'aime" si "J'aime pas" est activé
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (isResting) {
        isResting = false;
        remainingTime = 30;
        _controller.repeat();
        _startAutoStopTimer();
      } else {
        if (isPlaying) {
          _controller.stop();
          _timer?.cancel();
          _audioPlayer.pause(); // Pause du son principal et warning
        } else {
          _controller.repeat();
          _startAutoStopTimer();
          _audioPlayer.resume(); // Reprise du son principal et warning
        }
        isPlaying = !isPlaying;
      }
    });
  }

  @override
  void dispose() {
    isExiting = true; // Marquer la sortie pour empêcher les sons
    _audioPlayer.stop();
    _controller.dispose();
    _timer?.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.chevron_left, size: 32),
                    onPressed: () {
                      isExiting = true; // Indique qu'on quitte la page
                      _audioPlayer.stop(); // Arrête immédiatement tout son en cours
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Page2()),
                      );
                    },



                  ),

                  //Icon(Icons.sports), // Icône de sport en haut à droite
                  IconButton(
                    icon: Icon(Icons.fitness_center, size: 32), // Ajout de l'icône à droite
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Lottie.asset(
                  'assets/lottie/abd.json',
                  controller: _controller,
                  width: 200,
                  height: 200,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.repeat();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    isResting ? 'Repos' : '00:${remainingTime.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'JUMPING JACKS',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.info_outline, size: 20),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: LinearProgressIndicator(
                value: remainingTime / 30.0,
                color: Color(0xFFC0B6FF),
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 16),

            // ✅ Ajout des boutons "J'aime" et "J'aime pas" fonctionnels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 28,
                      color: isLiked ? Colors.blue : Colors.black,
                    ),
                    onPressed: _toggleLike,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.thumb_down_alt_outlined,
                      size: 28,
                      color: isDisliked ? Colors.red : Colors.black,
                    ),
                    onPressed: _toggleDislike,
                  ),
                ],
              ),
            ),

            // ✅ Ajout du bouton Play/Pause et des boutons précédent/suivant
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.skip_previous, size: 40),
                    onPressed: () {},
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0XFFC0B6FF),
                    ),
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 40,
                        color: Colors.white,
                      ),
                      onPressed: _togglePlayPause,
                    ),
                  ),
                    Icon(Icons.skip_next, size: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Exo(),
    debugShowCheckedModeBanner: false,
  ));
}
