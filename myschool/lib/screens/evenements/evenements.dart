import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class EvenementScreen extends StatelessWidget {
  const EvenementScreen({Key? key}) : super(key: key);
  static String routeName = 'EvenementScreen';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste of events"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: kOtherColor,
                  borderRadius: kTopBorderRadius,
                ),
                child: ListView(
                  children: [
                    Container(

                    )

                  ],
                )
            ),
          ),
        ],
      ),

    );
  }
}
