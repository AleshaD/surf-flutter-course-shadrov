class Sight {
  const Sight(
      {required this.name,
      required this.lat,
      required this.lon,
      required this.url,
      required this.details,
      required this.type,
      this.planToVisitDate, this.visitedDate});

  final String details;
  final double lat;
  final double lon;
  final String name;
  final DateTime? planToVisitDate;
  final String type;
  final String url;
  final DateTime? visitedDate;
}
