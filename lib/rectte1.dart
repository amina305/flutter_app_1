import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RecettePage(),
  ));
}

class RecettePage extends StatelessWidget {
  const RecettePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, size: 32),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Recette de pâtes"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Center(
             child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/ingrediants/patteeee.jpg",
                    height: 200,
                  ),
        IconButton(
        icon: Icon(Icons.play_circle_fill, size: 50, color: Colors.white),
        onPressed: () async {
          final Uri url = Uri.parse("https://www.youtube.com/watch?v=8G-ZxTjD7Zc");
          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
            throw 'Impossible d\'ouvrir l\'URL $url';
          }
        },
      ),


      ],
              ),
          ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.leaderboard, color: Colors.black),
                      Text("Difficulté"),
                      Text("Facile", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.timer, color: Colors.black),
                      Text("Préparation"),
                      Text("20 min", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.schedule, color: Colors.black),
                      Text("Temps total"),
                      Text("28 min", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                "INGRÉDIENTS :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Column(
                children: [
                  ingredientItem("assets/ingrediants/Pasta Mezze Penne 28 1.png", "400g de pâtes"),
                  ingredientItem("assets/ingrediants/Quiche au thon sans pâte 1.png", "280g de thon au naturel"),
                  ingredientItem("assets/ingrediants/aiil 1.png", "2 gousses d'ail"),
                  ingredientItem("assets/ingrediants/Tout savoir sur le poivre 1.png", "Sel et poivre"),
                  ingredientItem("assets/ingrediants/Courgettes au jambon 1.png", "1 oignon"),
                  ingredientItem("assets/ingrediants/Sauce tomate à l’origan 1.png", "400g de sauce tomate"),
                  ingredientItem("assets/ingrediants/Découvrez le trésor culinaire de la Grèce en un… 1.png", "Huile d'olive"),
                  ingredientItem("assets/ingrediants/469b8e2e-cb74-41cc-98e2-7c29d39c1736 2.png", "Parmesan ou gruyère"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "PRÉPARATION :",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text("1. Émincer l'oignon et l'ail."),
              Text("2. Chauffer l'huile d'olive et faire revenir l'oignon et l'ail."),
              Text("3. Ajouter la sauce tomate, le sel et le poivre, et laisser mijoter."),
              Text("4. Faire cuire les pâtes dans de l'eau bouillante."),
              Text("5. Égoutter les pâtes et les mélanger avec la sauce tomate."),
              Text("6. Ajouter le gruyère râpé."),
              Text("7. Mélanger jusqu'à ce que le fromage fonde."),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text("C'est terminé", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ingredientItem(String imagePath, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Image.asset(imagePath, width: 40, height: 40),
          SizedBox(width: 10),
          Expanded(child: Text(name)),
        ],
      ),
    );
  }
}
