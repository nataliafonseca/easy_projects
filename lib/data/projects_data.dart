import 'package:easy_projects/components/project_listing.dart';
import 'package:flutter/material.dart';

class ProjectsData extends InheritedWidget {
  ProjectsData({super.key, required Widget child}) : super(child: child);

  final List<ProjectListing> projectList = [
    const ProjectListing(
        title: 'Blackbelt',
        manager: 'Natalie',
        imageUrl: 'https://github.com/blackbeltinc.png',
        deadline: '15 dias'),
    const ProjectListing(
        title: 'Woofs',
        manager: 'Natália',
        imageUrl: 'https://github.com/woofsinc.png',
        deadline: '2 meses')
  ];

  void newProject(
      String title, String manager, String imageUrl, String deadline) {
    projectList.add(ProjectListing(
        title: title,
        manager: manager,
        imageUrl: imageUrl,
        deadline: deadline));
  }

  static ProjectsData of(BuildContext context) {
    final ProjectsData? result =
        context.dependOnInheritedWidgetOfExactType<ProjectsData>();
    assert(result != null, 'No ProjectsData found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ProjectsData oldWidget) {
    return true;
  }
}
