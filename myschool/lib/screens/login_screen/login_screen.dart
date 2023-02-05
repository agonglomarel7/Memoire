
import 'package:flutter/material.dart';
import 'package:myschool/screens/dashboard/dashboard.dart';
import 'package:myschool/screens/signUp_screen/signUp_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../controllers/auth.dart';
import '../../widgets/loadingWidget.dart';
import '../components/custom_buttons.dart';
import '../home_screen/home_screen.dart';


late bool _passwordVisible;

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //validate our form now
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      //when user taps anywhere on the screen, keyboard hides
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: 100.w,
              height: 35.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bienvenue chers Parents',
                          style: Theme.of(context).textTheme.subtitle1),
                      Text('Se connecter pour continuer',
                          style: Theme.of(context).textTheme.subtitle2),
                      sizedBox,
                    ],
                  ),
                  Image.asset(
                    'assets/images/splash.png',
                    height: 20.h,
                    width: 30.w,
                  ),
                  SizedBox(
                    height: kDefaultPadding / 2,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  color: kOtherColor,
                  //reusable radius,
                  borderRadius: kTopBorderRadius,
                ),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        Text("Connexion",style: TextStyle(color: Colors.black),),
                        sizedBox,
                        buildEmailField(),
                        sizedBox,
                        buildPasswordField(),
                        sizedBox,
                            SizedBox(height: 30,),
                            DefaultButton(
                              onPress: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                              },
                              title: 'Connexion',
                              iconData: Icons.arrow_forward_outlined,
                            ),
                            sizedBox,
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                'Mot de passe oublié ?',
                                textAlign: TextAlign.end,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 40,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RichText(text: TextSpan(
                                  text:"Don\'t have an account ? ",style: TextStyle(color: Colors.grey, fontSize: 20),)
                                ),
                                GestureDetector(child: Text("Create ?",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                    })
                              ],),
                          ],)
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.emailAddress,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Mobile Number/Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        //for validation
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
          //if it does not matches the pattern, like
          //it not contains @
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      obscureText: _passwordVisible,
      textAlign: TextAlign.start,
      keyboardType: TextInputType.visiblePassword,
      style: kInputTextStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
          icon: Icon(
            _passwordVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_off_outlined,
          ),
          iconSize: kDefaultPadding,
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
    );
  }


}
