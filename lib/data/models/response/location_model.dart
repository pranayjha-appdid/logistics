
class LocationModel {
  String address;
  String buildingName;
  String floor;
  String flatno;
  String type;

  LocationModel({
    required this.address,
    required this.buildingName,
    required this.floor,
    required this.flatno,
    required this.type
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'buildingName': buildingName,
      'floor': floor,
      'flatno': flatno,
      'type':type,
    };
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      address: json['address'],
      buildingName: json['buildingName'],
      floor: json['floor'],
      flatno: json['flatno'],
      type: json['type']
    );
  }
}


