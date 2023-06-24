import 'dart:html';

import 'package:flutter/material.dart';

 import 'dart:async';
import 'dart:convert';
import 'dart:io';


// API
import 'api/rest_client.dart'; 
import 'api/rest_client_user.dart'; 
import 'api/rest_client_auth.dart'; 
import 'api/user.dart';
import 'api/token.dart';

import 'api/storage.dart';

import 'package:localstorage/localstorage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



 


/*
 late Future<List<User>> futureUsers;
    futureUsers = RestClientUser().getAllUsers(); 
print("-------futureUsers-------------");
  print(futureUsers);


 
 late Future<User> resultUser1;
    resultUser1 = RestClientUser().getUserById(1); 
print("-----getUserById--resultUser1-------------");
  print(resultUser1);



 late Future<User> resultUser2;
    resultUser2 = RestClientAuth().getLoggedUser(); 
print("-----getUsgetLoggedUsererById--resultUser2-------------");
  print(resultUser2);

*/

    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        
      ),
    );
  }
}