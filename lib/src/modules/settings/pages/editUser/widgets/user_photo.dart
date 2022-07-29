import 'package:crypto_currency/src/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class UserPhoto extends StatefulWidget {
  final String photoUrl;

  const UserPhoto({
    Key? key,
    required this.photoUrl,
  }) : super(key: key);

  @override
  State<UserPhoto> createState() => _UserPhotoState();
}

class _UserPhotoState extends State<UserPhoto> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return Stack(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: controller.image == null
              ? NetworkImage(
                  widget.photoUrl,
                )
              : MemoryImage(controller.image!) as ImageProvider,
        ),
        Positioned(
          bottom: -15,
          child: IconButton(
            onPressed: () {
              controller.addImage();
            },
            icon: SvgPicture.asset(
              'assets/icons/edit.svg',
              color: Colors.grey,
              width: 30,
            ),
          ),
        )
      ],
    );
  }
}
