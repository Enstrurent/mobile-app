import 'dart:developer';

import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/models/order_base.dart';
import 'package:enstrurent/models/purchase_order.dart';
import 'package:enstrurent/pages/renter/orders/orders_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class OrdersView extends StatelessWidget {
  final OrdersController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      appBar: AppBar(
        title: Text("orders".tr, style: Get.theme.appBarTheme.titleTextStyle),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _controller.getOrders,
        child: Obx(
          () => _controller.orders.isNotEmpty
              ? ListView.builder(
                  itemCount: _controller.orders.length,
                  itemBuilder: (context, index) =>
                      listItem(_controller.orders[index]))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Siparişiniz bulunmamaktadır."),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: IconButton(
                            icon: Icon(Icons.replay_sharp),
                            onPressed: _controller.getOrders),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget listItem(OrderBase order) => Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        padding: EdgeInsets.all(10),
        child: Slidable(
          actionPane: SlidableScrollActionPane(),
          child: ListTile(
            onTap: () => log("list tile onTap"),
            tileColor: Themes.darkerBackground,
            title: Text("Durum: ${order.order_status}"),
            subtitle: Text(
                "Sipariş tarihi: ${order.CreatedAt}\n${_controller.getPriceText(order)}",
                maxLines: 2),
            leading: order is PurchaseOrder ? Icon(CupertinoIcons.cart_fill) : Icon(CupertinoIcons.cart),
          ),
          secondaryActions: [
            IconSlideAction(
              caption: 'Ürünü önizle',
              color: Get.theme.primaryColor,
              icon: CupertinoIcons.search,
              onTap: () async =>
                  await _controller.productPreview(order.product_id!),
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
