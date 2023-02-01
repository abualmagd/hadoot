

import 'package:flutter/material.dart';

import '../utility/card.dart';
import '../utility/event_card.dart';
import '../utility/user_card.dart';


class TimeLine extends StatefulWidget {
  const TimeLine({Key? key}) : super(key: key);

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  const Color(0xff251333),
        title:   Text("حدوتة",style:Theme.of(context).textTheme.headline1),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:14),
            child: SizedBox(
              height: 168,
              child: ListView.builder(itemBuilder:(BuildContext context,int index){
                return CardView(index: index, context: context, backgroundColor: const Color(0xff44236E),);
              },itemCount:5,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Container(
              margin:const  EdgeInsets.only(right:26,top:8,bottom: 4),
              color:const Color(0xff251330),
              child: Text("ترند",style:Theme.of(context).textTheme.headline5,)),
          Padding(
            padding: const EdgeInsets.only(right:14),
            child: SizedBox(
              height: 168,
              child: ListView.builder(itemBuilder:(BuildContext context,int index){
                return CardView(index: index, context: context, backgroundColor: const Color(0xff44236E),);
              },itemCount:5,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Container(
              margin:const  EdgeInsets.only(right:26,top:8,bottom: 4),
              color:const Color(0xff251330),
              child: Text("فاعلية",style:Theme.of(context).textTheme.headline5,)),
          Padding(
            padding: const EdgeInsets.only(right:14),
            child: SizedBox(
              height: 160,
              child: ListView.builder(itemBuilder:(BuildContext context,int index){
                return EventCard(index: index, context: context, backgroundColor: const Color(0xff44235E),);
              },itemCount:5,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
              padding: const EdgeInsets.only(right:14),
              child: GridView.builder(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent:200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return UserCard(context: context, index: index);
                },



              )
          ),

        ],
      ),
    );
  }
}
