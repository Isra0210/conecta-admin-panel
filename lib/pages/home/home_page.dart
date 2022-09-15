import 'package:admconnect/pages/home/components/side_bar_component.dart';
import 'package:admconnect/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  static const route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final IHomePresenter presenter = Get.find<IHomePresenter>();
  @override
  Widget build(BuildContext context) {
    final List<String> buttonNames = [
      "Home",
      "Relatórios",
      "Perfil",
    ];
    int currentSelectedButton = 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0XFF1e224c),
        leadingWidth: 120,
        leading: Center(
          child: Container(
            alignment: Alignment.center,
            height: 32,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                style: BorderStyle.solid,
                width: 0.8,
              ),
            ),
            margin: const EdgeInsets.fromLTRB(16, 10, 0, 10),
            child: const Text("Admin Panel", textAlign: TextAlign.center),
          ),
        ),
        // actions: [
        //   Tooltip(
        //     message: 'Pesquisar',
        //     child: IconButton(
        //       color: Colors.white,
        //       iconSize: 30,
        //       onPressed: () {},
        //       icon: const Icon(Icons.search),
        //     ),
        //   ),
        //   Tooltip(
        //     message: 'Notificações',
        //     child: Container(
        //       margin: const EdgeInsets.only(right: 20),
        //       child: Stack(
        //         children: [
        //           IconButton(
        //             color: Colors.white,
        //             iconSize: 30,
        //             onPressed: () {},
        //             icon: const Icon(Icons.notifications_none_outlined),
        //           ),
        //           const Positioned(
        //             right: 6,
        //             top: 6,
        //             child: CircleAvatar(
        //               backgroundColor: Colors.pink,
        //               radius: 8,
        //               child: Text(
        //                 "3",
        //                 style: TextStyle(fontSize: 10, color: Colors.white),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonNames[0],
              style: TextStyle(
                color:
                    currentSelectedButton == 0 ? Colors.white : Colors.white70,
              ),
            ),
            Container(
              width: 60,
              height: 2,
              decoration: BoxDecoration(
                gradient: currentSelectedButton == 0
                    ? const LinearGradient(
                        colors: [
                          Color(0XFFf44336),
                          Color(0XFFec8d2f),
                        ],
                      )
                    : null,
              ),
            ),
          ],
        ),
        // Expanded(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ...List.generate(
        //         buttonNames.length,
        //         (index) => TextButton(
        //           onPressed: () {
        //             setState(() {
        //               currentSelectedButton = index;
        //             });
        //           },
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Text(
        //                 buttonNames[index],
        //                 style: TextStyle(
        //                   color: currentSelectedButton == index
        //                       ? Colors.white
        //                       : Colors.white70,
        //                 ),
        //               ),
        //               Container(
        //                 width: 60,
        //                 height: 2,
        //                 decoration: BoxDecoration(
        //                   gradient: currentSelectedButton == index
        //                       ? const LinearGradient(
        //                           colors: [
        //                             Color(0XFFf44336),
        //                             Color(0XFFec8d2f),
        //                           ],
        //                         )
        //                       : null,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        centerTitle: true,
      ),
      body: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SideBarComponent(),
            Expanded(
              child: presenter.focusedPage,
            ),
          ],
        );
      }),
    );
  }
}
