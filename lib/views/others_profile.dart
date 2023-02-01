


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hadoota/views/profile.dart';

import '../utility/clips.dart';



class OthersProfile extends StatefulWidget {
  const OthersProfile({Key? key}) : super(key: key);

  @override
  State<OthersProfile> createState() => _OthersProfileState();
}

class _OthersProfileState extends State<OthersProfile> {

   int pressedIndex=5000;

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: MediaQuery.removePadding(
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
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("ismail abo" ,style: Theme.of(context).textTheme.headline1),
                        )),//user name
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child:  ElevatedButton(
                          onPressed: (){
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.red,
                            minimumSize: const Size(100, 35),
                            backgroundColor: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17)
                            ),
                          ),
                          child:  Text("تابع",style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                   itemBuilder: (BuildContext context,int index){
                      return InkWell(
                          onTap: (){
                            setState(() {
                              pressedIndex=index;
                            });
                          },
                          child:  PlayerCard(title: "حدوتة الشاطر حسن ", time: 12,index: index, pressedIndex: pressedIndex,));
                    },itemCount:15,),



                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





class PlayerCard extends StatefulWidget {
  final String title;
  final int time;
  final int index;
  final int? pressedIndex;
  const PlayerCard({Key? key, required this.title, required this.time, required this.index, required this.pressedIndex}) : super(key: key);

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {

  double currentValue=3;

  @override
  Widget build(BuildContext context) {
    bool pressed=widget.pressedIndex==widget.index?true:false;
    TextStyle? styled= Theme.of(context).textTheme.headline3;
    return Container(
      color:pressed?Colors.orange.shade400:Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,style: styled,),
                  Text('${arabicNumbers.convert(widget.time)} دقيقة ',style:Theme.of(context).textTheme.headline6,),
                  pressed?const Icon(FontAwesomeIcons.pause) :const Icon(FontAwesomeIcons.play),]
            ),
          pressed?Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: SizedBox(
              height: 5,
              child: Slider(value:currentValue,
                  activeColor: Colors.deepPurple,
                  max: 100,
                  min: 1
                  ,onChanged:(double value){
                setState(() {
                  currentValue=value;
                });
              }),
            ),
          ):const SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}
