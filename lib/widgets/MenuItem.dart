import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget
{
  final IconData icon;
  final String title;
  final Function onClick;

  const MenuItem({super.key, required this.icon, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.black87),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black54),
      onTap: (){
        onClick();
      },
    );
  }
}