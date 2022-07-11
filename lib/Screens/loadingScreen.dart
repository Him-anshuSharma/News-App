// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingWidget();
  }
}

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoadingWidgetState();
}

class LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            color: const Color.fromRGBO(236, 240, 241, 1),
            child: Image.network(
              'https://media.giphy.com/media/jAYUbVXgESSti/giphy.gif',
              // errorBuilder: (context, e, stackTrace) {
              //   return const Text("LOADING", style: TextStyle(fontSize: 12),);
              // },
            )));
  }
}
