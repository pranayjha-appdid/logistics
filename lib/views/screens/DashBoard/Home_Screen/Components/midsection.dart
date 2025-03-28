import 'package:flutter/material.dart';
import 'package:logistics/generated/assets.dart';
import 'package:logistics/services/route_helper.dart';
import 'package:logistics/views/screens/DashBoard/Home_Screen/Goods/goods.dart';

import '../Packers_And_Movers/packers_and_mover_page.dart';

class MidSection extends StatefulWidget {
  const MidSection({super.key});

  @override
  State<MidSection> createState() => _MidSectionState();
}

class _MidSectionState extends State<MidSection> {
  Widget choosetransporttype({
    required Color bgcolor,
    required String type,
    required String imagepath,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bgcolor,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(child: Image.asset(imagepath)),
            ),
            const SizedBox(height: 8),
            Text(
              type,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        choosetransporttype(
          bgcolor: const Color(0xffFFE6AD),
          type: "Two Wheeler",
          imagepath: Assets.imagesTwoWheeler,
        ),
        GestureDetector(
          onTap: (){},
          child: choosetransporttype(
            bgcolor: const Color(0xffB9D9FF),
            type: "Truck",
            imagepath: Assets.imagesTruck,
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, getCustomRoute(child: PackersAndMoverPage()));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xffFFA538),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 10,
                  left: 60,
                  bottom: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      Assets.imagesPackerAndMover,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Packers & \nMovers",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, getCustomRoute(child: Goods()));

          },
          child: choosetransporttype(
            bgcolor: const Color(0xffFFE3BD),
            type: "Goods",
            imagepath: Assets.imagesGoods,
          ),
        ),
      ],
    );
  }
}

