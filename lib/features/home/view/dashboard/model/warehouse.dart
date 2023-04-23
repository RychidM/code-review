class Warehouse {
  Warehouse({
    this.id,
    this.name,
    this.location,
    this.adminId,
  });

  String? id;
  String? adminId;
  String? name;
  String? location;

  Warehouse copyWith({
    String? id,
    String? name,
    String? location,
  }) =>
      Warehouse(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location ?? this.location,
      );

  Warehouse.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    location = json["location"];
    adminId = json["admin_id"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "admin_id": adminId,
      };
}
