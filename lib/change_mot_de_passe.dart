import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool oldPassVisible = false;
  bool newPassVisible = false;
  bool confirmPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 399,
            left: 110,
            child: Container(
              width: 460,
              height: 460,
              decoration: const BoxDecoration(
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFCE4EC),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Barre de titre
                  Container(
                    height: 60,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon:  const Icon(Icons.chevron_left, size: 32),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Mot de passe',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40), // pour équilibrer visuellement
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildPasswordField("Ancien mot de passe", oldPassVisible, (v) {
                    setState(() => oldPassVisible = v);
                  }),
                  buildPasswordField("Nouveau mot de passe", newPassVisible, (v) {
                    setState(() => newPassVisible = v);
                  }),
                  buildPasswordField("Confirmer le mot de passe", confirmPassVisible, (v) {
                    setState(() => confirmPassVisible = v);
                  }),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        "SAUVEGARDER",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(String label, bool isVisible, Function(bool) onToggle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          obscureText: !isVisible,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => onToggle(!isVisible),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
