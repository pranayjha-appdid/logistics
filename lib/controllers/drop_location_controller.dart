import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/models/response/location_model.dart';

class DropLocationController extends GetxController implements GetxService {
  int maxAddress = 4;
  final List<LocationFormControllers> _locations = [LocationFormControllers()];
  List<LocationFormControllers> get locations => _locations;

  void updatemaxaddress(int max){
    maxAddress=max;
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

  List<LocationModel> getLocationModels() {
    return _locations.map((location) => location.toModel()).toList();
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
    );
  }


  void dispose() {
    address.dispose();
    buildingName.dispose();
    floor.dispose();
    flatNo.dispose();
  }
}
