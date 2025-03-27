import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/response/location_model.dart';

class DropLocationController extends GetxController implements GetxService {
  int maxAddress = 4;
  final List<LocationFormControllers> _locations = [LocationFormControllers()];
  List<LocationFormControllers> get locations => _locations;



  List<LocationModel> addressList = [];

  void updateMaxAddress(int max) {
    maxAddress = max;
    update();
  }

  void addAddress() {
    if (_locations.length < maxAddress) {
      _locations.add(LocationFormControllers());
      update();
    }
  }

  void removeAddress(int index) {
    if (_locations.length > 1) {
      _locations[index].dispose();
      _locations.removeAt(index);
      update();
    }
  }

  void submitLocations() {
    addressList = getLocationModels();
    update();
    printLocations(); // Print in console for debugging
  }

  List<LocationModel> getLocationModels() {
    return _locations.map((location) => location.toModel()).toList();
  }

  void printLocations() {
    for (var loc in addressList) {
      print(
          "Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }
  }

  @override
  void onClose() {
    for (var form in _locations) {
      form.dispose();
    }
    super.onClose();
  }
}

class LocationFormControllers {
  final TextEditingController address = TextEditingController();
  final TextEditingController buildingName = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController flatNo = TextEditingController();

  LocationModel toModel() {
    return LocationModel(
      address: address.text.trim(),
      buildingName: buildingName.text.trim(),
      floor: floor.text.trim(),
      flatno: flatNo.text.trim(),
      type: 'drop',
    );
  }

  void dispose() {
    address.dispose();
    buildingName.dispose();
    floor.dispose();
    flatNo.dispose();
  }
}
