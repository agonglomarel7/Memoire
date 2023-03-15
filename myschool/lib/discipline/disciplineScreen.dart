
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myschool/controllers/punitionController.dart';
import 'package:sizer/sizer.dart';

import '../constants.dart';

class DisciplineScreen extends StatelessWidget {
  const DisciplineScreen({Key? key}) : super(key: key);

  static String routeName = 'DisciplineScreen';

  @override
  Widget build(BuildContext context) {
    final PunitionController punitionController =
    Get.put(PunitionController());
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Discipline de votre enfant"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: FutureBuilder(
                future: punitionController.getStudentPunition(
                  id: "1",
                ),
                initialData: punitionController.punitions,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.error != null) {
                      return const Center(
                        child: Text(
                          'Erreur Erreur',
                          style: TextStyle(color: kPrimaryColor),
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: punitionController.punitions.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(punitionController.punitions[index].motif!,softWrap: true,
                                      style: const TextStyle(
                                        color: kPrimaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500
                                      ),),
                                      Text(
                                        punitionController.punitions[index]
                                            .punition!, softWrap: true,
                                        style: const TextStyle(
                                            color: kPrimaryColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],),
                                )
                            );
                          });
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}