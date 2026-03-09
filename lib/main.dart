import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mechine_text/Authentication/user_provider.dart';
import 'package:mechine_text/firebase_options.dart';
import 'package:mechine_text/screens/User_register.dart';
import 'package:provider/provider.dart';

// ...



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp()
);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home:UserRegister()
      ),
    );
  }
}

