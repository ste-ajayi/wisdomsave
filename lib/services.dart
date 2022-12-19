import 'dart:convert';
import 'dart:developer';
import 'package:wisdomsave/models/dashboardmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<dynamic> attemptlogin(String email, String password) async {
  var res = await http.post(Uri.parse('http://localhost:1200/auth/login'),
      body: {"email": email, "password": password});

  if (res.statusCode == 200) {
    String token = res.body;
    return token;
  } else {
    return null;
  }
}

void sendmoney(String receiver, dynamic amount) async{
    final prefs = await SharedPreferences.getInstance();
  dynamic _token = await prefs.getString('token');

  final response = await http.post(Uri.parse('http://localhost:1200/dashboard'),
      body: {"receiver": receiver, "amount": amount},
      headers: {'x-access-token': '${await prefs.getString('token')}'});
}

Future<Dashboardmodel> fetchDashboardmodel() async {
  final prefs = await SharedPreferences.getInstance();
  dynamic _token = await prefs.getString('token');

  final response = await http.get(Uri.parse('http://localhost:1200/dashboard'),
      headers: {'x-access-token': '${await prefs.getString('token')}'});

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Dashboardmodel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}



// await http.get(url, headers: {'x-access-token': '${getToken()}'});

// headers: {'x-access-token': '${getToken()}'}