
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_6/models/user.dart';
import 'package:flutter_application_6/widgets/info_card.dart';

class UserDetails extends StatelessWidget {
  final User user;
  final String imagePath;
  const UserDetails({required this.user,required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER ID :${user.id}',style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 85, 8, 2)),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(imagePath,
                  width: 200,
                  height: 150,)
                ),
                Text('${user.name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text('${user.username}',style: TextStyle(color: Colors.grey,fontSize: 16,),),

                InfoCard(title: 'email',
                 description: user.email, 
                 icon: Icons.email),

                 InfoCard(title: 'phone',
                 description: user.phone, 
                 icon: Icons.phone),

                 InfoCard(title: 'website',
                 description: user.website, 
                 icon: Icons.web),

                 InfoCard(title: 'company',
                 description: user.company['name'], 
                 icon: Icons.home),
                
            
              ],),
          ),
        ),
      ),
    );
  }
}

