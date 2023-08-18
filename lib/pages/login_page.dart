import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';
import 'package:frontend/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  final List<Pokemon> pokemonList;
  const LoginPage({Key? key, required this.pokemonList}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";

  String? usernameError;
  String? passwordError;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearError() {
    setState(() {
      usernameError = null;
      passwordError = null;
    });
  }

  void login() {
    clearError();
    username = usernameController.text;
    password = passwordController.text;

    if (username.isEmpty) {
      usernameError = "Username is empty";
      return;
    }

    if (password.isEmpty) {
      passwordError = "Password is empty";
      return;
    } else if (password.length < 8) {
      passwordError = "Password must be at least 8 characters";
      return;
    } else if (!isAlphanumeric(password)) {
      passwordError = "Password must be alphanumeric";
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Login Success"),
      ),
    );

    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) =>
            MainPage(username: username, pokemonList: widget.pokemonList)),
      ),
    );
  }

  bool isAlphanumeric(String pass) {
    RegExp letters = RegExp(r'[a-zA-Z]');
    RegExp numbers = RegExp(r'[0-9]');

    return letters.hasMatch(pass) && numbers.hasMatch(pass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: SizedBox(
            height: 50,
            width: 500,
            child: Image.asset("lib/assets/Logo.png"),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login Page",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
              ),
              if (usernameError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    usernameError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    )),
                obscureText: true,
              ),
              if (passwordError != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    passwordError!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  login();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    minimumSize: const Size(double.maxFinite, 0),
                    textStyle: const TextStyle(
                      fontSize: 16,
                    )),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
