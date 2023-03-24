import 'package:flutter/material.dart';
import 'package:talents_valley_hackthon/view/shared/custom_appbar.dart';

import 'invoice/invoice_list_screen.dart';
import 'link/links_list_screen.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: const CustomAppBar(
        title: 'Invoices',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            SizedBox(
              height: 38,
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Text(
                    'Invoices',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Links',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  )
                ],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.white,
                ),
                labelPadding: const EdgeInsets.symmetric(vertical: 5),
              ),
            ),
            Expanded(
              child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    InvoiceListScreen(),
                    LinkListScreen(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}


