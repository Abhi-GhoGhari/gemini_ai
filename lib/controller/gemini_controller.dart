import 'package:gemini_ai/helper/gemini_helper.dart';
import 'package:gemini_ai/model/gemini_model.dart';
import 'package:get/get.dart';

class GeminiController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<GeminiModel> dataList = <GeminiModel>[].obs;

  Future<void> fetchData({required String prompt}) async {
    isLoading.value = true;
    String data = await GeminiHelper.instance.fetchData(prompt: prompt);
    dataList.add(GeminiModel(prompt: prompt.obs, responce: data.obs));
    isLoading.value = false;
  }
}
