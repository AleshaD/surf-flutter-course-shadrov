import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/styles/custom_icons.dart';

class Sight {
  const Sight(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.url,
      required this.details,
      required this.type,
      required this.wantToVisit,
      required this.visited,
      required this.liked,
      this.wantToVisitAtDate,
      this.visitedDate});

  final String details;
  final double lat;
  final double lon;
  final String name;
  final SightType type;
  final String url;
  final bool visited;
  final bool wantToVisit;
  final bool liked;
  final DateTime? visitedDate;
  final DateTime? wantToVisitAtDate;

  String get typeName => getTypeNameBy(this.type);

  static String getTypeNameBy(SightType type) {
    switch (type) {
      case SightType.cafe:
        return 'Кафе';
      case SightType.hotel:
        return 'Отель';
      case SightType.museum:
        return 'Музей';
      case SightType.park:
        return 'Парк';
      case SightType.restaurant:
        return 'Ресторан';
      case SightType.specialPlace:
        return 'Особое место';
      default:
        return 'empty';
    }
  }

  static IconData getTypeIconBy(SightType type) {
    switch (type) {
      case SightType.cafe:
        return CustomIcons.cafe;
      case SightType.hotel:
        return CustomIcons.hotel;
      case SightType.museum:
        return CustomIcons.museum;
      case SightType.park:
        return CustomIcons.park;
      case SightType.restaurant:
        return CustomIcons.restourant;
      case SightType.specialPlace:
        return CustomIcons.particular_place;
    }
  }
}
