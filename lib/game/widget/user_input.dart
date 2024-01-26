import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/game/enum.dart';

import 'input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final Function(InputType) callback;

  const UserInput({required this.isDone, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Placeholder();
    }

    return Row(
      children: _getInputs(callback),
    );
  }
}

List<Widget> _getInputs(Function(InputType) callback) {
  return InputType.values
      .map(
        (type) => Expanded(
          child: InkWell(
            onTap: () => callback.call(type),
            child: InputCard(
              child: Image.asset(type.path),
            ),
          ),
        ),
      )
      .toList();
}
