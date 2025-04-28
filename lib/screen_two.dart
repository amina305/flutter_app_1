import 'package:flutter/material.dart';
import 'crre_compte.dart'; // Assurez-vous d'importer la nouvelle page

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  Page7State createState() => Page7State();
}

class Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Remplacer le cercle rose par l'image locale
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/image3.png'), // Utilisation de l'image locale
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle, // Assure que l'image soit ronde
              ),
            ),
          ),
          SingleChildScrollView(
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.only(top: 42, bottom: 26),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/image3.png'), // Image locale pour le fond
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 150, left: 19), // Augmentez la marge pour déplacer le texte vers le bas
                      width: 209,
                      child: Text(
                        "Bienvenue à\nnouveau !",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30, // Réduit la taille de la police
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12),
                          const Text(
                            "Email",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'demo@email.com',
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Mot de passe',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: '••••••••••',
                              hintStyle: TextStyle(color: Colors.black54),
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
                              suffixIcon: Icon(Icons.visibility_outlined, color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    size: 18,
                                    color: Color(0xFFFF8383),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    'Remember Me',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Mot de passe oublié ?',
                                  style: TextStyle(
                                    color: Color(0xFFFF8383),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "Se connecter",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Vous n'avez pas de compte ?",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    // Aller vers la page d'inscription
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const CreerCompte()),
                                    );
                                  },
                                  child: const Text(
                                    "S'inscrire",
                                    style: TextStyle(
                                      color: Color(0xFFFF8383),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
