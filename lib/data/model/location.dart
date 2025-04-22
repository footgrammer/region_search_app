// {
//       "title": "Harry Potter (Welcome to Hogwarts Planner Notebook Collection (Set of 3): (Harry Potter School Planner School, Harry Potter Gift, Harry Potter Station)",
//       "link": "https://search.shopping.naver.com/book/catalog/43805245634",
//       "category": "https://shopping-phinf.pstatic.net/main_4380524/43805245634.20240616071135.jpg",
//       "description": "Insight Editions",
//       "telephone": "18500",
//       "address": "Insight Editions",
//       "roadAddress": "20230606",
//       "mapx": "9798886631418",
//       "mapy": ""
// }

class Location {
  final String title;
  final String link;
  final String category;
  final String description;
  final String telephone;
  final String address;
  final String roadAddress;
  final String mapx;
  final String mapy;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.description,
    required this.telephone,
    required this.address,
    required this.roadAddress,
    required this.mapx,
    required this.mapy,
  });

  Location.fromJson(Map<String, dynamic> json)
    : this(
        title: json["title"],
        link: json["link"],
        category: json["category"],
        description: json["description"],
        telephone: json["telephone"],
        address: json["address"],
        roadAddress: json["roadAddress"],
        mapx: json["mapx"],
        mapy: json["mapy"],
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "link": link,
    "category": category,
    "description": description,
    "telephone": telephone,
    "address": address,
    "roadAddress": roadAddress,
    "mapx": mapx,
    "mapy": mapy,
  };
}
