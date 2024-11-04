import 'package:flutter/material.dart';
import 'package:store/screen/home_screen.dart';

main()
{
  runApp(const MyApp() ) ;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Store App ",
      home: HomeScreen()  ,
    );
  }
}
