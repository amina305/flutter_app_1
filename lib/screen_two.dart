<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'crre_compte.dart';
class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/e9zuvxdb.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "<",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Bienvenue à\nnouveau !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildInputField(
                      "Email",
                      _emailController,
                      "demo@email.com",
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/g3u3opwp.png",
                      false,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      "Mot de passe",
                      _passwordController,
                      "••••••••••",
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/ykuwvxob.png",
                      true,
                    ),
                    const SizedBox(height: 5),
                    _buildRememberMeRow(),
                    const SizedBox(height: 30),
                    _buildLoginButton(),
                    const SizedBox(height: 5),
                    _buildSignupRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      String hintText, String iconUrl, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF616161),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                iconUrl,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.check_circle_outline,
                size: 18,
                color: Color(0xFFFF8383),
              ),
              SizedBox(width: 5),
              Text(
                "Remember Me",
                style: TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            "Mot de passe oublié ?",
            style: TextStyle(
              color: Color(0xFFFF8383),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
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
    );
  }

  Widget _buildSignupRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Vous n’avez pas de compte ?",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              // Navigation vers la page "Créer un compte"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreerCompte()),
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
    );
  }
=======
import 'package:flutter/material.dart';
import 'crre_compte.dart';
class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/e9zuvxdb.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "<",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Bienvenue à\nnouveau !",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    _buildInputField(
                      "Email",
                      _emailController,
                      "demo@email.com",
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/g3u3opwp.png",
                      false,
                    ),
                    const SizedBox(height: 20),
                    _buildInputField(
                      "Mot de passe",
                      _passwordController,
                      "••••••••••",
                      "https://storage.googleapis.com/tagjs-prod.appspot.com/qGoJPkUONC/ykuwvxob.png",
                      true,
                    ),
                    const SizedBox(height: 5),
                    _buildRememberMeRow(),
                    const SizedBox(height: 30),
                    _buildLoginButton(),
                    const SizedBox(height: 5),
                    _buildSignupRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, TextEditingController controller,
      String hintText, String iconUrl, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF616161),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                iconUrl,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller,
                  obscureText: isPassword,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(
                Icons.check_circle_outline,
                size: 18,
                color: Color(0xFFFF8383),
              ),
              SizedBox(width: 5),
              Text(
                "Remember Me",
                style: TextStyle(
                  color: Color(0xFF424242),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            "Mot de passe oublié ?",
            style: TextStyle(
              color: Color(0xFFFF8383),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
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
    );
  }

  Widget _buildSignupRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Vous n’avez pas de compte ?",
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              // Navigation vers la page "Créer un compte"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreerCompte()),
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
    );
  }
>>>>>>> dc71bafebd4d95ae216dca0be4a0c09e7248ce80
}