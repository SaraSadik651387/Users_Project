import 'package:flutter/material.dart';
//import 'package:flutter_application_6/models/user.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;


  const InfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, size: 20, color: Colors.grey,),
        title: Text(title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
        subtitle: Text(description, style: TextStyle(fontSize: 14,color: const Color.fromARGB(255, 105, 104, 104)),),
      ),
      ),
      );
  }
}