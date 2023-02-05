import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class AuthController with ChangeNotifier {
  static String url = "https://myschool.herokuapp.com/api";
  String _token = "";
  User? _user;

  User get user {
    return _user!;
  }

  String get token {
    return _token;
  }

  Future<Map> register(
      {required String lastname,
      required String firstname,
      required String sexe,
      required String contact,
      required String email,
      required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$url/register'),
        // headers: {
        //   'Content-Type': 'application/json',
        //   'Accept': 'application/json',
        // },
        // encoding: Encoding.getByName("utf-8"),
        body: {
          "email": email,
          "tel": contact,
          "sexe": sexe,
          "nom": lastname,
          "prenoms": firstname,
          "mot_de_passe": password,
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      if(responseData['success']){
        _user = User(
            id: responseData['response'][0]['id'],
            statut: responseData['response'][0]['statut'],
            prenoms: responseData['response'][0]['prenoms'],
            nom: responseData['response'][0]['nom'],
            sexe: responseData['response'][0]['sexe'],
            email: responseData['response'][0]['email'],
            tel: responseData['response'][0]['tel'],
            mot_de_passe: responseData['response'][0]['mot_de_passe'],
            created_at: responseData['response'][0]['created_at']);
            notifyListeners();
        return {
          "success": true,
          "message": "Compte créé"
        };
      }else{
        return {
          "success": false,
          "message": responseData['message']
        };
      }
      
    } catch (error) {
      print("*** error $error");
      return {
          "success": false,
          "message": "Probleme de creation"
        };
    }
  }

  Future<bool> login({required String email, required String password}) async { 
    try {
      print("ça y est");
      final response = await http.post(
        Uri.parse('$url/login'),
      //   headers: {
      // "Access-Control-Allow-Origin": "*",
      // 'Content-Type': 'application/json',
      // 'Accept': '*/*'
      //   },
        // encoding: Encoding.getByName("utf-8"),
        body: {
          "email": email,
          "mot_de_passe": password,
        },
      );
      final responseData = json.decode(response.body);
      print("===login== $responseData");
      if (responseData['token'] != null) {
        _token = responseData['token'];
        _user = User(
            id: responseData['user']['id'],
            statut: responseData['user']['statut'],
            prenoms: responseData['user']['prenoms'],
            nom: responseData['user']['nom'],
            sexe: responseData['user']['sexe'],
            email: responseData['user']['email'],
            tel: responseData['user']['tel'],
            mot_de_passe: responseData['user']['mot_de_passe'],
            created_at: responseData['user']['created_at']);
            print('token is ==== $token');
            print("user email ====== ${user.email}");
            notifyListeners();
            return true;
      }else{
        return false;
      }
      
    } catch (error) {
      print("*** error $error");
    return false;
    }
  }

  Future<Map> get_all_users() async {
    try {
      final response = await http.get(
        Uri.parse('$url/api/users'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      // Map data = {
      //   "error": responseData['error'],
      //   "message": responseData['message']
      // };
      return responseData;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> change_User_Status({required String id,
      required String lastname,
      required String firstname,
      required String sexe,
      required int contact,
      required String email,
      required String password}) async {
    try {
      final response = await http.put(
        Uri.parse('$url/users/$id/change-status'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        // body: json.encode({
        //   "email": email,
        //   "password": password,
        // }),
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> delete_Users({
    required String id,
  }) async {
    try {
      final response = await http.delete(
        Uri.parse('$url/users/$id/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> edit_Users(
      {required String id,
      required String lastname,
      required String firstname,
      required String sexe,
      required int contact,
      required String email,
      required String password}) async {
    try {
      final response = await http.put(
        Uri.parse('$url/users/$id/edit'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        encoding: Encoding.getByName("utf-8"),
        body: json.encode({
          "email": email,
          "contact": contact,
          "sexe": sexe,
          "lastname": lastname,
          "firstname": firstname,
          "password": password,
        }),
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> get_A_User({required String id}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/users/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }

  Future<Map> get_Me({required String token}) async {
    try {
      final response = await http.get(
        Uri.parse('$url/users/me'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Bearer': token,
        },
      );
      final responseData = json.decode(response.body);
      print("===== $responseData");
      Map data = {
        "error": responseData['error'],
        "message": responseData['message']
      };
      return data;
    } catch (error) {
      print("*** error $error");
      rethrow;
    }
  }
}
