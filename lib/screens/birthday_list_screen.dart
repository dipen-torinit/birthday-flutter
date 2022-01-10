import 'dart:convert';

import 'package:birthday_flutter/providers/birthday_list.dart';
import 'package:birthday_flutter/screens/birthday_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BirthdayListScreen extends StatefulWidget {
  static const routeName = "/BirthdayList";

  const BirthdayListScreen({Key? key}) : super(key: key);
  @override
  State<BirthdayListScreen> createState() => _BirthdayListScreenState();
}

class _BirthdayListScreenState extends State<BirthdayListScreen> {
  @override
  void initState() {
    Provider.of<BirthdayList>(context, listen: false).getBirthdays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BirthdayList>(builder: (context, birthdayResponse, child) {
        if (birthdayResponse.persons.isNotEmpty) {
          return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: birthdayResponse.persons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, BirthdayDetailScreen.routeName,
                        arguments: birthdayResponse.persons[index])
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    color: Colors.amberAccent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (birthdayResponse.persons[index].image.isNotEmpty)
                          Image.memory(
                            const Base64Decoder()
                                .convert(birthdayResponse.persons[index].image),
                            width: 100,
                            height: 100,
                          )
                        else
                          const Icon(
                            Icons.person,
                            size: 100,
                          ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                'Name: ${birthdayResponse.persons[index].name}'),
                            Text(
                                'Email: ${birthdayResponse.persons[index].email}'),
                            Text(
                                'Phone: ${birthdayResponse.persons[index].phone}'),
                            Text(
                                'Birthdate: ${birthdayResponse.persons[index].date}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Wait",
                style: TextStyle(
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          );
        }
      }),
    );
  }
}
