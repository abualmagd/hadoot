
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class EventCard extends StatefulWidget {
  final int index;
  final BuildContext context;
  final Color backgroundColor;
  const EventCard({Key? key, required this.index, required this.context, required this.backgroundColor}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration:const Duration(microseconds:100));
    animation=Tween<double>(begin: 0.0,end: 1.0).animate(_controller);
    super.initState();
  }

  var claps=100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tapped ');
      },
      child: Padding(
        padding: const EdgeInsets.only(left:6.0),
        child: Container(
          margin:const EdgeInsets.only(left:10.0,right:7.0),
          decoration: BoxDecoration(
            color:widget.backgroundColor,
            borderRadius: BorderRadius.circular(7),
          ),
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin:const EdgeInsets.only(right:8),
                    width:90 ,
                    child: Column(
                      children: [
                        Text("عنوان التسجيل والحدوتة " ,style: Theme.of(context).textTheme.headline2,),
                        Text("احكى ياشهرازاد يا ديدا ",style: Theme.of(context).textTheme.headline4),
                      ],
                    ),
                  ),
                  Container(
                    margin:const EdgeInsets.all(10),
                    clipBehavior: Clip.hardEdge,
                    height: 100,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(7)
                    ),
                    child: Image.asset('assets/images/holder.png',fit: BoxFit.cover,),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:12),
                    child: Row(
                      children:[
                        Padding(
                          padding:const EdgeInsets.only(right:4,left:4,top:8),
                          child: Text(claps.toString(),style:Theme.of(context).textTheme.headline6,),
                        ),
                          const  SizedBox(
                            height: 35,
                            width: 30,
                            child: Icon(FontAwesomeIcons.handsClapping,color:Colors.white,size:20,)),
                                              ],
                                            ),
                                          ),

                  Padding(
                    padding:const EdgeInsets.only(right:4,left:4,top:8),
                    child: Text('17-2',style:Theme.of(context).textTheme.headline6,),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:const EdgeInsets.only(right:4,top:8),
                        child: Text('33',style:Theme.of(context).textTheme.headline6,),
                      ),
                   const Padding(
                     padding: EdgeInsets.only(right: 4,left:12,top: 8,bottom: 8),
                     child: Icon(FontAwesomeIcons.microphoneLines,color: Colors.white,size: 20,),
                   ),

                    ],
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}