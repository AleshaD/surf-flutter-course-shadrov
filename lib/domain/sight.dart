import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/styles/custom_icons.dart';

class Sight {
  Sight(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.photoUrls,
      required this.details,
      required this.type,
      required this.wantToVisit,
      required this.visited,
      required this.liked,
      this.wantToVisitAtDate,
      this.visitedDate})
      : id = _idCreator(lat);

  Sight.onCreate({
    required this.name,
    required this.lat,
    required this.lon,
    required this.photoUrls,
    required this.details,
    required this.type,
  })  : wantToVisit = false,
        visited = false,
        liked = false,
        wantToVisitAtDate = null,
        visitedDate = null,
        id = _idCreator(lat);

  final String details;
  final double lat;
  final double lon;
  final String name;
  final SightType type;
  final List<String> photoUrls;
  final String id;
  final DateTime? visitedDate;
  final DateTime? wantToVisitAtDate;
  bool wantToVisit;
  bool visited;
  bool liked;

  String get typeName => getTypeNameBy(this.type);

  static String _idCreator(double additionalValue) =>
      (DateTime.now().microsecondsSinceEpoch + additionalValue).toString();

  static String getTypeNameBy(SightType type) {
    switch (type) {
      case SightType.cafe:
        return AppStrings.cafe;
      case SightType.hotel:
        return AppStrings.hotel;
      case SightType.museum:
        return AppStrings.museum;
      case SightType.park:
        return AppStrings.park;
      case SightType.restaurant:
        return AppStrings.restaurant;
      case SightType.specialPlace:
        return AppStrings.specialPlace;
      default:
        return AppStrings.empty;
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
