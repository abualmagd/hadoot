

import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hadoota/utility/clap.dart';

class CardView extends StatefulWidget {
  final int index;
  final BuildContext context;
  final Color backgroundColor;
  const CardView({Key? key, required this.index, required this.context, required this.backgroundColor}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  @override
  void initState() {
    _controller=AnimationController(vsync: this,duration:const Duration(microseconds:100));
    animation=Tween<double>(begin: 0.0,end: 1.0).animate(_controller);
    super.initState();
  }

  var claps=100;
 void increment(){
    setState(() {
      claps++;
    });
  }

  var arabicNumbers=ArabicNumbers();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                        child: Text(arabicNumbers.convert(claps),style:Theme.of(context).textTheme.headline6,),
                      ),
                    ClapButton(increase: increment),
                    ],
                  ),
                ),

                Padding(
                  padding:const EdgeInsets.only(right:4,left:4,top:8),
                  child: Text(arabicNumbers.convert('17-2'),style:Theme.of(context).textTheme.headline6,),
                ),
                Row(
                  children: [

                    Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child:InkWell(onTap: (){
                            var position=(context.findRenderObject() as RenderBox).localToGlobal(Offset.zero);
                        showMenu(context: context, position:  RelativeRect.fromLTRB(position.dx+70, position.dy+130, 1000, 0),
                            color:const Color(0xEDAEAEFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)
                            ),
                            items: [
                         const PopupMenuItem( value: "queue",child: Text("أضف للقائمة")),
                              const PopupMenuItem( value: "report",child: Text("   ريبورت")),

                            ]).then((value) {
                          if(value!=null){

                            if (kDebugMode) {
                              print(value);
                            }
                          }
                        });

                      },
                          customBorder: const CircleBorder(),
                          splashColor: const Color(0x44aaaaff),
                          child:Container(
                              height: 25,
                              width: 25,
                              margin:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(50)
                              ),
                              child:const Center(child: Icon(FontAwesomeIcons.ellipsisVertical,size:20,),))
                      ),
                    ),

                    Padding(
                      padding:const EdgeInsets.only(right:1,top:8),
                      child:Text('${arabicNumbers.convert(17)} دقيقة ',style:Theme.of(context).textTheme.headline6,),

                    ),
                    Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child:InkWell(onTap: (){
                          if(_controller.isCompleted){
                            _controller.reverse();
                          }else{
                            _controller.forward();
                          }
                        },
                          customBorder: const CircleBorder(),
                            splashColor: const Color(0x44aaaaff),
                          child:Container(
                            height: 25,
                            width: 25,
                            margin:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:BorderRadius.circular(50)
                            ),
                            child: Center(child: AnimatedIcon(icon: AnimatedIcons.play_pause,size:20, progress:animation,color: Colors.black,)))
                        ),
                      ),

                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}