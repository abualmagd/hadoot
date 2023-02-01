
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utility/clips.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

var arabicNumbers=ArabicNumbers();
class _MyProfileState extends State<MyProfile> {

  @override
  Widget build(BuildContext context) {
    TextStyle? styled= Theme.of(context).textTheme.headline3;
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        children: [
          ClipPath(
            clipper: RightPhotoClipper(),
            child: Container(
              width: double.infinity,
              height:250,
              color: Colors.amberAccent,
              child: Image.asset("assets/images/holder.png",fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" ديدا على  " ,style: Theme.of(context).textTheme.headline1),
              ),//user name
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child:  ElevatedButton(
                      onPressed: (){
                      },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.red,
                      minimumSize: const Size(70, 30),
                      backgroundColor:const Color(0xC2B9B9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7)
                      ),
                    ),
                      child:const  Text(" تعديل ",style: TextStyle(color: Colors.white)),
                    ),
                  ),
              ),

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(FontAwesomeIcons.solidEnvelope),
                    const SizedBox(width: 10,),
                    Text(" khadigaali125@gmail.com ",style: styled,),

                  ]
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.solidCalendarDays),
                        const SizedBox(width: 10,),
                        Text(arabicNumbers.convert("23-10-2023"),style: styled,),

                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.globe),
                        const SizedBox(width: 10,),
                        Text(" العربية",style: styled,),

                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                      const  Icon(FontAwesomeIcons.cakeCandles),
                        const  SizedBox(width: 10,),
                        Text(arabicNumbers.convert(13),style: styled,),

                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.gear),
                        const SizedBox(width: 10,),
                        Text(" الأعدادات",style: styled,),

                      ]
                  ),
                ),





              ],
            ),
          )
        ],
      ),
    );
  }
}


