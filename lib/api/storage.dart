import 'package:localstorage/localstorage.dart';

import 'package:flutter/material.dart';

 import 'dart:async';
import 'dart:convert';
import 'dart:io';


class Storage {

  String KEY = "localstorage_app";

  final LocalStorage storage = new LocalStorage("localstorage_app");


/*  const Storage({
    required this.storage
  }); */




  void store(String key, value)
  {
    this.storage.setItem(key, value);
  }


  dynamic get(String key)
  {
    return this.storage.getItem(key);
  }

  void remove(String key) 
  {
    this.storage.deleteItem(key);
  }

}