import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import '../../../../../utils/constant.dart';


class PendingInvoiceScreen extends StatelessWidget {
  const PendingInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Invoice', backButton: true),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(AssetPath.pendingIcon, height: 34,),
              title: const Text('Pending Approval', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColor.pendingColor),),
              subtitle: const Text('Estimate.: 24 Hours',
                style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
              trailing: const Text('8 June 2022',
                style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Graphic Design', style: TextStyle(fontSize: 16),),
                Text('SAR 1000', style: TextStyle(fontSize: 16,),)
              ],
            ),
            const SizedBox(height: 5,),
            const Text('First sprint for noon website',
              style: TextStyle(fontSize: 12, color: AppColor.subtitleColor),),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Sub Total',
                        style: TextStyle(fontSize: 11, color: AppColor
                            .subtitleColor)),
                    Text('Fees',
                        style: TextStyle(fontSize: 11, color: AppColor
                            .subtitleColor)),
                    Text('Total', style: TextStyle(fontSize: 18,),),
                  ],
                ),
                const SizedBox(width: 60,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('SAR100',
                      style: TextStyle(fontSize: 11, color: AppColor
                          .subtitleColor),),
                    Text('SAR..',
                      style: TextStyle(fontSize: 11, color: AppColor
                          .subtitleColor),),
                    Text('SAR..', style: TextStyle(fontSize: 18,),),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24,),
            CustomCardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Timeline', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: const [
                          Text('7:30 am', style: TextStyle(
                              fontSize: 12, color: AppColor.subtitleColor),),
                          Text('Today', style: TextStyle(
                              fontSize: 10, color: AppColor.subtitleColor),)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.blue,
                              radius: 4,
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              decoration: const BoxDecoration(
                                color: Colors.grey,),
                            ),
                            const Text('More', style: TextStyle(fontSize: 10,
                                color: AppColor.subtitleColor),),
                          ],
                        ),
                      ),
                      const Text('Created', style: TextStyle(fontSize: 12),),
                    ],
                  )
                ],
              ),
            ),

            TextButton(onPressed: () {},
                child: const Text(
                  'Show Invoice', style: TextStyle(fontSize: 14),)),
            const SizedBox(height: 48,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(
                          color: AppColor.borderColor,
                        ),
                      ),
                      minimumSize: const Size(162, 44)),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(
                          color: AppColor.borderColor,
                        ),
                      ),
                      minimumSize: const Size(162, 44)),
                  child: const Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
