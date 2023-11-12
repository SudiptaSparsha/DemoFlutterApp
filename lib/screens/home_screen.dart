import 'package:flutter/material.dart';
import 'package:quotesapp/models/user.dart';
import 'package:quotesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var url = Uri.parse(
                  "https://random-data-api.com/api/v2/users?size=10&is_xml=true");
              var response = await http.get(url);
              // print('Response status : ${response.statusCode}');
              // print('Response body : ${response.body}');

              var data = jsonDecode(response.body);

              List<User> userData =
                  (data as List).map((user) => User.fromJson(user)).toList();

              List<String> users = [];

              for (User user in userData) {
                String firstName = user.firstName;
                String lastName = user.lastName;
                String fullName = '$firstName $lastName';
                users.add(fullName);
              }
              print(users);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen(
                        users: users,
                      )));
            },
            child: Text("Go to next page!"),
          ),
        ),
      ),
    );
  }
}
