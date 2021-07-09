import 'dart:developer';
import 'dart:ui';

import 'package:enstrurent/config/themes.dart';
import 'package:enstrurent/models/order_base.dart';
import 'package:enstrurent/models/order_status.dart';
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

  Widget listItem(OrderBase order) {
    Widget blockedIconSlide =
        IconSlideAction(color: Themes.darkerBackground, icon: Icons.block);
    Widget listTile = ListTile(
      onTap: () => log("list tile onTap"),
      tileColor: Themes.darkerBackground,
      title: Text("status".tr +
          ": ${(order.order_status as OrderStatus).getStatusText}"),
      subtitle: Text(
          "order_date".tr +
              ": ${order.CreatedAt.getFormattedText}\n${_controller.getPriceText(order)}",
          maxLines: 2),
      leading: order is PurchaseOrder
          ? Icon(CupertinoIcons.cart_fill)
          : Icon(CupertinoIcons.cart),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: EdgeInsets.all(10),
      child: Visibility(
        visible: order.order_status != OrderStatus.CANCELED,
        replacement: ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 0.8, sigmaY: 0.8),
          child: listTile,
        ),
        child: Slidable(
          actionPane: SlidableScrollActionPane(),
          child: listTile,
          secondaryActions: [
            IconSlideAction(
              caption: 'preview_product'.tr,
              color: Get.theme.primaryColor,
              icon: CupertinoIcons.search,
              onTap: () async =>
                  await _controller.productPreview(order.product_id!),
            ),
            Visibility(
              visible: order.order_status != OrderStatus.COMPLETED,
              replacement: blockedIconSlide,
              child: IconSlideAction(
                caption: 'update_status'.tr,
                color: Get.theme.accentColor.withAlpha(200),
                icon: CupertinoIcons.right_chevron,
                onTap: () async => await _controller.updateOrderStatus(
                    orderID: order.id,
                    status: order.order_status!.numValue + 1),
              ),
            ),
          ],
          actions: [
            Visibility(
              visible: order.order_status != OrderStatus.ARRIVED,
              replacement: blockedIconSlide,
              child: IconSlideAction(
                caption: "cancel_order".tr,
                color: Get.theme.errorColor,
                icon: CupertinoIcons.delete,
                onTap: () async => await _controller.updateOrderStatus(
                    orderID: order.id, status: -1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DateTimeExtension on DateTime {
  String get getFormattedText =>
      "${this.day}/${this.month}/${this.year} ${this.hour}:${this.minute}";
}
