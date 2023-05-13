import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Bookslider extends StatelessWidget {
  String image;
  BuildContext context;
  Bookslider(this.context, this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.yellow.shade50,
        image: DecorationImage(image: AssetImage(image)),
      ),
    );
  }
}
