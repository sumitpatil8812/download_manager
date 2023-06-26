import 'package:download_manager/utils/constants.dart';
import 'package:download_manager/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/simple_ui_controller.dart';

class DownloadFilesScreen extends StatelessWidget {
  DownloadFilesScreen({super.key});
  final SimpleUIController downloadController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        foregroundColor: black,
        title: const Text('Download'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: downloadController.downloadInfoList.length,
                  itemBuilder: (ctx, i) {
                    return Obx(
                      () => Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 3),
                        child: Card(
                          elevation: 5,
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  downloadController.downloadInfoList[i].url,
                                ),
                              ),
                              title: Text(
                                downloadController.downloadInfoList[i].name
                                    .toString(),
                                style: kBodyText16wBold(black),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  ProgressBar(
                                      value: downloadController
                                              .downloadInfoList[i].progress /
                                          100),
                                  addVerticalSpace(4),
                                  Text(
                                    "${downloadController.downloadInfoList[i].progress.toString()} %",
                                    style: kBodyText10wBold(black),
                                  )
                                ],
                              ),
                              trailing: downloadController
                                          .downloadInfoList[i].progress ==
                                      100
                                  ? IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.download_done,
                                        color: Colors.green,
                                      ))
                                  : const SizedBox()),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
