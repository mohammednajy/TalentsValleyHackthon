import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/utils/constant.dart';

class TransferAmount extends StatelessWidget {
  const TransferAmount(
      {super.key, required this.transferAmount, required this.fee});

  final String transferAmount;
  final String fee;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: const BorderSide(
            width: 1.5,
            color: Color(0xffE2E2E2), ////// change
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Transfer amount',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                  Text('$transferAmount \$',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 16)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Fee',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                Text(fee,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16)),
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('You\'ll get',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                Text('300 \$',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TransferredOffice extends StatelessWidget {
  const TransferredOffice({
    super.key,
    required this.officeName,
    required this.clientName,
    required this.officeDetails,
    required this.iconPath,
  });
  final String officeName;
  final String clientName;
  final String officeDetails;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 16, top: 5),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: const BorderSide(
            width: 1.5,
            color: AppColor.borderColor,
          )),
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 18,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CircleAvatar(
                    backgroundColor: AppColor.backgroundColor,
                    radius: 30,
                    child: Image.asset(iconPath)),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            clientName,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            '[$officeName]',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xff8C8C8C)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      officeDetails,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
