import 'package:admconnect/admin-system/pages/home/home_presenter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarComponent extends StatefulWidget {
  const SideBarComponent({Key? key}) : super(key: key);

  @override
  State<SideBarComponent> createState() => _SideBarComponentState();
}

class _SideBarComponentState extends State<SideBarComponent> {
  @override
  Widget build(BuildContext context) {
    final IHomePresenter presenter = Get.find<IHomePresenter>();
    return Container(
      width: 80,
      decoration: const BoxDecoration(
        color: Color(0XFF1e224c),
        boxShadow: [
          BoxShadow(color: Colors.black, offset: Offset(-3, -2)),
        ],
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: presenter.buttonsSideBarList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Tooltip(
                verticalOffset: 20,
                message: presenter.buttonsSideBarList[index].title,
                child: Obx(() {
                  return Container(
                    height: 46,
                    width: 46,
                    decoration: index == presenter.currentSideBarIndex
                        ? BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0XFFf44336).withOpacity(0.9),
                                const Color(0XFFec8d2f).withOpacity(0.9),
                              ],
                            ),
                          )
                        : null,
                    child: IconButton(
                      icon: Icon(
                        presenter.buttonsSideBarList[index].icon,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        presenter.currentSideBarIndex = index;
                        presenter.focusedPage = presenter.buttonsSideBarList[index].page;
                      } ,
                    ),
                  );
                }),
              ),
              const Divider(color: Colors.white, thickness: 0.1),
            ],
          );
        },
      ),
    );
  }
}