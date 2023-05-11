import 'dart:math' as Math;

import '../data/model/coordinate.dart';

mixin LocationHelper {
  double getDistanceBeatwenCoordinates(Coordinate first, Coordinate second) {
    final ky = 40000 / 360;
    final kx = Math.cos(Math.pi * second.lat / 180.0) * ky;
    final dx = (second.lng - first.lng).abs() * kx;
    final dy = (second.lat - first.lat).abs() * ky;
    final distance = Math.sqrt(dx * dx + dy * dy) * 1000;

    return distance;
  }
}
