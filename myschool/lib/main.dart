
import 'package:flutter/material.dart';
import 'package:myschool/controllers/auth.dart';
import 'package:myschool/routes.dart';
import 'package:myschool/screens/splash_screen/splash_screen.dart';
import 'package:myschool/theme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
/*

 */
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //it requires 3 parameters
    //context, orientation, device
    //it always requires, see plugin documentation
    return Sizer(builder: (context, orientation, device){
      return
        /*MultiProvider(providers: [
        ChangeNotifierProvider.value(value: AuthController(),
        ),

      ])*/

        MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My School',
        theme: CustomTheme().baseTheme,
        //initial route is splash screen
        //mean first screen
        initialRoute: SplashScreen.routeName,
        //define the routes file here in order to access the routes any where all over the app
        routes: routes,
      );
    });
  }
}
