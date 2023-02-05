import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myschool/screens/login_screen/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../constants.dart';
import '../../controllers/auth.dart';
import '../../widgets/ButtonWidget.dart';
import '../components/custom_buttons.dart';
import '../home_screen/home_screen.dart';

late bool _passwordVisible;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static String RouteName ='SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
//validate our form now
final _formKey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool _secureText = true;
String groupValue = 'M';

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
            height: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Bienvenue chers Parents',
                        style: Theme.of(context).textTheme.subtitle1),
                    Text('S\'inscrire pour continuer',
                        style: Theme.of(context).textTheme.subtitle2),
                    sizedBox,
                  ],
                ),
                Image.asset(
                  'assets/images/splash.png',
                  height: 15.h,
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
                        SizedBox(height: 5,),
                        Text("Inscription",style: TextStyle(color: Colors.black),),
                        sizedBox,
                        buildNameField(),

                        buildPrenomField(),

                        buildEmailField(),

                        buildPhoneField(),

                        buildPasswordField(),

                        buildConfirmPasswordField(),

                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Radio(value: 'M', groupValue: groupValue, onChanged: (value){
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                            Text("Masculin",style: TextStyle(fontSize: 15,color: Colors.black),),
                            Radio(value: 'F', groupValue: groupValue, onChanged: (value){
                              setState(() {
                                groupValue = value!;
                              });
                            }),
                            Text("Féminin",style: TextStyle(fontSize: 15,color: Colors.black),)
                          ],
                        ),
                        SizedBox(height: 25),
                        sizedBox,
                        DefaultButton(
                          onPress: () async {
                            if (_formKey.currentState!.validate()) {
                              print(emailController);
                              print(passwordController);
                            }
                          },
                          title: 'Inscription',
                          iconData: Icons.arrow_forward_outlined,
                        ),
                        sizedBox,
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(text: TextSpan(
                              text:"Already have an account ? ",style: TextStyle(color: Colors.grey, fontSize: 20),)
                            ),
                            GestureDetector(child: Text("Login",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.black),),
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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

TextFormField buildNameField() {
  return TextFormField(
    textAlign: TextAlign.start,
    keyboardType: TextInputType.name,
    style: kInputTextStyle,
    decoration: InputDecoration(
      labelText: 'Nom',
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    validator: (value) {
      //for validation
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
        return null;
    },
  );
}

TextFormField buildPrenomField() {
  return TextFormField(
    textAlign: TextAlign.start,
    keyboardType: TextInputType.name,
    style: kInputTextStyle,
    decoration: InputDecoration(
      labelText: 'Prénom',
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    validator: (value) {
      //for validation
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
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

TextFormField buildPhoneField() {
  return TextFormField(
    textAlign: TextAlign.start,
    keyboardType: TextInputType.number,
    style: kInputTextStyle,
    decoration: InputDecoration(
      labelText: 'Téléphone',
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
    validator: (value) {
      //for validation
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
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
              : Icons.visibility,
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

TextFormField buildConfirmPasswordField() {
  return TextFormField(
    obscureText: _passwordVisible,
    textAlign: TextAlign.start,
    keyboardType: TextInputType.visiblePassword,
    style: kInputTextStyle,
    decoration: InputDecoration(
      labelText: 'ConfirmPassword',
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
              : Icons.visibility,
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

