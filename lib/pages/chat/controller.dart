import 'package:firebase_chat/pages/chat/state.dart';
import 'package:get/get.dart';


class ChatController extends GetxController {
  final state = ChatState();
  ChatController();
  var doc_id= null;

  @override
  void onInit() {
    super.onInit();
    var data= Get.parameters;
    doc_id= data["doc_id"];
    state.to_uid.value=data['to_uid']??"";
    state.to_name.value=data['to_name']??"";
    state.to_avatar.value=data['to_avatar']??"";


  }
}
