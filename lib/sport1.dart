import 'package:flutter/material.dart';

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  Page6State createState() => Page6State();
}

class Page6State extends State<Page6> {
  int _selectedIndex = 0;
  int currentDaySport = 1; // Jour du défi Sport
  int scoreSport = 0; // Score du défi Sport

  // Fonction pour recommencer seulement le défi Sport
  void restartSportChallenge() {
    setState(() {
      currentDaySport = 1; // Remet les jours de Sport à 1
      scoreSport = 0; // Réinitialise le score de Sport
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IntrinsicHeight(
                          child: Container(
                            margin: EdgeInsets.only(bottom: screenHeight * 0.02),
                            width: double.infinity,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: screenHeight * 0.03,
                                          horizontal: screenWidth * 0.05),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage("assets/image/Group 443.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "See All",
                                                style: TextStyle(
                                                  color: Color(0xFF7C4DFF),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white.withValues(
                                                  alpha: 204, // 0.8 * 255 ≃ 204
                                                  red:   255,
                                                  green: 255,
                                                  blue:  255,
                                                ),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "assets/image/Group 443.png", // Remplace par le chemin de ton image locale
                                                    width: 25,
                                                    height: 25,
                                                  ),
                                                ),

                                              ),
                                            ],
                                          ),
                                          SizedBox(height: screenHeight * 0.2),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.02),
                                    Center(
                                      child: Column(
                                        children: List.generate(10, (index) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (index == 3 || index == 7) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RestDayPage(),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: screenWidth * 0.85,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(15),
                                                color: Color(0xFFF3F1FF),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 20),
                                              margin: EdgeInsets.only(
                                                  bottom: screenHeight * 0.01),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          "Jour ${index + 1}",
                                                          style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 22,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          (index == 3 || index == 7)
                                                              ? "Repos"
                                                              : "x4 exercice",
                                                          style: TextStyle(
                                                            color: Color(0xFF6D6E70),
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (index == 3 || index == 7)
                                                    SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: Image.network(
                                                        "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/94mhh1c1.png",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: restartSportChallenge,
                            icon: Icon(Icons.refresh, color: Colors.blue),
                            label: Text(
                              "Recommencer le programme ",
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              elevation: 2,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class RestDayPage extends StatelessWidget {
  const RestDayPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jour de repos", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Icon(Icons.spa, size: 80, color: Colors.grey[400]),
          SizedBox(height: 20),
          Text(
            "Votre corps et vos muscles ont\nbesoin de repos",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "FINI",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
