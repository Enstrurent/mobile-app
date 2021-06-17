part of "../products_view.dart";

class ImageCard extends StatelessWidget {
  final imageURL;
  final bool isForRent;
  final bool isForSale;
  final double? salePrice;
  final double? rentalPrice;

  const ImageCard(
      {Key? key,
      required this.imageURL,
      this.isForRent = true,
      this.isForSale = false, this.salePrice, this.rentalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Card(
          child: Image.network(imageURL),
          elevation: 10,
          margin: EdgeInsets.zero,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                    visible: isForRent,
                    child: _badge(
                        "for_rent".tr + ": $rentalPrice₺", Get.theme.primaryColor.withAlpha(200))),
                Visibility(
                    visible: isForSale,
                    child:
                    _badge("for_sale".tr + ": $salePrice₺", Get.theme.accentColor.withAlpha(200)))
              ],
            ),

          ],
        )
      ],
    );
  }

  Widget _badge(String text, Color color) => Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: EdgeInsets.only(left: 5, top: 6),
        padding: EdgeInsets.only(top: 2, bottom: 2, right: 5, left: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
}
