import 'package:flutter/cupertino.dart';

class AppBarImage extends StatelessWidget {
  const AppBarImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/apartment.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: 90, left: 20),
            color: Color(0x191970).withOpacity(.85),
          ),
        ),
      ),
    );
  }
}
