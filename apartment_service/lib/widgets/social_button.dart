import 'package:apartment_service/screens/user_dashboard_view.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String name;
  final Icon icon;
  final Color background;

  const SocialButton({Key key, this.name, this.icon, this.background})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDashboard()),
        );
      },
      style: TextButton.styleFrom(
        side: BorderSide(
          width: 1,
          color: background,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: Colors.white,
        backgroundColor: background,
        minimumSize: Size(130, 40),
        alignment: Alignment.center,
      ),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5,
          ),
          Text(name)
        ],
      ),
    );
  }
}
