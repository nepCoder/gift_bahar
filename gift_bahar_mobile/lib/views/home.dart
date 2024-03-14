import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gift_bahar/controller/auth_controller.dart';
import 'package:gift_bahar/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          title: Text(widget.title),
          leading: const Icon(
            Icons.menu,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Get.find<AuthController>().logout();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Obx(() {
              if (homeController.giftList.isEmpty) {
                return const Text('No gifts available');
              } else {
                return GridView.builder(
                  itemCount: homeController.giftList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Image.network(
                                'https://www.charitycomms.org.uk/wp-content/uploads/2019/02/placeholder-image-square.jpg',
                                fit: BoxFit.cover,
                                // color: const Color(0xffFFE7E7),
                                // colorBlendMode: BlendMode.multiply,
                              ),
                            ),
                            Text(
                              homeController.giftList[index]['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              homeController.giftList[index]['description'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
            Get.find<HomeController>().isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : const Center(child: SizedBox())
          ]),
        ),
      ),
    );
  }
}
