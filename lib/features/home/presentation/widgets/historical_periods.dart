import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/home/data/models/historical_periods_model.dart';
import 'package:dalel/features/home/presentation/widgets/historical_period_item.dart';
import 'package:flutter/material.dart';

class HistoricalPeriods extends StatelessWidget {
  const HistoricalPeriods({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection(FireBaseStrings.historicalPeriods)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<HistoricalPeriodsModel> historicalPeriods = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              historicalPeriods
                  .add(HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
            }
            return SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return  HistoricalPeriodItem(model: historicalPeriods[index]);
                },
              ),
            );
            // Map<String, dynamic> data =
            //     snapshot.data!.docs[0].data() as Map<String, dynamic>;
            // return Text(data['name']);
          }

          return const Text("loading");
        });
  }
}



// FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore.instance
//             .collection(FireBaseStrings.historicalPeriods)
//             .get(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Something went wrong");
//           }

//           if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
//             return const Text("Document does not exist");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             return SizedBox(
//                 height: 200,
//                 child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   separatorBuilder: (context, index) {
//                     return const SizedBox(width: 10);
//                   },
//                   itemCount: 1,
//                   itemBuilder: (context, index) {
//                     return const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CustomHeaderText(text: AppStrings.historicalPeriods),
//                         SizedBox(height: 16),
//                         HistoricalPeriods(),
//                         SizedBox(height: 32),
//                       ],
//                     );
//                   },
//                 ));
//             // Map<String, dynamic> data =
//             //     snapshot.data!.docs[0].data() as Map<String, dynamic>;
//             // return Text(data['name']);
//           }

//           return const Text("loading");
//           // return Column(
//           //   crossAxisAlignment: CrossAxisAlignment.start,
//           //   children: [
//           //     const CustomHeaderText(text: AppStrings.historicalPeriods),
//           //     Text(snapshot.data!.docs[0]['name']),
//           //     const SizedBox(height: 16),
//           //     const HistoricalPeriods(),
//           //     const SizedBox(height: 32),
//           //   ],
//           // );
//         });