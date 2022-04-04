import 'package:get/get.dart';

import 'package:apicallgetx/model/commentsmodel.dart';
import 'package:apicallgetx/services/serviceapi.dart';

class AppController extends GetxController {
 
  var   getcomments = <Welcome>[].obs;
  Services services = Services();
  var postloading = true.obs;

  @override
  void onInit() {
    callpostmethod();
    super.onInit();
  }

  callpostmethod() async {
    try {
      postloading.value = true;
      var result = await services.getallcomment();
      if (result != null) {
        getcomments.assignAll(result);
      } else {
        print("null");
      }
    } finally {
      postloading.value = false;
    }
    update();
  }

  @override
  String toString() => 'AppController(getposts: $getcomments, postloading: $postloading)';
}
