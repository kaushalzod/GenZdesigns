import 'dart:async';
import 'package:flutter/material.dart';

class GenZCountdown extends StatefulWidget {
  const GenZCountdown({
    Key? key,
    this.seperatorText,
    this.showHours = true,
    this.showMin = true,
    this.showSeconds = true,
    required this.duration,
    this.onDone,
    this.customWiget,
    this.textStyle,
    this.isIncremental = false,
    this.replacement,
  }) : super(key: key);

  /// Seperator text and textStyle
  /// Default Seperator is ' : '
  ///
  ///Example (24Hrs:20Min:40Sec)
  /// ```dart
  /// GenZTimerSeperatorText(
  ///   hours: "Hrs",
  ///   mins: "Min",
  ///   sec: "Sec",
  ///   style: const TextStyle(fontSize: 10),
  ///),
  ///```
  final GenZTimeSeperator? seperatorText;

  ///Duration for which timer should be shown.
  ///
  ///When [isIncremental] is true then duration will be act as end time when the timer should stop.
  ///
  ///Info: Show sale time like below so it wont reset when app state changes.
  ///
  ///```dart
  ///Duration(
  ///  milliseconds: DateTime.parse("2022-09-07 13:27:00")
  ///  .difference(DateTime.now())
  ///  .inMilliseconds,
  ///)
  /// ```
  final Duration duration;

  /// What to do when timer finishes or goes to 00:00:00.
  final VoidCallback? onDone;

  /// Create your own widget to display time on instead of Text Widget
  final Widget Function(String hour, String minute, String second)? customWiget;

  ///TextStyle for time text.
  final TextStyle? textStyle;

  ///CountUp clock mark true if you want clock to increase
  final bool isIncremental;

  ///Display Hours; Default is true
  final bool showHours;

  ///Display Minutes; Default is true
  final bool showMin;

  ///Display Seconds; Default is true
  final bool showSeconds;

  /// Replacemnet widget for timer finish
  final Widget? replacement;

  @override
  State<GenZCountdown> createState() => _GenZCountdownState();
}

class _GenZCountdownState extends State<GenZCountdown> {
  late Duration _duration;
  bool _replacement = false;
  Timer? timer;
  late TextStyle _textStyle;
  @override
  void initState() {
    _duration =
        widget.isIncremental ? const Duration(seconds: 0) : widget.duration;
    _textStyle = widget.textStyle ?? const TextStyle(color: Colors.black);
    startTimer();
    super.initState();
  }

  /// Will start time countdown
  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => updateTime());
  }

  updateTime() {
    setState(() {
      final updateBy = widget.isIncremental ? 1 : -1;
      final seconds = _duration.inSeconds + updateBy;
      if (widget.isIncremental
          ? (seconds > widget.duration.inSeconds)
          : (seconds < 0)) {
        widget.onDone?.call();
        timer?.cancel();
        _replacement = widget.replacement != null ? true : false;
      } else {
        _duration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  /// Function to convert single digit into two digit
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = twoDigits(_duration.inHours);
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));

    if (_replacement) {
      // Replacement Widget
      return widget.replacement!;
    } else {
      if (widget.customWiget != null) {
        // Customwidget
        return widget.customWiget!.call(hours, minutes, seconds);
      } else {
        // Default Text Widget
        return RichText(
          text: TextSpan(
            style: _textStyle,
            children: [
              TextSpan(text: widget.showHours ? hours : null),
              TextSpan(
                text: widget.seperatorText != null
                    ? (widget.showHours ? widget.seperatorText?.hours : null)
                    : null,
                style: widget.seperatorText?.style,
              ),
              TextSpan(
                text: widget.showHours
                    ? (widget.seperatorText?.seperator ?? ' : ')
                    : null,
                style: widget.seperatorText?.style ?? _textStyle,
              ),
              TextSpan(text: widget.showMin ? minutes : null),
              TextSpan(
                text: widget.seperatorText != null
                    ? (widget.showMin ? widget.seperatorText?.mins : null)
                    : null,
                style: widget.seperatorText?.style,
              ),
              TextSpan(
                text: widget.showSeconds && widget.showMin
                    ? (widget.seperatorText?.seperator ?? ' : ')
                    : null,
                style: widget.seperatorText?.style ?? _textStyle,
              ),
              TextSpan(text: widget.showSeconds ? seconds : null),
              TextSpan(
                text: widget.seperatorText != null
                    ? (widget.showSeconds ? widget.seperatorText?.sec : null)
                    : '',
                style: widget.seperatorText?.style,
              ),
            ],
          ),
        );
      }
    }
  }
}

class GenZTimeSeperator {
  String? hours;
  String? mins;
  String? sec;

  /// Seperator for default time widget.
  /// Example (:,-,/,|)
  String? seperator;

  /// This style is only applicable to [hours], [mins], [sec]
  TextStyle? style;

  GenZTimeSeperator(
      {this.hours, this.mins, this.sec, this.style, this.seperator = ' : '});
}
