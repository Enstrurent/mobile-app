import 'dart:developer';

import 'package:enstrurent/config/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        title: Text("orders".tr, style: Get.theme.appBarTheme.titleTextStyle),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
            itemCount: 3, itemBuilder: (context, index) => listItem(index)),
      ),
    );
  }

  Widget listItem(int a) => Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: EdgeInsets.all(10),

        child: Slidable(
          actionPane: SlidableScrollActionPane(),
          child: ListTile(
            onTap: () => log("Td"),
            tileColor: Themes.darkerBackground,
            subtitle: Text("Sipariş tarihi: 20 Nisan 2021 22.30"),
            title: Text("Durum: Sipariş Verildi"),
            leading: a % 2 == 0 ? Icon(Icons.shopping_bag) : null,
          ),
          secondaryActions: [
            IconSlideAction(
              caption: 'Ürünü önizle',
              color: Get.theme.primaryColor,
              icon: CupertinoIcons.search,
              onTap: null,
            ),
          ],
          actions: [
            IconSlideAction(
              caption: "Sipariş İptal",
              color: Get.theme.errorColor,
              icon: CupertinoIcons.delete,
              onTap: null,
            ),

          ],
        ),
      );

}
