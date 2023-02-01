import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadoota/views/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:Colors.transparent,
        systemNavigationBarColor:Color(0xff251333),
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hadoota',
        theme: ThemeData(
          backgroundColor: const Color(0xff251333),
          textTheme:  TextTheme(
            headline1: const TextStyle(color: Colors.white,fontSize:26,fontWeight: FontWeight.w500),
            headline2: const TextStyle(color: Color(0xffadadc9),fontSize:15,fontWeight: FontWeight.w500),
            headline3: GoogleFonts.notoSansArabic().copyWith(color: Colors.white,fontSize:15,fontWeight: FontWeight.w400),
            headline4: const TextStyle(color: Colors.white70,fontSize:15,fontWeight: FontWeight.w300),
            headline5: const TextStyle(color: Color(0xff787276),fontSize:15,fontWeight: FontWeight.w500),
            headline6:const TextStyle(color: Colors.white70,fontSize:12,fontWeight: FontWeight.w200),
            bodyText1:const TextStyle(color: Colors.white70,fontSize:12,fontWeight: FontWeight.w200),
            bodyText2:const TextStyle(color: Colors.white70,fontSize:16,fontWeight: FontWeight.w400),

          ),
          elevatedButtonTheme:  ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.red,
                backgroundColor:const Color(0xC2B9B9FF),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)
                ),
              )
          ),

          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        home:const Directionality(
            textDirection: TextDirection.rtl,
            child:MyHomePage())
    );
  }
}







