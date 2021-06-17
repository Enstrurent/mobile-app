part of '../products_view.dart';

class BottomInfoCard extends StatelessWidget {
  final String title;

  const BottomInfoCard({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        gradient: LinearGradient(
            colors: [
              Get.theme.primaryColor,
              Colors.transparent
            ],
            begin: FractionalOffset(0.4, 1.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.3, 1.0],
            tileMode: TileMode.clamp)),
    child: Padding(
      padding: const EdgeInsets.only(left: 6, top: 3, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600))
        ],
      ),
    ),
  );
}
