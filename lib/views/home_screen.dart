import 'package:download_manager/utils/component.dart';
import 'package:download_manager/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';

import '../controller/simple_ui_controller.dart';
import '../model/download_info_model.dart';
import '../widgets/my_appbar.dart';
import 'image_detail_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final SimpleUIController homeController = Get.put(SimpleUIController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              // Appbar Widget

              const MyAppBar(),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    addVerticalSpace(15),

                    // TabBar
                    Expanded(flex: 1, child: _buildTabBar(context)),
                    addVerticalSpace(height(context) * 0.03),

                    // Images
                    Expanded(
                      flex: 13,
                      child: Obx(
                        () => homeController.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 4,
                                    crossAxisSpacing: 4,
                                  ),
                                  itemCount: homeController.photos.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => DetailView(
                                              index: index,
                                            ));
                                      },
                                      child: Hero(
                                        tag: homeController.photos[index].id!,
                                        child: Container(
                                          margin: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: NetworkImage(homeController
                                                  .photos[index]
                                                  .urls!['small']!),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Obx(() {
                                              final downloadInfo =
                                                  homeController
                                                      .downloadInfoList
                                                      .firstWhere(
                                                (info) =>
                                                    info.url ==
                                                    homeController.photos[index]
                                                        .urls!['small'],
                                                orElse: () => ImageDownloadInfo(
                                                  name: '',
                                                  url: homeController
                                                      .photos[index]
                                                      .urls!['small']!,
                                                  progress: 0.0,
                                                ),
                                              );

                                              return IconButton(
                                                onPressed: () async {
                                                  if (downloadInfo.progress ==
                                                      0.0) {
                                                    final fileName = DateTime
                                                            .now()
                                                        .millisecondsSinceEpoch
                                                        .toString();

                                                    FileDownloader.downloadFile(
                                                      name: fileName,
                                                      url: downloadInfo.url,
                                                      onProgress:
                                                          (name, progress) {
                                                        downloadInfo.name =
                                                            fileName;
                                                        downloadInfo.progress =
                                                            progress;
                                                        homeController
                                                            .downloadInfoList
                                                            .refresh();
                                                      },
                                                      onDownloadCompleted:
                                                          (value) {
                                                        print(
                                                            'Successfully downloaded image at index $index $fileName');

                                                        homeController
                                                            .downloadInfoList
                                                            .refresh();
                                                      },
                                                    );

                                                    // Add the download info to the list
                                                    homeController
                                                        .downloadInfoList
                                                        .add(downloadInfo);
                                                  } else {
                                                    // Image is already downloaded, do something
                                                  }
                                                },
                                                icon: downloadInfo.progress ==
                                                        0.0
                                                    ? const Icon(Icons.download,
                                                        color: Colors.white)
                                                    : const Icon(Icons.check,
                                                        color: Colors.green),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: homeController.orders.length,
      itemBuilder: (ctx, i) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              homeController.selectedIndex.value = i;
              homeController.ordersFunc(homeController.orders[i]);
            },
            child: AnimatedContainer(
              margin: EdgeInsets.fromLTRB(i == 0 ? 15 : 5, 0, 5, 0),
              width: width(context) * 0.28,
              decoration: kFillBoxDecoration(
                  0,
                  i == homeController.selectedIndex.value
                      ? Colors.grey.shade700
                      : Colors.grey.shade200,
                  15),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: Text(homeController.orders[i],
                    style: kBodyText14wBold(
                        i == homeController.selectedIndex.value
                            ? white
                            : black)),
              ),
            ),
          ),
        );
      },
    );
  }
}
