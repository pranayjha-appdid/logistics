class Booking {
  final String id;
  final String vehicleNo;
  final bool submit;
  final String bookingDate;
  final String deliveryDate;
  final List<Location> locations;

  Booking({
    required this.id,
    required this.vehicleNo,
    required this.submit,
    required this.bookingDate,
    required this.deliveryDate,
    required this.locations,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    var locationsList = json['locations'] as List<dynamic>;
    List<Location> locationlist =
    locationsList.map((loc) => Location.fromJson(loc)).toList();

    return Booking(
      id: json['id'],
      vehicleNo: json['vehicleNo'],
      submit: json['submit'],
      bookingDate: json['bookingDate'],
      deliveryDate: json['deliveryDate'],
      locations: locationlist,
    );
  }
}

class Location {
  final String address;
  final bool isPickUp;

  Location({required this.address, required this.isPickUp});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
      isPickUp: json['isPickUp'],
    );
  }
}
