import 'package:count/provider/coloropacity_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorOpacity extends StatefulWidget {
  const ColorOpacity({Key? key}) : super(key: key);

  @override
  State<ColorOpacity> createState() => _ColorOpacityState();
}

class _ColorOpacityState extends State<ColorOpacity> {
  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Colour Opacity"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ColorOpacityProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  value.setValue(val);
                });
          }),
          Consumer<ColorOpacityProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(
                      child: Text("Container 1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(value.value)),
                    child: const Center(
                      child: Text("Container 2"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
