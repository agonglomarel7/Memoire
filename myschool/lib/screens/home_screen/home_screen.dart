
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth.dart';
import '../../models/user.dart';


class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<AuthController>(context, listen: false).user;
    return Scaffold(
      body: Text(
        "${user.prenoms} ${user.nom}",
        style: const TextStyle(
          color: Color.fromARGB(255, 194, 194, 206),
          fontFamily: "Poppins",
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

}
