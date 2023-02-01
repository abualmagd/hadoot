import 'package:flutter/material.dart';
import 'package:hadoota/views/others_profile.dart';

class UserCard extends StatefulWidget {
  final BuildContext context;
  final int index ;
  const UserCard({Key? key, required this.context, required this.index}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return const OthersProfile();
        }));
      },
      child: SizedBox(
        height: 300,
        width: 150,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: 300,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Image.asset("assets/images/holder.png",fit: BoxFit.cover,),
            ),
            Positioned(
              bottom:9,
              right:10,
            width:150,
              child: Container(
                height:90,
                decoration: BoxDecoration(
                  //color:const  Color(0x70aaaaff),
                  gradient: const LinearGradient(
                    colors: [ Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child:const Align(
                    alignment: Alignment.bottomCenter,
                    child:  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(" اسماعيل ابوالمجد",style:TextStyle(color: Colors.white,fontSize:17,fontWeight: FontWeight.w500)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
