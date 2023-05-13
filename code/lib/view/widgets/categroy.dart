import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/app_service.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  final void Function()? onClicked;
  const CategoryWidget({required this.index, required this.onClicked, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        shape: Border(
            left: BorderSide(color: Colors.yellow.withOpacity(.4), width: 10)),
        child: ListTile(
          onTap: onClicked,
          title: Text(
            AppService.categories!.elementAt(index),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
