// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:wisdomsave/models/test.dart';


// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {

//   Future<Testdata>  fetchTestdata() async {
//     final response = await http.get(Uri.parse('http:localhost:1200/test'),);

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.
//       return Testdata.fromJson(jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load Dashboarddata');
//     }
//   }

//    late Future<Testdata> futureTestdata;

//   @override
//   void initState() {
//     super.initState();
//     print('ready');
//     futureTestdata = fetchTestdata();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<Testdata>(
//   future: futureTestdata,
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return Text(snapshot.data!.test);
//     } else if (snapshot.hasError) {
//       return Text('${snapshot.error}');
//     }

//     // By default, show a loading spinner.
//     return const CircularProgressIndicator();
//   },
// )
//     );

//   }
// }
