import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/screens/app/payout/bank/payout_screen.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';
import '../../../../../utils/constant.dart';


class DisapprovedInvoiceScreen extends StatelessWidget {
  const DisapprovedInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Invoice', backButton: true),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset(AssetPath.disapprovedIcon, height: 34,),
                title: const Text('Disapproved', style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold,),),
                subtitle: const Text('You can edit your invoice',
                  style: TextStyle(
                      fontSize: 10, color: AppColor.subtitleColor),),
                trailing: const Text('8 June 2022', style: TextStyle(
                    fontSize: 10, color: AppColor.subtitleColor),),
              ),

              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Graphic Design', style: TextStyle(fontSize: 16),),
                  Text('SAR 1000', style: TextStyle(fontSize: 16,),)
                ],
              ),
              const SizedBox(height: 5,),
              const Text('You can edit your invoice',
                style: TextStyle(fontSize: 12, color: AppColor.subtitleColor),),
              const SizedBox(height: 5,),
              const Divider(),
              Align(
                alignment: Alignment.topRight,
                child: Row(
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

              ),
              const SizedBox(height: 24,),
              CustomCardWidget(
                bottomPadding: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Timeline', style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 12,),
                    Row(
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
                            Text('7:30 am', style: TextStyle(
                                fontSize: 12, color: AppColor.subtitleColor),),
                            Text('2 Days ago', style: TextStyle(
                                fontSize: 10, color: AppColor.subtitleColor),),
                            SizedBox(height: 11,),
                            Text('2:15 am', style: TextStyle(
                                fontSize: 12, color: AppColor.subtitleColor),),
                            Text('4 Days ago', style: TextStyle(
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
                              const Text('Less', style: TextStyle(fontSize: 10,
                                  color: Colors.blue),),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Created', style: TextStyle(fontSize: 12),),
                            SizedBox(height: 26,),
                            Text('Approved and Sent',
                              style: TextStyle(fontSize: 12),),
                            SizedBox(height: 26,),
                            Text('Approved and Sent',
                              style: TextStyle(fontSize: 12),),
                            SizedBox(height: 26,),
                            Text('Created', style: TextStyle(fontSize: 12),),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),

              // const SizedBox(height: 20,),
              TextButton(onPressed: () {},
                  child: const Text(
                    'Show Invoice', style: TextStyle(fontSize: 14),)),
              const SizedBox(height: 16,),
              CustomCardWidget(
                bottomPadding: 18,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Padding(padding: EdgeInsets.only(right: 16),
                              child: Text('Invoice', style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),),
                            ),
                            Text('#INV-003', style: TextStyle(
                              fontSize: 10,),)
                          ],
                        ),
                        Image.asset(AssetPath.logoIcon, height: 12,)
                      ],
                    ),
                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('From', style: TextStyle(
                                fontSize: 11, color: AppColor.subtitleColor),),
                            SizedBox(height: 9,),
                            Text('Talents Valley LLC', style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),),
                            SizedBox(height: 5,),
                            Text(
                              '30 North Gould St.\n Sheridan, Wyoming 82801 \n United States \n +1 307-217-6666',
                              style: TextStyle(
                                  fontSize: 11,
                                  color: AppColor.subtitleColor),),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Bill To', style: TextStyle(
                                fontSize: 11, color: AppColor.subtitleColor),),
                            SizedBox(height: 9,),
                            Text('John Doe ', style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),),
                            Text('Email@mail.com', style: TextStyle(
                                fontSize: 11, color: AppColor.subtitleColor),
                              overflow: TextOverflow.ellipsis,),
                            SizedBox(height: 21,),
                            Text('Issue Date', style: TextStyle(
                                fontSize: 11, color: AppColor.subtitleColor),),
                            SizedBox(height: 5,),
                            Text('July 27 ,2022', style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 32,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Service', style: TextStyle(
                            fontSize: 11, color: AppColor.subtitleColor),),
                        Text('Amount', style: TextStyle(
                            fontSize: 11, color: AppColor.subtitleColor),)
                      ],
                    ),
                    const SizedBox(height: 11,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('UI/UX Design for Noon Website', style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),),
                        Text('\$ 300', style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    const SizedBox(height: 7,),
                    const Text(
                      'First sprint for noon website', style: TextStyle(
                        fontSize: 12, color: AppColor.subtitleColor),),
                    const SizedBox(height: 10,),
                    const Divider(),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Sub Total', style: TextStyle(fontSize: 12,
                                    color: AppColor.subtitleColor),),
                                SizedBox(width: 43,),
                                Text('\$..', style: TextStyle(fontSize: 12,
                                    color: AppColor.subtitleColor),),
                              ],
                            ),
                            const SizedBox(height: 6,),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Fees', style: TextStyle(fontSize: 12,
                                    color: AppColor.subtitleColor),),
                                SizedBox(width: 67,),
                                Text('\$..', style: TextStyle(fontSize: 12,
                                    color: AppColor.subtitleColor),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Container(color: AppColor.borderColor,height: 1,width:118,),
                            const SizedBox(height: 4,),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Total', style: TextStyle(fontSize: 15,
                                    color: AppColor.subtitleColor),),
                                SizedBox(width: 60,),
                                Text('\$..', style: TextStyle(fontSize: 15,),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),

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
              ),

              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
