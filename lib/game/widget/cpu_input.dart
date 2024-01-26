import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/game/widget/input_card.dart';

import '../enum.dart';

class CpuInput extends StatelessWidget {
  final bool isDone;
  final InputType cpuInput;

  const CpuInput({required this.isDone, required this.cpuInput, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InputCard(
        child: getCpuInput(),
      ),
    );
  }

  Widget getCpuInput() {
    print("first");
    if (isDone) {
      print("select");
      return Image.asset(cpuInput.path);
    }

    return const SizedBox(
      width: 60,
      height: 64,
      child: Center(
        child: Text(
          "?",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
