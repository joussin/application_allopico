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
import 'storage.dart';

import 'package:localstorage/localstorage.dart';


class RestClient {

  String API_URL = "http://192.168.0.19:5555/api";



// todo: remplacer ces datas par le storage : User & Token dans le storage
  String device_name = "device_name"; // todo: get phone infos/userAgent
  String email = "admin@admin.com";
  String password = "password";
  String phone = "+33620774530";

  
  void storeLoggedUser(User user)
  {
       Storage().store("user", user);
  }

  
  User getStoredLoggedUser()
  {
       return Storage().get("user");
  }


  
  void storeLoggedUserToken(Token token)
  {
       Storage().store("token", token);
  }

  
  Token getStoredLoggedUserToken()
  {
       return Storage().get("token");
  }

 

  Map<String, dynamic> formatResponse(http.Response response, {List<int> statusCodesExpected = const [200, 201]})
  {
    this.apiCallLog(response);

    if (statusCodesExpected.contains(response.statusCode))
      {
        return jsonDecode(response.body);
      } else {
        throw Exception('Error code response : != ' + response.statusCode.toString());
      }
  }


  void apiCallLog(http.Response response)
  {
    print('Api call response');
    print(response.request);
    print(response.body);
  }





}