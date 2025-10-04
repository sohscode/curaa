class PharmacyModel {
  PharmacyModel({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? description;
  final String? logo;
  final String? createdAt;
  final String? updatedAt;

  factory PharmacyModel.fromJson(Map<String, dynamic> json){
    return PharmacyModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      logo: json["logo"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"] ,
    );
  }

}
