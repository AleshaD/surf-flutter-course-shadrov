
enum SightType {
  military,
  culture,
  entertainment,
  religion,
  natural,
  hystoric
}

class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final SightType type;
  const Sight(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.url,
      required this.details,
      required this.type});
}
