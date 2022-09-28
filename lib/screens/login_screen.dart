import 'package:easy_projects/data/projects_data.dart';
import 'package:easy_projects/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool requiredValidator(String? value) {
    return (value == null || value.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('easyProjects'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Login',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Text(
                      'Usuário',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (String? value) {
                    return requiredValidator(value)
                        ? 'Este campo é obrigatório'
                        : null;
                  },
                  controller: userController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'Usuário'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: const [
                    Text(
                      'Senha',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (String? value) {
                    return requiredValidator(value)
                        ? 'Este campo é obrigatório'
                        : null;
                  },
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'Senha'),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProjectsData(child: const HomeScreen()),
                        ),
                      );
                    }
                  },
                  child: const Text('Entrar'),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
