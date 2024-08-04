// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/api/api.dart';
import 'package:flutter_application_6/models/user.dart';
import 'package:flutter_application_6/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState()  {
    Api api = Api();

    Future<List<User>> users = api.getUsers(); 
    print(users);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 189, 197),
        title: Text('Users',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 248, 247, 247)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: userProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : userProvider.errorMessage != null 
        ? Center(
          child: Text(
            userProvider.errorMessage!,
            ),
            )
        : ListView.builder(
          itemCount: userProvider.users.length,
          itemBuilder: (context, index) {
            User user = userProvider.users[index];
            int n = Random().nextInt(4) + 1;
            return UserCard(ImagePath: 'assets/images/${n}.png',
            user: user,
            );
          }),
      ),
    );
  }
}