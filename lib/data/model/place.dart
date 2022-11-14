import 'package:flutter/material.dart';
import 'package:places/constants/app_strings.dart';
import 'package:places/data/model/enums/sight_type.dart';
import 'package:places/styles/custom_icons.dart';

class Place {
  Place({
    required this.id,
    required this.lat,
    required this.lng,
    required this.name,
    required this.urls,
    required this.placeType,
    required this.description,
    required this.wantToVisit,
    required this.visited,
    required this.liked,
    this.wantToVisitAtDate,
    this.visitedDate,
  });

  Place.onCreate({
    required this.name,
    required this.lat,
    required this.lng,
    required this.urls,
    required this.description,
    required this.placeType,
  })  : wantToVisit = false,
        visited = false,
        liked = false,
        wantToVisitAtDate = null,
        visitedDate = null,
        id = _idCreator(lat);

  final String description;
  final double lat;
  final double lng;
  final String name;
  final SightType placeType;
  final List<String> urls;
  final String id;
  final DateTime? visitedDate;
  final DateTime? wantToVisitAtDate;
  bool wantToVisit;
  bool visited;
  bool liked;

  String get typeName => getTypeNameBy(this.placeType);
  IconData get icon => getTypeIconBy(this.placeType);

  static String _idCreator(double additionalValue) =>
      (DateTime.now().microsecondsSinceEpoch + additionalValue).toString();

  static String getTypeNameBy(SightType type) {
    switch (type) {
      case SightType.temple:
        return AppStrings.temple;
      case SightType.monument:
        return AppStrings.monument;
      case SightType.park:
        return AppStrings.park;
      case SightType.theater:
        return AppStrings.theater;
      case SightType.cafe:
        return AppStrings.cafe;
      case SightType.hotel:
        return AppStrings.hotel;
      case SightType.museum:
        return AppStrings.museum;
      case SightType.restaurant:
        return AppStrings.restaurant;
      case SightType.other:
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
      case SightType.temple:
        return CustomIcons.museum;
      case SightType.other:
        return CustomIcons.particular_place;
        default: CustomIcons.particular_place;
    }
    return Icons.abc;
  }
}
