import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CommunityMaterialIcons.copyright,
              color: Colors.black,
            ),
            Text(
              "Nasu Apartment Service System",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
