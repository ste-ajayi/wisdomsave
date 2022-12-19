import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wisdomsave/models/dashboardmodel.dart';
import 'package:wisdomsave/services.dart';
import 'package:wisdomsave/utilities/general_utils.dart';
import 'package:wisdomsave/utilities/text_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  PanelController _pc = new PanelController();

  late Future<Dashboardmodel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchDashboardmodel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton:
        body: FutureBuilder<Dashboardmodel>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Stack(children: [
            SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data!.username,
                        style: t40w7,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Spend wise, Avoid SAPA',
                          style: t17w6,
                          children: [
                            TextSpan(text: ' '),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [Color(0xff584BB9), Color(0xff9BB7EB)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 30),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    Color.fromARGB(123, 217, 217, 217),
                                child: Icon(
                                  Icons.money_outlined,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Balance',
                                    style: t24w6.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    '\$${snapshot.data!.balance}',
                                    style: t40w7.copyWith(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              right: 40,
              child: FloatingActionButton(
                onPressed: () {
                  _pc.open();
                },
                child: Text("TF", style: t17w6),
              ),
            ),
            SlidingUpPanel(
              minHeight: 0,
              controller: _pc,
              backdropEnabled: true,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: const <BoxShadow>[
                BoxShadow(blurRadius: 8.0, color: Color.fromARGB(0, 0, 0, 0))
              ],
              panel: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send money',
                      style: t40w7,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Account number',
                          style: t17w6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: outInput.copyWith(
                            hintText: "paste aza",
                            filled: true,
                            fillColor: Color.fromARGB(188, 202, 199, 199),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: elBtn.copyWith(
                                backgroundColor:
                                    MaterialStateProperty.all(primarycolor)),
                            onPressed: () {
                              
                            },
                            child: Text(
                              ' Send',
                              style: t17w6,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              onPanelOpened: () {
                setState(() {});
              },
            )
          ]);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    ));
  }
}
