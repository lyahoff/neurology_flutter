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

Widget appBarText(String title) {
  return Text(
    title,
    style: const TextStyle(color: Colors.black),
  );
}

Widget h1Text(String title) {
  return Text(
    title,
    style: const TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}

Widget h2Text(String title) {
  return Text(
    title,
    style: const TextStyle(
        color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
  );
}

String adMob = 'ca-app-pub-5645343935667918/8274284370';
