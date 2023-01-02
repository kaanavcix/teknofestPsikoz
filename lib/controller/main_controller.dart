import 'package:get/get.dart';


class MainController extends GetxController {

  
 
  var selectedItem = 0.obs;
  
  selectedIndex(int index) {
    selectedItem.value = index;
    update();
  }
}
