
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hadoota/views/profile.dart';
import 'package:hadoota/views/record.dart';
import 'package:hadoota/views/search.dart';
import 'package:hadoota/views/timeline.dart';





class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody:true,
      backgroundColor:  const Color(0xff251333),
      body:shift(),
      bottomNavigationBar:BottomNavigationBar(
        elevation: 0,
        backgroundColor:const Color(0x06aaaaff),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedIconTheme:const IconThemeData(
          color: Color(0xff787290)
        ),
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap:(index)=> navigate(index),
        iconSize: 25,
        items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidUser),label: "صفحتك"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.microphone),label: "تسجيل"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.magnifyingGlass),label: "بحث"),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house,),label: "الرئيسية"),

        ],),
    );

  }
              Widget shift(){
              switch(_currentIndex){
                case 3:{
                  return const TimeLine();
                }

                case 1:{
                  return const RecordPage();
                }

                case 2:{
                  return const Search();
                }

                case 0 :{
                  return const MyProfile();
                }

                default:{
                  return const TimeLine();
                }

              }
  }

  var _currentIndex=3;
  void navigate(int index){
    setState(() {
      _currentIndex=index;
    });
  }
}