
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);
  static String routeName = 'NoteScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Voir les notes "),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 100.w,
            height: 5.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: kDefaultPadding / 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 35.w, right: 35.w),
              decoration: BoxDecoration(
                color: kOtherColor,
                //reusable radius,
                borderRadius: kTopBorderRadius,
              ),
              child: Form(
                child: SingleChildScrollView(
                    child: Column(
                      children: [

                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
