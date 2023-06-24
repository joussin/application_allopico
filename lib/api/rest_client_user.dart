import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';


// API
import 'rest_client.dart'; 
import 'rest_client_user.dart'; 
import 'rest_client_auth.dart'; 
import 'user.dart';
import 'token.dart';


class RestClientUser extends RestClient
{

  Future<User> getLoggedUser() async {
  
        Token token = await RestClientAuth().awaitGetToken();

        final response = await http.get(
          Uri.parse( this.API_URL + "/auth/user"),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer ' + token.token,
          },
        );

        return User.fromJson(
          this.formatResponse(response)
        );
    }



    Future<List<User>> getAllUsers() async {
 
      Token token = await RestClientAuth().awaitGetToken();

      final response = await http.get(
        Uri.parse( this.API_URL + "/users"),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + token.token,
        },
      );

      List<User> usersList = [];
      var results = jsonDecode(response.body);

      for (var result in results) {
        var user = User.fromJson(result);
        usersList.add(user);
      }
      return usersList;
  }



    Future<User> getUserById(int id) async {
 
      Token token = await RestClientAuth().awaitGetToken();

      final response = await http.get(
        Uri.parse( this.API_URL + "/user/"+ (id as String) ),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ' + token.token,
        },
      );

      return User.fromJson(
        this.formatResponse(response)
      );
  }



  Future<User> editUserById(int id, String name, String email, String password, String phone) async {

      Token token = await RestClientAuth().awaitGetToken();

        final response = await http.put(
          Uri.parse( this.API_URL + "/user/" + (id as String)),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
             HttpHeaders.authorizationHeader: 'Bearer ' + token.token,
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'password': password,
            'phone': phone,
        })
      );

      return User.fromJson(
        this.formatResponse(response)
      );
  }




  Future<User> deleteUserById(int id) async {

         Token token = await RestClientAuth().awaitGetToken();


        final response = await http.delete(
          Uri.parse( this.API_URL + "/user/" + (id as String)),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
             HttpHeaders.authorizationHeader: 'Bearer ' + token.token,
          }
      );

      return User.fromJson(
        this.formatResponse(response)
      );
  }





}