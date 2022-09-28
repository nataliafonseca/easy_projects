import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
          body: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: Text(
                  'Sobre o easyProjects',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: Text(
                  'O easyProjects é uma aplicação de gerenciamento de projetos. Desenvolvido para a matéria Desenvolvimento para dispositivos móveis, no 2o semestre de 2022 na Universidade Tiradentes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Equipe:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40, left: 20, right: 20),
                child: Text(
                  '\n- Natália Braga da Fonseca\n- Natalie Pereira Macedo\n- Natan José de Almeida\n- Natan Nascimento Oliveira Matos',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )),
    );
  }
}
