class Provinces {
  final int id;
  final int country;
  final String name;

  Provinces({
    required this.id,
    required this.country,
    required this.name,
  });

  factory Provinces.fromJson(Map<String, dynamic> json) {
    return Provinces(
      id: json['id'],
      country: json['country_id'],
      name: json['name'],
    );
  }
}
