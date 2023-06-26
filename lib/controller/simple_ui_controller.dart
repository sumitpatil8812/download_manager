import 'dart:developer';
import 'package:get/get.dart';

import '../model/download_info_model.dart';
import '../model/photo_model.dart';
import '../services/api_service.dart';

class SimpleUIController extends GetxController {
  RxList<PhotosModel> photos = RxList();
  RxList<RxBool> downloadedStatus = <RxBool>[].obs;
  RxDouble dynamicProgress = 0.0.obs;
  RxList<ImageDownloadInfo> downloadInfoList = <ImageDownloadInfo>[].obs;

  RxBool isLoading = true.obs;
  RxString orderBy = "latest".obs;
  RxString apikey = "Your Api Key".obs; // added access key here
  var selectedIndex = 0.obs;

  List<String> orders = [
    "latest",
    "popular",
    "oldest",
    "views",
  ];

  /// Get Picture
  getPictureData() async {
    isLoading.value = true;
    var response = await DioService().getMethod(
        "https://api.unsplash.com/photos/?per_page=30&order_by=${orderBy.value}&client_id=$apikey");
    photos = RxList();
    if (response.statusCode == 200) {
      response.data.forEach((element) {
        photos.add(PhotosModel.fromJson(element));
      });
      isLoading.value = false;
    }
    downloadedStatus.value = List.generate(photos.length, (index) => false.obs);

    log(response.statusCode.toString());
  }

  /// changing order value
  ordersFunc(String newVal) {
    orderBy.value = newVal;
    getPictureData();
  }

  @override
  void onInit() {
    getPictureData();

    super.onInit();
  }
}
