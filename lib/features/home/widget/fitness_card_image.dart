// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:octafitpro/shared/custom_text.dart';

// class FitnessCardImage extends StatelessWidget {
//   const FitnessCardImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Container(
//           height: 150,
//           width: MediaQuery.of(context).size.width / 2.2,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: Colors.white24,
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 31, 49, 105),
//                 Color.fromARGB(255, 64, 85, 149),
//               ],
//             ),
//           ),
//           child: Column(
//             // crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Gap(10),
//               ClipRRect(
//                 clipBehavior: Clip.antiAlias,
//                 borderRadius: BorderRadius.circular(20),
//                 child: SizedBox(
//                   height: 90,
//                   width: MediaQuery.of(context).size.width / 2.2,
//                   child: Image.asset("assets/test/test.jpg", fit: BoxFit.fill),
//                 ),
//               ),
//               Gap(10),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CustomText(
//                   text: "Full Body Workout",
//                   size: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:octafitpro/shared/custom_text.dart';

class FitnessCardImage extends StatelessWidget {
  const FitnessCardImage({super.key});

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width / 2.2;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // الكرت الأول
        Container(
          height: 150,
          width: cardWidth,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,

            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 49, 105),
                Color.fromARGB(255, 64, 85, 149),
              ],
            ),
          ),

          child: Column(
            children: [
              Gap(10),

              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),

                child: SizedBox(
                  height: 90,
                  width: cardWidth,

                  child: Image.asset("assets/test/test.jpg", fit: BoxFit.fill),
                ),
              ),

              Gap(10),

              Padding(
                padding: const EdgeInsets.all(8.0),

                child: CustomText(
                  text: "Full Body Workout",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        // فراغ بين الكرتين
        Gap(10),

        // الكرت الثاني
        Container(
          height: 150,
          width: cardWidth,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white24,

            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 49, 105),
                Color.fromARGB(255, 64, 85, 149),
              ],
            ),
          ),

          child: Column(
            children: [
              Gap(10),

              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),

                child: SizedBox(
                  height: 90,
                  width: cardWidth,

                  child: Image.asset("assets/test/test.jpg", fit: BoxFit.fill),
                ),
              ),

              Gap(10),

              Padding(
                padding: const EdgeInsets.all(8.0),

                child: CustomText(
                  text: "Cardio Workout",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
