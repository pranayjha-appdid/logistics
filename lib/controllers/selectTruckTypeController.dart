import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class SelectTruckTypeController extends GetxController implements GetxService {

  String? selectedTruckName ;
  String? selectedGoodsType ;


  void updateSelectedTruck(String truckName) {
    selectedTruckName = truckName;
    update();
  }

  void updateSelectedGoodsType(String goodsType) {
    selectedGoodsType= goodsType;
    update();
  }


}
