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

class RestClientAuth extends RestClient {

  Future<Token> awaitGetToken() async {

      String email = this.email; // TODO : changer ceci
      String password = this.password; // TODO : changer ceci
      String device_name= this.device_name; // TODO : changer ceci
      
      late Token token;
      
      await Future.wait<void>([
        RestClientAuth().getToken(email, password, device_name)
        .then((resultAsToken) => {token = resultAsToken})
      ]);

      return token;
  }

  Future<Token> register(String name, String email, String password, String phone) async {

        final response = await http.post(
          Uri.parse( this.API_URL + "/auth/register"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': name,
            'email': email,
            'password': password,
            'phone': phone,
        })
      );

      return Token.fromJson(
        this.formatResponse(response)
      );
  }




  Future<Token> login(String email, String password) async {

        final response = await http.post(
          Uri.parse( this.API_URL + "/auth/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password
        })
      );

      return Token.fromJson(
        this.formatResponse(response)
      );
  }



  Future<Token> loginByPhone(String phone, String password) async {

        final response = await http.post(
          Uri.parse( this.API_URL + "/auth/login/phone"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'phone': phone,
            'password': password
        })
      );

      return Token.fromJson(
        this.formatResponse(response)
      );
  }



  Future<Token> getToken(String email, String password, String device_name) async {

        final response = await http.post(
          Uri.parse( this.API_URL + "/auth/token"),
          headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
          body: jsonEncode(<String, String>{
            'device_name': device_name,
            'email': email,
            'password': password,
        })
      );

      return Token.fromJson(
        this.formatResponse(response)
      );
  }



   


}