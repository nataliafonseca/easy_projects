import 'package:easy_projects/data/projects_data.dart';
import 'package:easy_projects/screens/form_screen.dart';
import 'package:easy_projects/screens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Projetos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 40, bottom: 100),
        children: ProjectsData.of(context).projectList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                projectsContext: context,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(title: const Text('easyProjects')),
    //   body: ListView(children: [
    //     Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           const Text(
    //             'Meus Projetos',
    //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //           ),
    //           ElevatedButton(
    //               onPressed: () {
    //                 // Navigator.pushReplacement(
    //                 //   context,
    //                 //   MaterialPageRoute(
    //                 //     builder: (context) => const LoginScreen(),
    //                 //   ),
    //                 // );
    //                 ProjectsData.of(context)
    //                     .newProject('title', 'manager', 'imageUrl', 'deadline');
    //                 setState(() {});
    //                 print(ProjectsData.of(context).projectList);
    //               },
    //               child: const Text('Sair'))
    //         ],
    //       ),
    //     ),
    //     Column(
    //       children: ProjectsData.of(context).projectList,
    //     ),
    //     const SizedBox(
    //       height: 100,
    //     )
    //   ]),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (contextNew) => FormScreen(
    //             projectsContext: context,
    //           ),
    //         ),
    //       );
    //     },
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}
