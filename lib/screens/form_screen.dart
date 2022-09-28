import 'package:easy_projects/data/projects_data.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.projectsContext});

  final BuildContext projectsContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController managerController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

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
          title: const Text('Novo Projeto'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Text(
                      'Título',
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
                  controller: titleController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'Título'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Responsável',
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
                  controller: managerController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'Responsável'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: const [
                    Text(
                      'Prazo',
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
                  controller: deadlineController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'Prazo'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: const [
                    Text(
                      'URL da Imagem',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.url,
                  controller: imageUrlController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.blue[50],
                      hintText: 'URL da Imagem'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ProjectsData.of(widget.projectsContext).newProject(
                          titleController.text,
                          managerController.text,
                          imageUrlController.text,
                          deadlineController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Criando um novo Projeto'),
                        ),
                      );
                      Navigator.pop(widget.projectsContext);
                    }
                  },
                  child: const Text('Criar'),
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
