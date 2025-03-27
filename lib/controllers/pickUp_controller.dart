import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/models/response/location_model.dart';
import 'drop_location_controller.dart';

class PickUpLocationController extends GetxController implements GetxService {

  int maxAddress = 4;
  final List<LocationFormControllers> _pickuplocations = [LocationFormControllers()];
  List<LocationFormControllers> get pickuplocations => _pickuplocations;

  void updatemaxaddress(int max){
    maxAddress=max;
    update();
  }

  void addAddress() {
    if (_pickuplocations.length < maxAddress) {
      _pickuplocations.add(LocationFormControllers());
      update();
    }
  }

  void removeAddress(int index) {
    if (_pickuplocations.length > 1) {
      _pickuplocations[index].dispose();
      _pickuplocations.removeAt(index);
      update();
    }
  }

  List<LocationModel> getLocationModels() {
    return _pickuplocations.map((location) => location.toModel()).toList();
  }

  @override
  void onClose() {
    for (var form in _pickuplocations) {
      form.dispose();
    }
    super.onClose();
  }
}

