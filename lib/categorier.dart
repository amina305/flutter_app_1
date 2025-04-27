import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

// sport pause
class RestPage extends StatefulWidget {
  final VoidCallback onRestEnd;
  final AudioPlayer audioPlayer;

  const RestPage({super.key, required this.onRestEnd, required this.audioPlayer});

  @override
  RestPageState createState() => RestPageState();
}

class RestPageState extends State<RestPage> {
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
            color: Color(0xBFC0B6FF), // ✅ couleur avec 75% d'opacité
          ),

          // 🔹 Contenu principal
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Repos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 76.5),
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "00:${restTime.toString().padLeft(2, '0')}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    shadows: [
                      Shadow(
                        color: Colors.black.withValues(alpha: 76.5),

                        blurRadius: 10,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xEBFFFFFF), // ✅ blanc avec 92% opacité
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                      ),
                      onPressed: addTime,
                      child: Text("+20s"),
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent.withAlpha(235), // ✅ 92% opacité
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
