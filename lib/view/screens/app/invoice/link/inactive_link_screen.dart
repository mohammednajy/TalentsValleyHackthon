import 'package:flutter/material.dart';
import '../../../../../utils/constant.dart';
import '../../../../shared/custom_appbar.dart';
import '../../payout/bank/payout_screen.dart';

class InactiveLinkScreen extends StatelessWidget {
  const InactiveLinkScreen({Key? key}) : super(key: key);

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
               leading: Image.asset(AssetPath.inactiveIcon, height: 34,),
               title: const Text('Inactive',
                 style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
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
                             color: AppColor.borderColor,
                           )),
                       color: AppColor.backgroundColor,
                       child: const Padding(
                         padding: EdgeInsets.only(
                           left: 8, top: 10, bottom: 10,),
                         child: Text('https://buy.stripe.com/6oEg0qcMW2J9bU4e9R',
                           style: TextStyle(fontSize: 12,color: AppColor.subtitleColor),
                           overflow: TextOverflow.ellipsis,
                         ),
                       ),
                     )),
                 Expanded(child: ElevatedButton(
                   onPressed: () {},
                   style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xffBEC2C6),
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
                       children: const [
                         Text('SAR 1000',style: TextStyle(fontSize: 15),),
                         Text('8 June, 10:30 am',style: TextStyle(fontSize: 8,color: AppColor.subtitleColor),),
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
                               height: 20,
                               width: 1,
                               decoration: const BoxDecoration(
                                 color: Colors.grey,),
                             ),
                             const Text('More', style: TextStyle(fontSize: 10, color: AppColor.subtitleColor),),
                           ],
                         ),
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: const [
                           Text('Switched to Inactive', style: TextStyle(fontSize: 12),),
                           SizedBox(height: 26),
                           Text('Approved', style: TextStyle(fontSize: 12))
                         ],
                       )
                     ],
                   )
                 ],
               ),
             ),
             TextButton(onPressed: () {},
                 child: const Text(
                   'Hide Invoice', style: TextStyle(fontSize: 14),)),
             const SizedBox(height: 16,),
             CustomCardWidget(
               bottomPadding: 16,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                         children: const [
                           Padding(padding: EdgeInsets.only(right: 16),
                             child: Text('Link', style: TextStyle(
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
                     children: const [
                       Text('From', style: TextStyle(
                           fontSize: 11, color: AppColor.subtitleColor),),
                       Text('Issue Date', style: TextStyle(
                           fontSize: 11, color: AppColor.subtitleColor),),
                     ],
                   ),
                   const SizedBox(height: 9,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: const [
                       Text('Talents Valley LLC', style: TextStyle(
                           fontSize: 13, fontWeight: FontWeight.bold),),
                       SizedBox(height: 5,),
                       Text('July 27 ,2022', style: TextStyle(
                           fontSize: 13, fontWeight: FontWeight.bold),),
                     ],
                   ),
                   const SizedBox(height: 5,),
                   const Text(
                     '30 North Gould St.\n Sheridan, Wyoming 82801 \n United States \n +1 307-217-6666',
                     style: TextStyle(
                         fontSize: 11, color: AppColor.subtitleColor),),
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
                           fontSize: 14, fontWeight: FontWeight.bold),),
                       Text('SAR 1000', style: TextStyle(
                           fontSize: 15, fontWeight: FontWeight.bold),)
                     ],
                   ),
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
