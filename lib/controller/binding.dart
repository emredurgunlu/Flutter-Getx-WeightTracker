import 'package:get/instance_manager.dart';
import 'remote_api.dart';
import 'controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(() => Controller());
    Get.lazyPut<RemoteApi>(() => RemoteApi());
  }
}
