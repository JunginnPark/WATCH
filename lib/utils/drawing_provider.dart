import 'dart:math';

import 'package:flutter/material.dart';

import '../models/dot_info.dart';

class DrawingProvider extends ChangeNotifier {
  final lines = <List<DotInfo>>[];
  // lines가 화면에 보여지는 선들의 집합, 이것을 저장하고 다시 불러오면 동일한 화면을 볼 수 있을 것

  double _size = 3;
  double get size => _size;
  set changeSize(double size) {
    _size = size;
    notifyListeners();
  }

  Color _color = Colors.black;
  Color get color => _color;
  set changeColor(Color color) {
    _color = color;
    notifyListeners();
  }

  bool _eraseMode = false;
  bool get eraseMode => _eraseMode;

  void changeEraseMode() {
    _eraseMode = !_eraseMode;
    notifyListeners();
  }

  void drawStart(Offset offset) {
    var oneLine = <DotInfo>[];
    oneLine.add(DotInfo(offset, size, color));
    lines.add(oneLine);
    notifyListeners();
  }

  void drawing(Offset offset) {
    lines.last.add(DotInfo(offset, size, color));
    notifyListeners();
  }

  void erase(Offset offset) {
    const eraseGap = 15;
    for (var oneLine in List<List<DotInfo>>.from(lines)) {
      for (var oneDot in oneLine) {
        if (sqrt(pow((offset.dx - oneDot.offset.dx), 2) +
                pow((offset.dy - oneDot.offset.dy), 2)) <
            eraseGap) {
          lines.remove(oneLine);
          break;
        }
      }
    }
    notifyListeners();
  }

  void print_value() {
    print(lines);
    print(lines[0][0].offset);
    print(lines[0][0].color);
    print(lines[0][0].size);
  }
}
