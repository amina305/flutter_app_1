import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
//sport pause
class RestPage extends StatefulWidget {
  final VoidCallback onRestEnd;
  final AudioPlayer audioPlayer;

  const RestPage({Key? key, required this.onRestEnd, required this.audioPlayer}) : super(key: key);

  @override
  _RestPageState createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {
  int restTime = 25;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startRest();
    playMusic();
  }

  void startRest() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (restTime > 0) {
        setState(() {
          restTime--;
        });
      } else {
        t.cancel();
        widget.onRestEnd();
      }
    });
  }

  void playMusic() async {
    await widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
    await widget.audioPlayer.play(AssetSource("music.mp3"));
  }

  void stopMusic() {
    widget.audioPlayer.stop();
  }

  void addTime() {
    setState(() {
      restTime += 20;
    });
  }

  void skipRest() {
    timer.cancel();
    stopMusic();
    widget.onRestEnd();
  }

  @override
  void dispose() {
    timer.cancel();
    stopMusic();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔹 Image de fond
          Image.asset(
            "assets/image/background.png",
            fit: BoxFit.cover,
          ),

          // 🔹 Couche semi-transparente
          Container(
            color: Color(0xFFC0B6FF).withOpacity(0.75), // ✅ Légèrement plus foncé pour un effet premium
          ),

          // 🔹 Contenu principal
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Effet plus élégant et bold sur "Repos"
                Text(
                  "Repos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45, // 🔹 Légèrement plus grand
                    fontWeight: FontWeight.w900, // 🔹 Ultra bold pour un effet premium
                    letterSpacing: 1.5, // 🔹 Espacement pour un rendu plus aéré
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3), // ✅ Ombre subtile
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15), // ✅ Espacement amélioré

                // ✅ Effet amélioré sur le temps
                Text(
                  "00:${restTime.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48, // 🔹 Un peu plus petit pour un meilleur équilibre
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3), // ✅ Effet d'ombre subtil
                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30), // ✅ Espacement équilibré

                // ✅ Boutons avec plus d'espace et un effet premium
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.92),
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14), // ✅ Taille optimisée
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5, // ✅ Effet d'ombre pour un look premium
                      ),
                      onPressed: addTime,
                      child: Text("+20s"),
                    ),
                    SizedBox(width: 25), // ✅ Meilleur espacement entre les boutons
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withOpacity(0.92),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                      ),
                      onPressed: skipRest,
                      child: Text("Passer"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
