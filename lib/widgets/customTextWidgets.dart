import 'package:flutter/cupertino.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.fontWeight});

  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color ?? const Color(0xff747474),
        fontWeight: fontWeight,
      ),
    );
  }
}
