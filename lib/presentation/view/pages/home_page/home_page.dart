import 'package:flutter/material.dart';
import 'package:gemini_ai/controller/gemini_controller.dart';
import 'package:gemini_ai/model/gemini_model.dart';
import 'package:get/get.dart';

import '../../../../Utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    GeminiController controller = Get.put(GeminiController());
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283739),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xffA5B68D),
                  actions: [
                    Center(
                      child: SizedBox(
                        height: size.height * 0.02,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.instance.historypage,
                        );
                      },
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          color: const Color(0xff283739),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "History",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Icon(
                                Icons.history_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            child: const CircleAvatar(
              child: Image(
                image: AssetImage("lib/assets/logo/logo2.png"),
              ),
            ),
          ),
        ),
        title: const Align(
          alignment: Alignment(-1.1, 0),
          child: Text(
            "Infinite.ai",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff283739),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Divider(
                  color: Colors.grey, // Customize color if needed
                  thickness: 1,
                  indent: 5,
                  endIndent: 5,
                  height: 0.01, // Adjust space around the divider
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Expanded(
                  child: Obx(
                    () {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) {
                          GeminiModel data = controller.dataList[index];
                          return Card(
                            // color: Colors.white,
                            color: const Color(0xffF7F9F2),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                data.responce.value,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: const Color(0xffF7F9F2),
                    filled: true,
                    focusColor: const Color(0xffF7F9F2),
                    hintText: "Type something...",
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                  onFieldSubmitted: (value) async {
                    if (value.toString().trim().isNotEmpty) {
                      await controller.fetchData(prompt: value);
                    }
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isLoading.value
                ? const Center(
                    child: Text(
                      "Typing...",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
