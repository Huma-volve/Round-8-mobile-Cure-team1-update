class SpecialtyModel {
  final String name;
  final int id;
   SpecialtyModel({
    required this.name,
     required this.id,
});
  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      id: json['id'],
      name: json['name'],
    );}
}
