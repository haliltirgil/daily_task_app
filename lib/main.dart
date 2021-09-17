import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/screens/login_screen.dart';

import 'helper/theme_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer(builder: (context, ThemeProvider themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
          home: AddTaskScreen(),
        );
      }),
    );
  }
}


/* import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/helper/theme.dart';
import 'package:task_app/screens/add_task_screen.dart';
import 'package:task_app/screens/login_screen.dart';
import 'package:task_app/screens/show_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
} 
 */
