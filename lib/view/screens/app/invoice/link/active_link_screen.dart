import 'package:flutter/material.dart';
import '../../../../../utils/constant.dart';
import '../../../../shared/custom_appbar.dart';
import '../../payout/bank/payout_screen.dart';

class ActiveLinkScreen extends StatefulWidget {
  const ActiveLinkScreen({Key? key}) : super(key: key);

  @override
  State<ActiveLinkScreen> createState() => _ActiveLinkScreenState();
}

class _ActiveLinkScreenState extends State<ActiveLinkScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Link', backButton: true),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Image.asset(AssetPath.inactiveIcon, height: 34,color: Colors.blue,),
                  title: const Text('Active',
                    style: TextStyle(fontSize: 15 ,color: Colors.blue, fontWeight: FontWeight.bold,),),
                  subtitle: const Text('The link is disabled',
                    style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
                  trailing: const Text('Created: 8 June 2022',
                    style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
                ),

                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Graphic Design', style: TextStyle(fontSize: 16),),
                    Text('SAR 1000', style: TextStyle(fontSize: 16,),)
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
                                color: Colors.blue,
                              )),
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 8, top: 10, bottom: 10,),
                            child: Text('https://buy.stripe.com/6oEg0qcMW2J9bU4e9R',
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )),
                    Expanded(child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
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
                            Text('SAR 1000', style: TextStyle(fontSize: 13),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Fees', style: TextStyle(
                                fontSize: 13, color: AppColor.subtitleColor),),
                            SizedBox(height: 10,),
                            Text('SAR 50', style: TextStyle(fontSize: 13),)
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Total', style: TextStyle(
                                fontSize: 13, color: AppColor.subtitleColor),),
                            SizedBox(height: 10,),
                            Text('SAR 3150', style: TextStyle(fontSize: 13),)
                          ],
                        ),
                      ],
                    )
                ),
                CustomCardWidget(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Mohammed Saad',style: TextStyle(fontSize: 14),),
                        Row(
                          children: [
                            const Text('By',style: TextStyle(fontSize: 9,color: AppColor.subtitleColor),),
                            Padding(padding: const EdgeInsets.only(left: 8,right: 4),
                              child: Image.asset(AssetPath.paypalIcon,height: 12,),),
                            const Text('PayPal',style: TextStyle(fontSize: 9,color: AppColor.subtitleColor),)
                          ],
                        ),
                        Column(
                          children:  [
                            const Text('SAR 1000',style: TextStyle(fontSize: 15),),
                            const Text('8 June, 10:30 am',style: TextStyle(fontSize: 8,color: AppColor.subtitleColor),),
                          ],
                        )
                      ],
                    )
                ),
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
                                  fontSize: 10, color: AppColor.subtitleColor),),
                              SizedBox(height: 11,),
                              Text('2:15 am', style: TextStyle(
                                  fontSize: 12, color: AppColor.subtitleColor),),
                              Text('Yesterday', style: TextStyle(
                                  fontSize: 10, color: AppColor.subtitleColor),),
                              SizedBox(height: 11,),
                              Text('2:15 am', style: TextStyle(
                                  fontSize: 12, color: AppColor.subtitleColor),),
                              Text('2 Days ago', style: TextStyle(
                                  fontSize: 10, color: AppColor.subtitleColor),),
                              SizedBox(height: 11,),
                              Text('7:30 am', style: TextStyle(
                                  fontSize: 12, color: AppColor.subtitleColor),),
                              Text('Last Week', style: TextStyle(
                                  fontSize: 10, color: AppColor.subtitleColor),),
                              SizedBox(height: 11,),
                              Text('2:15 am', style: TextStyle(
                                  fontSize: 12, color: AppColor.subtitleColor),),
                              Text('8 June, 22', style: TextStyle(
                                  fontSize: 10, color: AppColor.subtitleColor),),
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
                                  height: 34,
                                  width: 1,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,),
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.blue,
                                  radius: 4,
                                ),
                                Container(
                                  height: 34,
                                  width: 1,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,),
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.blue,
                                  radius: 4,
                                ),
                                Container(
                                  height: 34,
                                  width: 1,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,),
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.blue,
                                  radius: 4,
                                ),
                                Container(
                                  height: 34,
                                  width: 1,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,),
                                ),
                                const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.blue,
                                  radius: 4,
                                ),
                                const Text('Less', style: TextStyle(fontSize: 10, color: Colors.blue),),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Approved', style: TextStyle(fontSize: 12),),
                              SizedBox(height: 26),
                              Text('Edited and Pending Approval', style: TextStyle(fontSize: 12)),
                              SizedBox(height: 26),
                              Text('Adjustment', style: TextStyle(fontSize: 12)),
                              SizedBox(height: 26),
                              Text('Approved and Sent', style: TextStyle(fontSize: 12)),
                              SizedBox(height: 26),
                              Text('Created', style: TextStyle(fontSize: 12)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                TextButton(onPressed: () {},
                    child: const Text(
                      'Show Invoice', style: TextStyle(fontSize: 14),)),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: const BorderSide(
                              color: AppColor.borderColor,
                            ),
                          ),
                          minimumSize: const Size(162, 44)),
                      child: const Text(
                        'Switch to Active',
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
                          backgroundColor: Colors.white,
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
                ),
                 const SizedBox(height: 10,)
              ],
            ),
          )
      ),
    );
  }
}
