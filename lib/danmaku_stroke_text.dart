import 'package:flutter/material.dart';
import 'package:ns_danmaku/utils/border_color.dart';

class DanmakuStrokeText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final Color color;
  final double fontSize;
  final double strokeWidth;
  final int fontWeight;
  final bool isSend;
  const DanmakuStrokeText(
    this.text, {
    this.textAlign = TextAlign.left,
    this.color = Colors.white,
    this.fontSize = 16,
    this.strokeWidth = 2.0,
    this.fontWeight = 5,
    this.isSend = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          softWrap: false,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            overflow: TextOverflow.visible,
            fontWeight: FontWeight.values[fontWeight],
            backgroundColor: isSend ? getBorderColor(color) : null,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..strokeCap = StrokeCap.round
              ..strokeJoin = StrokeJoin.round
              ..color = getBorderColor(color),
          ),
        ),
        Text(
          text,
          softWrap: false,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.values[fontWeight],
            color: color,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }

  //double get strokeWidth => (fontSize / 20).ceil() * 2;
}
