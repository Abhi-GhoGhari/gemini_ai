import 'package:gemini_ai/helper/database/geminidb_helper.dart';
import 'package:gemini_ai/helper/gemini_helper.dart';
import 'package:get/get.dart';

import '../model/history_model.dart';

class HistoryController extends GetxController {
  RxList<HistoryModel> dataList = <HistoryModel>[].obs;

  void historygetdata() {
    List<HistoryModel> history = GeminidbHelper.instanse.readdata();
  }
}
