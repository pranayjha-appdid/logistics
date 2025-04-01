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

  int get totalAddresses => pickaddressList.length + pickaddressList.length;

  @override
  void onInit() {
    _pickupLocations.add(LocationFormControllers(type: "pickup"));
    _dropLocations.add(LocationFormControllers(type: "drop"));
    // updatepickupAddressList();
    // updatedropAddressList();
    super.onInit();
  }



  // void addPickupAddress() {
  //   if (_pickupLocations.length < maxPickup && totalAddresses < 8) {
  //     _pickupLocations.add(LocationFormControllers(type: "pickup"));
  //     update();
  //   }
  // }
  //
  // void addDropAddress() {
  //   if (_dropLocations.length < maxDrop && totalAddresses < 8) {
  //     _dropLocations.add(LocationFormControllers(type: "drop"));
  //     update();
  //   }
  // }
  //
  // void removePickupAddress(int index) {
  //   if (_pickupLocations.length > 1) {
  //     _pickupLocations[index].dispose();
  //     _pickupLocations.removeAt(index);
  //     updatepickupAddressList();
  //   }
  // }
  //
  // void removeDropAddress(int index) {
  //   if (_dropLocations.length > 1) {
  //     _dropLocations[index].dispose();
  //     _dropLocations.removeAt(index);
  //     updatedropAddressList();
  //   }
  // }

  void updatepickupAddressList() {
    pickaddressList = _pickupLocations.map((loc) => loc.toModel()).toList();
    update();
  }

  void updatedropAddressList() {
    dropaddressList = _dropLocations.map((loc) => loc.toModel()).toList();
    update();
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

  LocationFormControllers({required this.type})
      : address = TextEditingController(),
        buildingName = TextEditingController(),
        floor = TextEditingController(),
        flatNo = TextEditingController();

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
