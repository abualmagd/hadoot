import 'package:flutter/material.dart';

class Indicator extends StatefulWidget {
  final double height;
  final double width;
  final double value;
  final int duration;
  const Indicator({Key? key, required this.height, required this.width, required this.value, required this.duration}) : super(key: key);

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController=AnimationController(vsync: this ,duration: Duration(seconds:widget.duration));
    _animation=Tween<double>(begin:widget.value,end:widget.width-15).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child:  AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return GestureDetector(
              onTap: (){
                _animationController.forward();
              },
              child: Container(
                height: widget.height,
                width: widget.width,
                color: Colors.transparent,
                child:Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  Stack(
                      children: [
                        Container(
                          height: 25,
                          color: Colors.transparent,
                          child: Center(
                            child: Stack(
                              children: [
                            Container(
                              height:4,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15)
                              ),
                            ),

                                Container(
                                  height:4,
                                  width: _animation.value,
                                  color: Colors.orange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  Positioned(
                    left:_animation.value,
                    bottom:6,
                    child: Container(
                      width: 15,
                      height: 15,
                      decoration:   BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(50)
                      ),
                    ),
                  ),
                ],
              ),),
              ),
            );
          },

        ),
    );
  }
}
