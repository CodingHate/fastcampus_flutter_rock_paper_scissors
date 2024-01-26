import 'package:flutter/material.dart';

import '../enum.dart';

class GameResult extends StatelessWidget {
  final bool isDone;
  final Result? result;
  final VoidCallback callback;

  const GameResult(
      {required this.isDone, this.result, super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            result!.displayString,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () => callback.call(),
            child: Text(
              '다시 하기',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      );
    }
    return const Center(
      child: Text(
        '가위, 바위, 보 중 하나를 선택 해 주세요.',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
