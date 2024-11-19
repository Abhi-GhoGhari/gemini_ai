import 'package:flutter/material.dart';
import 'package:gemini_ai/Utils/routes.dart';
import 'package:gemini_ai/controller/gemini_controller.dart';
import 'package:gemini_ai/model/gemini_model.dart';
import 'package:get/get.dart';

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
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Row(
        //     // mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           showDialog(
        //             context: context,
        //             builder: (context) => AlertDialog(
        //               backgroundColor: const Color(0xffA5B68D),
        //               actions: [
        //                 // SizedBox(height: size.height * 0.03),
        //                 Center(
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       Navigator.pushNamed(
        //                         context,
        //                         AppRoutes.instance.historypage,
        //                       );
        //                     },
        //                     child: Container(
        //                       height: size.height * 0.07,
        //                       width: size.width * 0.65,
        //                       decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(15),
        //                         color: const Color(0xff283739),
        //                       ),
        //                       child: const Center(
        //                         child: Padding(
        //                           padding: EdgeInsets.all(10),
        //                           child: Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             children: [
        //                               Text(
        //                                 "History",
        //                                 style: TextStyle(
        //                                   color: Colors.white,
        //                                   fontSize: 20,
        //                                 ),
        //                               ),
        //                               Icon(
        //                                 Icons.history_outlined,
        //                                 color: Colors.white,
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           );
        //         },
        //         child: Container(
        //           height: size.height * 0.06,
        //           width: size.width * 0.1,
        //           // color: Colors.black,
        //           decoration: const BoxDecoration(
        //             shape: BoxShape.circle,
        //             image: DecorationImage(
        //               image: AssetImage("lib/assets/logo/logo2.png"),
        //               fit: BoxFit.cover,
        //             ),
        //           ),
        //         ),
        //       ),
        //       Container(
        //         width: size.width * 0.02,
        //       ),
        //       const Text(
        //         "Infinite.ai",
        //         style: TextStyle(
        //           color: Colors.white,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
                  height: 20, // Adjust space around the divider
                ),
                Expanded(
                  child: Obx(
                    () {
                      return ListView.builder(
                        itemCount: controller.dataList.length,
                        itemBuilder: (context, index) {
                          GeminiModel data = controller.dataList[index];
                          return Card(
                            child: ListTile(
                              subtitle: Text("Prompt${data.prompt.value}"),
                              title: Text(
                                data.responce.value,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
                ? const Center(child: CircularProgressIndicator())
                : Container(),
          )
        ],
      ),
    );
  }
}
