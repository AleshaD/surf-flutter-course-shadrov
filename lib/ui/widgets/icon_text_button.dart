import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String name;
  final bool isActive;
  const IconTextButton({
    required this.icon,
    required this.name,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    Color color = isActive ? Color(0xff3B3E5B) : Color.fromRGBO(124, 126, 146, 0.56);
    
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: color),
          ),
        )
      ],
    );
  }
}
