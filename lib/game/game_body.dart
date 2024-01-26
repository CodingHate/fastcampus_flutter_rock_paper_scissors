import 'dart:math';

import 'package:flutter/material.dart';

import 'enum.dart';
import 'widget/cpu_input.dart';
import 'widget/game_result.dart';
import 'widget/user_input.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool _isDone; // game에 해당 되는 결과가 나왔는지 확인 하기 위한 변수
  InputType? _userInput;
  late InputType _cpuInput;
  @override
  void initState() {
    super.initState();
    _isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: _isDone, cpuInput: _cpuInput)),
        Expanded(child: GameResult(isDone: _isDone)),
        Expanded(child: UserInput(isDone: _isDone, callback: setUserInput)),
      ],
    );
  }

  void setUserInput(InputType userInput){
    setState(() {
      _isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput(){
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }
}
