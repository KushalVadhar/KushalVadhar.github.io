class ProjectUtils{
  final String image;
  final String title;
  final String subtitle;
  final String? weblink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.weblink,
   

  });
  

}

List <ProjectUtils> flutterProjectUtils = [
  ProjectUtils(image: 'lib/assets/Taxi App.PNG', title: 'Taxi App UI', subtitle: 'An Application which is used to book a Taxi', weblink: ''),
  ProjectUtils(image: 'lib/assets/3d model.PNG', title: '3D Model Viewer', subtitle: 'An Application which is used to view 3d Model', weblink: ''),
  
];