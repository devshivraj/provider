import 'dart:async';

import 'package:count/provider/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    print("build");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Count"),
          centerTitle: true,
        ),
        body: Center(
            child: Consumer<CountProvider>(builder: (context, value, child) {
          return Text(
            countProvider.count.toString(),
            style: const TextStyle(fontSize: 50),
          );
        })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            countProvider.setCount();
          },
          child: const Icon(Icons.add),
        ));
  }
}
