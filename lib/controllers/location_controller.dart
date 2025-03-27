import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/response/location_model.dart';

class LocationController extends GetxController implements GetxService {
  int maxPickup = 4;
  int maxDrop = 4;

  TextEditingController sendername = TextEditingController();
  TextEditingController receivername = TextEditingController();
  TextEditingController sendermobileno = TextEditingController();
  TextEditingController receivermobileno = TextEditingController();

  final List<LocationFormControllers> _pickupLocations = [];
  final List<LocationFormControllers> _dropLocations = [];

  List<LocationFormControllers> get pickupLocations => _pickupLocations;
  List<LocationFormControllers> get dropLocations => _dropLocations;

  List<LocationModel> pickaddressList = [];
  List<LocationModel> dropaddressList = [];

  int get totalAddresses => _pickupLocations.length + _dropLocations.length;

  @override
  void onInit() {
    _pickupLocations.add(LocationFormControllers(
        type: "pickup", onUpdate: updatepickupAddressList));
    _dropLocations.add(
        LocationFormControllers(type: "drop", onUpdate: updatedropAddressList));
    updatepickupAddressList();
    updatedropAddressList();
    super.onInit();
  }

  void addPickupAddress() {
    if (_pickupLocations.length < maxPickup && totalAddresses < 8) {
      _pickupLocations.add(LocationFormControllers(
          type: "pickup", onUpdate: updatepickupAddressList));
      update();
      // updateAddressList();
    }
  }

  void addDropAddress() {
    if (_dropLocations.length < maxDrop && totalAddresses < 8) {
      _dropLocations.add(LocationFormControllers(
          type: "drop", onUpdate: updatedropAddressList));
      update();

      // updateAddressList();
    }
  }

  void removePickupAddress(int index) {
    if (_pickupLocations.length > 1) {
      _pickupLocations[index].dispose();
      _pickupLocations.removeAt(index);
      updatepickupAddressList();
    }
  }

  void removeDropAddress(int index) {
    if (_dropLocations.length > 1) {
      _dropLocations[index].dispose();
      _dropLocations.removeAt(index);
      updatedropAddressList();
    }
  }

  void updatepickupAddressList({bool isDrop = false}) {
    pickaddressList = [];
    List<LocationModel> pickups = getPickupModels();
    pickaddressList.addAll(pickups);
    update();
  }

  void updatedropAddressList() {
    dropaddressList = [];
    List<LocationModel> drops = getDropModels();
    dropaddressList.addAll(drops);
    update();
  }

  List<LocationModel> getPickupModels() {
    return _pickupLocations.map((location) => location.toModel()).toList();
  }

  List<LocationModel> getDropModels() {
    return _dropLocations.map((location) => location.toModel()).toList();
  }

  void printLocations() {
    for (var loc in pickaddressList) {
      print(
          "Type: ${loc.type}, Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }

    for (var loc in dropaddressList) {
      print(
          "Type: ${loc.type}, Address: ${loc.address}, Building: ${loc.buildingName}, Floor: ${loc.floor}, Flat: ${loc.flatno}");
    }
  }

  @override
  void onClose() {
    for (var form in _pickupLocations) {
      form.dispose();
    }
    for (var form in _dropLocations) {
      form.dispose();
    }
    super.onClose();
  }
}

class LocationFormControllers {
  final TextEditingController address;
  final TextEditingController buildingName;
  final TextEditingController floor;
  final TextEditingController flatNo;
  final String type;
  final VoidCallback onUpdate;

  LocationFormControllers({required this.type, required this.onUpdate})
      : address = TextEditingController(),
        buildingName = TextEditingController(),
        floor = TextEditingController(),
        flatNo = TextEditingController() {
    address.addListener(onUpdate);
    buildingName.addListener(onUpdate);
    floor.addListener(onUpdate);
    flatNo.addListener(onUpdate);
  }

  LocationModel toModel() {
    return LocationModel(
      address: address.text.trim(),
      buildingName: buildingName.text.trim(),
      floor: floor.text.trim(),
      flatno: flatNo.text.trim(),
      type: type,
    );
  }

  void dispose() {
    address.dispose();
    buildingName.dispose();
    floor.dispose();
    flatNo.dispose();
  }
}
