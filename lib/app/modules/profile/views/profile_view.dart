import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tezda_task/app/constants/colors.dart';
import 'package:tezda_task/app/helpers/authorization_helper.dart';
import 'package:tezda_task/app/helpers/storage.dart';
import 'package:tezda_task/app/routes/app_pages.dart';
import 'package:tezda_task/app/widgets/dummy_profile_pic.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text('Profile'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(children: [
              Center(
                child: Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                        border: Border.all(color: Colors.white, width: 1.5)),
                    child: getProfile()['image'] == null
                        ? ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Container(
                              height: 64,
                              width: 64,
                              color: mainColor.withOpacity(0.2),
                              child: dummyProfilePic(getProfile()['gender']),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                            child: Container(
                                height: 64,
                                width: 64,
                                child: getProfile()['image'] == null
                                    ? dummyProfilePic(getProfile()['gender'])
                                    : CachedNetworkImage(
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageUrl: "${getProfile()['image']}",
                                        placeholder: (context, url) =>
                                            Container(
                                          // color: mainColor.withOpacity(0.5),
                                          child: dummyProfilePic(
                                              getProfile()['gender']),
                                          //  radius: 150,
                                        ),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )))),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "${getProfile()['firstName'] ?? ""} ${getProfile()['lastName'] ?? "--"}",
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Storage.clearAllData();
                    Get.offAllNamed(Routes.LOGIN_PAGE);
                  },
                  child: const Text("Log out"))
            ])));
  }
}
