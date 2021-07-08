part of '../profile_view.dart';

Widget photoArea() => Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [_headerPhoto(), _avatar()],
        ),
      ),
    );

Widget _headerPhoto() => Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 40),
          height: 200,
          width: 400,
          child: Obx(() => CachedNetworkImage(
              imageUrl: _controller.renter!.header_pic_name!.isNotEmpty
                  ? _controller.headerPhotoURL.value
                  : "https://via.placeholder.com/728x300.png?text=header+picture",
              fit: BoxFit.fill,
              placeholder: (context, url) => LinearProgressIndicator(),
            ),
          ),
        ),
        Wrap(children: [
          Container(
            transform: Matrix4.translationValues(0.0, -7, 0.0),
            child: MaterialButton(
                elevation: 0,
                onPressed: () async {
                  await _controller.changePhoto(ProfilePhoto.headers);
                },
                colorBrightness: Brightness.light,
                color: Get.theme.primaryColor.withOpacity(0.8),
                child: Text(
                  "change".tr,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                )),
          ),
        ]),
        Positioned(top: 160, left: 0.1, child: _ratingBox()),
      ],
    );

Widget _avatar() => Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Obx(
          () => CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(
                _controller.renter!.profile_pic_name!.isNotEmpty
                    ? _controller.profilePhotoURL.value
                    : "https://via.placeholder.com/200x200.png?text=PP"),
          ),
        ),
        Positioned(
            width: 30,
            right: 70,
            top: 60,
            child: CircleButton(
              iconData: CupertinoIcons.repeat,
              onPressed: () async {
                await _controller.changePhoto(ProfilePhoto.profile);
              },
            )),
      ],
    );

Widget _ratingBox() => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
        color: Get.theme.accentColor.withOpacity(0.5),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Text(
            "${_controller.renter!.rating.toString()} ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Icon(
            CupertinoIcons.star_fill,
            size: 20,
            color: Get.theme.primaryColor.withOpacity(0.8),
          )
        ],
      ),
    );
