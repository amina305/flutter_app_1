import 'package:flutter/material.dart';
import 'change_mot_de_passe.dart'; // ou le chemin correct selon où tu le places


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        children: [
          Positioned(
            top: 399,
            left: 110,
            child: Container(
              width: 460,
              height: 460,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFCE4EC),
              ),
            ),
          ),
          Positioned(
            bottom: 160,
            right: 5,
            child: Container(
              width: 460,
              height: 460,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFCE4EC),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Simule une AppBar avec une hauteur et un fond blanc
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 80, // Hauteur similaire à une AppBar
                  decoration: const BoxDecoration(
                    color: Colors.white, // Même couleur que le fond
                    border: Border(
                      bottom: BorderSide(color: Colors.black, width: 1), // Ajoute la bordure noire en bas
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.chevron_left, size: 32),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const Text(
                            "Compte",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200],
                                ),
                                child: Image.asset(
                                  'assets/images/artist_807842.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "MODIFIER MON AVATAR",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 30),
                          buildInputField("assets/icons/mail.png", "Nom", "minabr"),
                          buildInputField("assets/icons/mail.png", "Nom de profil", "mina"),
                          buildInputField("assets/icons/mail.png", "Email", "demo@email.com"),
                          //buildInputField("assets/icons/lock - 24px.png", "Mot de passe", "••••••••••", isPassword: true),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                              );
                            },
                            child: buildInputField("assets/icons/lock - 24px.png", "Mot de passe", "••••••••••", isPassword: true),
                          ),

                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Pays",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Algérie",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(width: 8),
                                        Image.asset(
                                          'assets/icons/Frame.png',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const Icon(Icons.chevron_right, size: 40),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40),
                          // Section Notifications
                          const NotificationSettings(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 80, height: 48),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/galerie 1.png', width: 30, height: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/profile.png', width: 80, height: 48),
            label: "",
          ),
        ],
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}
// Widget pour la gestion des notifications
class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  NotificationSettingsState createState() => NotificationSettingsState();
}

class NotificationSettingsState extends State<NotificationSettings> {
  bool isReminderOn = false;
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Notifications",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(

              offset: Offset(0, 7), // Descend "Rappel" de 5 pixels
              child: Text(
                "Rappel",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Switch(
              value: isReminderOn,
              onChanged: (value) {
                setState(() {
                  isReminderOn = value;
                });
              },
              activeColor: Colors.white, // 🟦 Couleur du bouton activé
              activeTrackColor: Colors.lightBlueAccent,  // 🟦 Couleur de la piste activée
            ),
          ],
        ),



        const Divider(),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: selectedTime,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: ThemeData.light().copyWith(
                    primaryColor: Colors.lightBlueAccent,
                    hintColor: Colors.lightBlueAccent,
                    timePickerTheme: TimePickerThemeData(
                      hourMinuteColor: Colors.white, // Fond des heures et minutes en blanc
                      hourMinuteTextColor: Colors.black, // Texte des heures/minutes en NOIR
                      hourMinuteTextStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                          height: 3, // Augmenter la hauteur pour remonter les deux points
                        color: Colors.black, // Met les chiffres de l'heure/minute en noir
                      ),
                      dialHandColor: Colors.lightBlueAccent, // Aiguille de sélection en bleu ciel
                      dialBackgroundColor: Colors.white, // Fond du cadran en blanc
                      entryModeIconColor: Colors.lightBlueAccent, // Icône de changement de mode en bleu ciel
                      dayPeriodTextColor: Colors.black, // Texte AM/PM en NOIR
                      helpTextStyle: const TextStyle(color: Colors.black, fontSize: 16), // Texte "SELECT TIME" en noir
                      dialTextColor: WidgetStateColor.resolveWith((states) => Colors.black), // Chiffres de l'horloge en noir
                      confirmButtonStyle: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.black), // Texte des boutons "OK" et "CANCEL" en NOIR
                      ),
                      cancelButtonStyle: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(Colors.black), // ✅ "CANCEL" en noir
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );




            if (picked != null && picked != selectedTime) {
              setState(() {
                selectedTime = picked;
              });
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Heure de rappel", style: TextStyle(fontSize: 16)),
              Text(
                "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],

          ),
        ),
        const Divider(),
        SizedBox(height: 10),
      ],
    );
  }
}

Widget buildInputField(String iconPath, String label, String placeholder, {bool isPassword = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 5),
      TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(iconPath, width: 24, height: 24),
          ),
          hintText: placeholder,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 2),
          ),
        ),
      ),
      const SizedBox(height: 15),

    ],
  );

}
