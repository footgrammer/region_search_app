// {
//   "lastBuildDate": "Fri, 01 Nov 2024 23:58:48 +0900",
//   "total": 4228,
//   "start": 1,
//   "display": 10,
//   "items": [
//   ]
// }

import 'package:region_search_app/data/model/location.dart';

class LocationResponseDto {
  final String lastBuildDate;
  final int total;
  final int start;
  final int display;
  final List<Location> items;

  LocationResponseDto({
    required this.lastBuildDate,
    required this.total,
    required this.start,
    required this.display,
    required this.items,
  });

  LocationResponseDto.fromJson(Map<String, dynamic> json)
    : this(
        lastBuildDate: json["lastBuildDate"],
        total: json["total"],
        start: json["start"],
        display: json["display"],
        items:
            List.from(json["items"]).map((e) => Location.fromJson(e)).toList(),
      );

  Map<String, dynamic> toJson() => {
    "lastBuildDate": lastBuildDate,
    "total": total,
    "start": start,
    "display": display,
    "items": items.map((e) => e.toJson()),
  };
}
