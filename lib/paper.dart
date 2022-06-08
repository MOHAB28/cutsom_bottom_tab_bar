import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  const Paper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (ctx,i) {
      return const Text('Paper');
    }, separatorBuilder: (ctx,i) {
      return const SizedBox(height: 10.0,);
    }, itemCount: 50);
  }
}