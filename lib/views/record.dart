import 'dart:async';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:rxdart/rxdart.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({Key? key}) : super(key: key);

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  String elapsedTime="00:00:00";
  Timer? timer;
  late Record recorder;
  StreamSubscription<RecordState>? recordSub;
  RecordState recordState = RecordState.stop;
  StreamSubscription? _recorderSubscription;
  Stopwatch stopwatch = Stopwatch();
  final player=AudioPlayer();

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
              (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  void initState() {
    recorder = Record();
    recordSub = recorder.onStateChanged().listen((state) {
      setState(() {
        recordState = state;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7)
                  ),
                  child: Image.asset(
                    "assets/images/holder.png", fit: BoxFit.cover,),
                ),
                const Text('تسجيل'),
                IconButton(
                    onPressed: () {}, icon: const Icon(FontAwesomeIcons.gear))
              ],
            ),
          ),
          Container(
            height: 240,
            width: 240,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
            child: RawMaterialButton(
              shape: const CircleBorder(),
              splashColor: Colors.redAccent,
              onLongPress: () {
                // clear
                stopRecord();
                stopwatch.reset();
                setState(() {
                  elapsedTime="00:00:00";
                });
              },
              onPressed: () {

                if (recordState == RecordState.record) {
                  pause();
                  stopwatch.stop();
                } else if (recordState == RecordState.pause) {
                  resume();
                  stopwatch.start();
                }else{
                  startRecord();
                  stopwatch.start();
                }
              },
              child: Center(
                child: Container(
                  height: 215,
                  width: 215,

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Color(0xffFBAA1D),
                      Color(0xffDA9E79),
                      Color(0xffF75830),

                    ],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),

                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color(0xffFD5B2A),
                          Color(0xffDA9E79),
                          Color(0xffF28C1D),

                        ],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft
                        ),
                      ),
                      child: const Icon(
                        FontAwesomeIcons.microphoneLines, size: 70,),
                    ),
                  ),
                ),
              ),
            ),
          ), //button for record
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(elapsedTime),
          ),

          recordState == RecordState.stop? StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                        builder: (context, snapshot) {
                        final positionData = snapshot.data;
                        final progress = positionData?.position ?? Duration.zero;
                        final buffered = positionData?.bufferedPosition ?? Duration.zero;
                        final total = positionData?.duration ?? Duration.zero;
                      return Column(
                        children: [
                          IconButton(onPressed: (){
                            if(player.playing){
                              player.stop();
                            }else{
                              player.play();
                            }

                          }, icon:player.playing? const Icon(Icons.pause_circle_filled):const Icon( Icons.play_circle_filled)),
                          SizedBox(
                            width: 250,
                            child: ProgressBar(
                            progress: progress,
                            buffered: buffered,
                            total: total,
                            onSeek: (duration) {
                            player.seek(duration);
                            },
                            ),
                          ),
                        ],
                      );
                      },
    ): const SizedBox.shrink(),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                maximumSize: const Size(130, 100),
              )
              , child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "رفع ملف", style: TextStyle(color: Colors.white))
                  ),
                  Icon(FontAwesomeIcons.cloudArrowUp, color: Colors.white,),
                ],
              )),

        ],
      ),
    );
  }


  void startRecord() async {
    if (await recorder.hasPermission()) {
      await recorder.start();
      startTimer();
    }else {
      throw ErrorWidget(Exception("no permission"));
    }
  }

  void stopRecord() async {
    String? anURL = await recorder.stop();
    print("path :  ");
    print(anURL);
    await player.setFilePath(anURL!);
    timer!.cancel();
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
  }

  Future<void> resume() async {
    startTimer();
    await recorder.resume();
  }

  Future<void> pause() async {
    timer!.cancel();
    await recorder.pause();
  }

  void startTimer() {
    timer= Timer.periodic(const  Duration(milliseconds: 100),  updateTime);
  }


  updateTime(Timer timer) {
    setState(() {
      elapsedTime = transformMilliSeconds(stopwatch.elapsedMilliseconds);
    });
  }


  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
@override
  void dispose() {
    recorder.dispose();
    timer!.cancel();
    stopwatch.reset();
    recordSub!.cancel();
    player.dispose();
    super.dispose();
  }
}

class PositionData {
  const PositionData(this.position, this.bufferedPosition, this.duration);
  final  Duration position;
  final Duration bufferedPosition;
  final Duration duration;

}


class DurationState {
  const DurationState({required this.progress, required this.buffered, required this.total});
  final Duration progress;
  final Duration buffered;
  final Duration total;
}