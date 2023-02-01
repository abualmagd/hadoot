
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClapButton extends StatefulWidget {

  final VoidCallback increase;
  const ClapButton({Key? key, required this.increase}) : super(key: key);

  @override
  State<ClapButton> createState() => _ClapButtonState();
}

class _ClapButtonState extends State<ClapButton> with SingleTickerProviderStateMixin{

  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _animationSize;
  late List<ColorTween> colors;
  @override
  void initState() {
    _colorController=AnimationController(vsync: this,duration: const Duration(milliseconds: 400));
    _animationSize=Tween<double>(begin: 20,end: 25).animate(_colorController);
    _colorAnimation=ColorTween(begin:Colors.white,end:Colors.pink).animate(_colorController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimatedBuilder(
      animation: _colorAnimation,
      builder: (BuildContext context, Widget? child) {
        return InkWell(
            onTap: (){
             widget.increase();
             _colorController.forward().whenComplete(() => Future.delayed(const Duration(milliseconds:600),(){
               _colorController.reverse();
             }));
              
            },
            child: SizedBox(
                height: 35,
                width: 30,
                child: Icon(FontAwesomeIcons.handsClapping,color:_colorAnimation.value,size:_animationSize.value,)));
      },
    );//clap icon with pressing
  }
  @override
  void dispose() {
_colorController.dispose();
super.dispose();
  }
}



