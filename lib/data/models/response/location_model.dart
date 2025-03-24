import 'dart:convert';

import 'package:flutter/material.dart'; // For using json.encode and json.decode

class LocationModel {
  String address;
  String buildingName;
  String floor;
  String flatno;

  LocationModel({
    required this.address,
    required this.buildingName,
    required this.floor,
    required this.flatno,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'buildingName': buildingName,
      'floor': floor,
      'flatno': flatno,
    };
  }

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      address: json['address'],
      buildingName: json['buildingName'],
      floor: json['floor'],
      flatno: json['flatno'],
    );
  }
}


