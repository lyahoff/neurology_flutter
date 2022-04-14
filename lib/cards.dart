import 'package:flutter/material.dart';

Widget customCard(String title, String img) {
  return Card(
      elevation: 2,
      child: Column(
        children: [
          const SizedBox(
            height: 3,
          ),
          ListTile(
            leading: Image.asset(img),
            title: Text(title),
          ),
          const SizedBox(
            height: 3,
          ),
        ],
      ));
}
