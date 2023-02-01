import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String searchTable="hadoota";
  List result=[];
  bool hideLast=false;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        margin:const EdgeInsets.only(left:20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const SizedBox(
              height: 30,
            ),
             Padding(
               padding: const EdgeInsets.only(left:8.0,top: 8),
               child: Text(" بحث ",style: Theme.of(context).textTheme.headline1,),
             ),
            TextField(
              textInputAction: TextInputAction.search,
              onSubmitted: (value){
                hideLast=true;
                Future.delayed(const Duration(seconds:3),(){
                  setState(() {
                    loading=true;
                  });
                });
                if (kDebugMode) {
                  print(value);
                }
              },
              decoration:  InputDecoration(
               prefixIcon:const Icon(FontAwesomeIcons.magnifyingGlass),

               suffixIcon: ButtonTheme(
                 alignedDropdown: true,
                 child: DropdownButton<String>(
                   value: searchTable,

                   style: const TextStyle(
                     fontSize:15,
                     color: Colors.blue,

                   ),
                   underline:const SizedBox.shrink(),
                   onChanged: (value){
                     setState(() {
                       searchTable=value!;
                     });
                   },
                   items: const [
                     DropdownMenuItem(
                         value: 'hadoota',
                         child:  Text('التدوينات')),
                     DropdownMenuItem(
                         value: 'users',
                         child:  Text('المدونين')),
                   ],
                 ),
               ),
                contentPadding:const EdgeInsets.all(0),
                hintText: "بحث",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                focusedBorder:  OutlineInputBorder(
                  borderSide:  BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
              ),
              ),
            ),
          hideLast?   Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child:loading?ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return ResultCard(index: index);
                },
                itemCount: 20,
              ):const Center(child: CircularProgressIndicator(),),
            ),
          )


              :Expanded(
                child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      const Text("أخر بحث "),
                      ElevatedButton(onPressed:(){
                        //clear search list
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).backgroundColor
                          ),
                          child:const Text(' مسح الكل ')),
                    ],
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index){
                        return ResultCard(index: index);
                      },
                      itemCount: 20,
                      ),
                    ),
                  ),
                ],
            ),
              )
          ],
        ),
      ),
    );
  }

}


class ResultCard extends StatefulWidget {
  final int index;
  const ResultCard({Key? key, required this.index}) : super(key: key);

  @override
  State<ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<ResultCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin:const EdgeInsets.only(bottom:5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width:.5,color: Colors.grey)
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(" حدوتة مصرية "),
          Container(
            height: 45,
            width: 45,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7)
            ),
            child: Image.asset("assets/images/holder.png",fit: BoxFit.fill,),
          )
        ],
      ),
    );
  }
}
