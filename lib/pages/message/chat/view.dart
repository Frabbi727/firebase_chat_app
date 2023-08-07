import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/pages/message/chat/widgets/chat_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 176, 106, 231),
            Color.fromARGB(255, 166, 112, 231),
            Color.fromARGB(255, 131, 123, 231),
            Color.fromARGB(255, 104, 132, 231),
          ], transform: GradientRotation(90)),
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.h, bottom: 0.h, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.h, bottom: 0.h, right: 0.w),
              child: InkWell(
                child: SizedBox(
                  width: 44.w,
                  height: 44.h,
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,
                    imageBuilder: (context, imageProvider) => Container(
                      height: 44.h,
                      width: 44.w,
                      margin: null,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44.r),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          )),
                    ),
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage("assets/images/feature-1.png"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Container(
              padding: EdgeInsets.only(top: 0.h, bottom: 0.h, right: 0.w),
              width: 180.w,
              child: Row(
                children: [
                  SizedBox(
                    width: 180.w,
                    height: 44.w,
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.state.to_name.value ?? "",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryBackground,
                              fontSize: 16.sp,
                            ),
                          ),
                          Text(
                            "unknown location",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.normal,
                              color: AppColors.primaryBackground,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              ChatList(),
              Positioned(
                bottom: 0.h,
                height: 50.h,
                child: Container(
                  width: 360.w,
                  height: 50.h,
                  color: AppColors.primaryBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 217.w,
                        height: 50.h,
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          controller: controller.textController,
                          autofocus: false,
                          focusNode: controller.contentNode,
                          style: TextStyle(color: Colors.black,fontSize: 15.sp),
                          decoration:
                              InputDecoration(helperText: "Send message. . .",),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 30.w,
                        margin: EdgeInsets.only(left: 5.w),
                        child: GestureDetector(
                          child:  Icon(
                            Icons.photo_outlined,
                            size: 35.w,
                            color: Colors.blue,
                          ),
                          onTap: () {},
                        ),
                      ),
                      Container(
                        width: 65.w,
                        height: 35.h,
                        margin: EdgeInsets.only(left: 10.w, top: 5.h),
                        child: ElevatedButton(
                            onPressed: () {
                              controller.sendMessage();
                            }, child: Text("Send")),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
