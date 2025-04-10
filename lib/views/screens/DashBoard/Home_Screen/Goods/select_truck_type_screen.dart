import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logistics/controllers/selectTruckTypeController.dart';
import 'package:logistics/services/theme.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Goods/goods_review_screen.dart';

import '../../../../../generated/assets.dart';
import '../../../../../services/route_helper.dart';
import '../../../../base/common_button.dart';

class SelectTruckTypeScreen extends StatefulWidget {
  const SelectTruckTypeScreen({super.key});

  @override
  State<SelectTruckTypeScreen> createState() => _SelectTruckTypeScreenState();
}

class _SelectTruckTypeScreenState extends State<SelectTruckTypeScreen> {
  int selectedOptionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffD9D9D9)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Icon(Icons.arrow_back_ios, size: 16),
                )),
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Truck Type",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOptionIndex = 0;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: selectedOptionIndex == 0
                                ? const Color(0xff09596F)
                                : Colors.grey,
                            width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Open Truck",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Get.find<SelectTruckTypeController>().updateSelectedTruck("Body Pack Containers");
                        selectedOptionIndex = 1;
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: selectedOptionIndex == 1
                                ? const Color(0xff09596F)
                                : Colors.grey,
                            width: 2),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Body Pack Containers",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GetBuilder<SelectTruckTypeController>(
                builder: (selectTruckTypeController) {
              return Column(
                children: [
                  if (selectedOptionIndex == 0)
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          builder: (context) {
                            return TrcukDetails();
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectTruckTypeController.selectedTruckName ==
                                      null
                                  ? "Select Trcuk"
                                  : selectTruckTypeController
                                      .selectedTruckName!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: const Color(0xff7E7E7E),
                                      fontSize: 16),
                            ),
                            const Icon(
                              Icons.expand_more,
                              color: Color(0xff7E7E7E),
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Goodtypedialogue();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              selectTruckTypeController.selectedGoodsType ==
                                      null
                                  ? "Select Goods Type"
                                  : selectTruckTypeController
                                      .selectedGoodsType!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                      color: const Color(0xff7E7E7E),
                                      fontSize: 16),
                            ),
                          ),
                          const Icon(
                            Icons.expand_more,
                            color: Color(0xff7E7E7E),
                            size: 25,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            })
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onTap: () {
                  Navigator.push(context, getCustomRoute(child: GoodsReviewScreen()));
                },
                title: 'Book',
              ))
        ],
      ),

    );
  }
}

class TrcukDetails extends StatefulWidget {
  TrcukDetails({super.key});

  @override
  State<TrcukDetails> createState() => _TrcukDetailsState();
}

class _TrcukDetailsState extends State<TrcukDetails> {
  int? selectedIndex;

  final List<SelectTruckModel> truckList = [
    SelectTruckModel(
        image: Assets.imagesTruck1, truckName: "Tata Ace", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck2, truckName: "Pick Up", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck3, truckName: "Tata 407", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck4, truckName: "14 feet", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck5, truckName: "17 feet", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck6, truckName: "19 feet", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck7, truckName: "20 feet", loadinglimit: 1000),
    SelectTruckModel(
        image: Assets.imagesTruck8, truckName: "22 feet", loadinglimit: 1000),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<SelectTruckTypeController>(
          builder: (selectTruckTypeController) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 3,
                  color: const Color(0xffD9D9D9),
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: truckList.length,
                  itemBuilder: (context, index) {
                    var truck = truckList[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            selectTruckTypeController
                                .updateSelectedTruck(truck.truckName);

                            Future.delayed(const Duration(milliseconds: 200))
                                .then((v) {
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedIndex == index
                                  ? primaryColor
                                  : Colors
                                      .white,
                            ),
                            padding: const EdgeInsets.only(right: 8),
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  truck.image,
                                  height: 38,
                                  width: 135,
                                ),
                                Text(truck.truckName),
                                Text("${truck.loadinglimit} kg"),
                              ],
                            ),
                          ),
                        ),
                        if (index != truckList.length - 1)
                          const SizedBox(
                            height: 10,
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SelectTruckModel {
  String image;
  String truckName;
  int loadinglimit;

  SelectTruckModel(
      {required this.image,
      required this.truckName,
      required this.loadinglimit});
}

class Goodtypedialogue extends StatefulWidget {
  Goodtypedialogue({super.key});

  @override
  State<Goodtypedialogue> createState() => _GoodtypedialogueState();
}

class _GoodtypedialogueState extends State<Goodtypedialogue> {
  final List<String> goodstypelist = [
    "Catering Restaurant ",
    "Event Management machine equipment's",
    "Spare part textile",
    "Garments/ Fashion"
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: goodstypelist.length,
            itemBuilder: (context, index) {
              var type = goodstypelist[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                onTap: () {
                  Get.find<SelectTruckTypeController>()
                      .updateSelectedGoodsType(type);
                  Navigator.pop(context);
                },
                title: Text(type),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
                color: Colors.grey,
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
