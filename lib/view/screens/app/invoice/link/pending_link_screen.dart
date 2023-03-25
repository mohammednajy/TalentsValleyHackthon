import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import '../../../../../utils/constant.dart';


class PendingLinkScreen extends StatelessWidget {
  const PendingLinkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Link', backButton: true),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(AssetPath.pendingIcon, height: 34,),
              title: const Text('Pending Approval',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: AppColor.pendingColor),),
              subtitle: const Text('Estimate.: 24 Hours',
                style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
              trailing: const Text('8 June 2022',
                style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
            ),

            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Graphic Design', style: TextStyle(fontSize: 16),),
                Text('\$1000', style: TextStyle(fontSize: 16,),)
              ],
            ),
            const SizedBox(height: 24,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 3,
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.only(right: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                          side: const BorderSide(
                            color: AppColor.borderColor,
                          )),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 8, top: 10, bottom: 10, right: 45),
                        child: Text('Once Approved. Link will Show up here',
                          style: TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )),
                Expanded(child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xffBEC2C6),
                      alignment: Alignment.center,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: const BorderSide(
                          color: AppColor.borderColor,
                        ),
                      ),
                      minimumSize: const Size(80, 33)),
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    ),
                  ),
                )),
              ],
            ),
            const SizedBox(height: 15,),
            CustomCardWidget(horizontalPadding: 34, verticalPadding: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Balance', style: TextStyle(
                            fontSize: 13, color: AppColor.subtitleColor),),
                        SizedBox(height: 10,),
                        Text('\$0.00', style: TextStyle(fontSize: 13),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Fees', style: TextStyle(
                            fontSize: 13, color: AppColor.subtitleColor),),
                        SizedBox(height: 10,),
                        Text('\$0.00', style: TextStyle(fontSize: 13),)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Total', style: TextStyle(
                            fontSize: 13, color: AppColor.subtitleColor),),
                        SizedBox(height: 10,),
                        Text('\$0.00', style: TextStyle(fontSize: 13),)
                      ],
                    ),
                  ],
                )
            ),
            CustomCardWidget(child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Timeline', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 12,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ElevatedButton(
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
                ),),
                const SizedBox(width: 15,),
                Expanded(child: ElevatedButton(
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
                ),)

              ],
            )
          ],
        ),
      ),
    );
  }
}
