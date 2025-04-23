import 'package:flutter/material.dart';

class DefiCuisine extends StatefulWidget {
  const DefiCuisine({super.key});

  @override
  DefiCuisineState createState() => DefiCuisineState();
}

class DefiCuisineState extends State<DefiCuisine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
                children: [
            IconButton(
            icon: Icon(Icons.arrow_back, size: 30, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
            ),
                ],
            ),
            const SizedBox(height: 20),

            // Image principale
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/soup.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),
            const Text(
              "Commencer votre défi",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Liste des plats
            _buildMenuItem("des pates", "assets/pasta.png"),
            _buildMenuItem("salade", "assets/ss.png"),
            _buildMenuItem("oeufs", "assets/oeufe.png"),
            _buildMenuItem("pancake", "assets/pancake.png"),
            _buildMenuItem("toast", "assets/toast.png"),
          ],
        ),
      ),
    );
  }

  // Widget pour un élément de menu
  Widget _buildMenuItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onTap: () {
            print("$title sélectionné");
          },
        ),
      ),
    );
  }
}
