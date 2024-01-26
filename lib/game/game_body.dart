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
        Expanded(child: GameResult(
            isDone: _isDone, result: getResult(), callback: reset,)),
        Expanded(child: UserInput(
          isDone: _isDone,
          callback: setUserInput,
          userInput: _userInput,
        )),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      _isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }
  }

  void reset() {
    setState(() {
      _isDone = false;
      setCpuInput();
    });
  }
}
