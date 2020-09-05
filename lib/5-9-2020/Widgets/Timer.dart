import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final Function onComplete;
  final int duration;
  Color color;
  double fontSize;
  Timer({
    @required this.duration,
    @required this.fontSize,
    this.onComplete,
    @required this.color,
  }) : assert(duration != null);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController controller;

  String get time {
    if (controller.isDismissed) {
      return '0:00';
    } else {
      Duration duration = controller.duration * controller.value;
      return _getTime(duration);
    }
  }

  void _startAnimation() {
    controller.reverse(from: 1.0);
  }

  String _getTime(Duration duration) {
    if (duration.inHours != 0) {
      return '${duration.inHours}:${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    } else {
      return '${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
  }

  void _onComplete() {
    if (widget.onComplete != null) widget.onComplete();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.dismissed:
          _onComplete();
          break;
        case AnimationStatus.completed:
          if (true) _onComplete();
          break;
        default:
      }
    });
    _startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Text(
            time,
            style: TextStyle(
                color: widget.color,
                fontSize: widget.fontSize,
                fontWeight: FontWeight.bold),
          );
        });
  }

  @override
  void dispose() {
    controller.stop();
    controller.dispose();
    super.dispose();
  }
}
