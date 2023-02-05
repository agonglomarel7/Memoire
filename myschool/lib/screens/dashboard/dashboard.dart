import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myschool/screens/dashboard/widgets/parent_data.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

import '../evenements/evenements.dart';
import '../fee_screen/fee_screen.dart';
import '../my_profile/my_profile.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  TextEditingController _identifiantStudentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //we will divide the screen into two parts
          //fixed height for first half
          Container(
            width: 100.w,
            height: 40.h,
            padding: EdgeInsets.all(kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ParentName(
                          parentName: 'John Doe',
                        ),

                      ],
                    ),
                    kHalfSizedBox,
                    ParentPicture(
                        picAddress: 'assets/images/student_profile.jpeg',
                        onPress: () {
                          // go to profile detail screen here
                          Navigator.pushNamed(
                              context, MyProfileScreen.routeName);
                        }),
                  ],
                ),
                sizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ParentDataCard(
                      onPress: () {
                        //go to attendance screen
                      },
                      title: 'Attendance',
                      value: '90.02%',
                    ),
                    ParentDataCard(
                      onPress: () {
                        //go to fee due screen
                        Navigator.pushNamed(context, FeeScreen.routeName);
                      },
                      title: 'Scolarité ',
                      value: '600\$',
                    ),
                  ],
                )
              ],
            ),
          ),

          //other will use all the remaining height of screen
          Expanded(
            child: Container(
              width: 100.w,
              decoration: BoxDecoration(
                color: kOtherColor,
                borderRadius: kTopBorderRadius,
              ),
              child: SingleChildScrollView(
                //for padding
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        HomeCard(
                          onPress: () {
                            //go to assignment screen here
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EvenementScreen()));
                          },
                          icon: 'assets/icons/event.svg',
                          title: 'Evènements',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/woman-outline.svg',
                          title: 'Mes enfants',
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/ask.svg',
                          title: 'Scolarité',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/ask.svg',
                          title: 'Suggestions',
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/lock.svg',
                          title: 'Change\nPassword',
                        ),
                        HomeCard(
                          onPress: () {},
                          icon: 'assets/icons/logout.svg',
                          title: 'Se deconnecter',
                        ),
                      ],
                    ),
                  ],
                ),

              ),
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialogContext(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _displayDialogContext(BuildContext context){
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Identifiant"),
        content: TextField(
          controller: _identifiantStudentController,
          decoration: InputDecoration(
            hintText: "Veuiller saisir l'\identifiant de votre enfant "
          ),
        ),
        actions: <Widget> [
          FloatingActionButton(onPressed: (){
          },
            child: Text("Ok"),
          )
        ],
      );
    });
  }
}

class HomeCard extends StatelessWidget {
  const HomeCard(
      {Key? key,
        required this.onPress,
        required this.icon,
        required this.title})
      : super(key: key);
  final VoidCallback onPress;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        width: 40.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(kDefaultPadding / 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              width: SizerUtil.deviceType == DeviceType.tablet ? 30.sp : 40.sp,
              color: kOtherColor,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}

