import 'dart:convert';
import 'dart:ffi';

import 'package:birthday_flutter/model/person.dart';
import 'package:flutter/material.dart';

class BirthdayDetailScreen extends StatefulWidget {
  static const routeName = "/BirthdayDetail";

  final Person person;

  const BirthdayDetailScreen({Key? key, required this.person})
      : super(key: key);

  @override
  _BirthdayDetailScreenState createState() => _BirthdayDetailScreenState();
}

class _BirthdayDetailScreenState extends State<BirthdayDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.amberAccent,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.person.image.isNotEmpty)
                Image.memory(
                  const Base64Decoder().convert(widget.person.image),
                  width: 150,
                  height: 150,
                )
              else
                const Icon(
                  Icons.person,
                  size: 100,
                ),
              Text('Name: ${widget.person.name}'),
              Text('Email: ${widget.person.email}'),
              Text('Phone: ${widget.person.phone}'),
              Text('Birthdate: ${widget.person.date}'),
            ],
          ),
        ),
      ),
    );
  }
}
