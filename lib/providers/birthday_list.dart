import 'package:birthday_flutter/model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

enum BIRTHDAYSTATE {
  fetching,
  success,
  failed,
}

class BirthdayList with ChangeNotifier {
  BIRTHDAYSTATE isAuth = BIRTHDAYSTATE.fetching;
  List<Person> persons = [];

  void getBirthdays() async {
    persons.clear();
    var uid = FirebaseAuth.instance.currentUser?.uid;
    DatabaseReference ref = FirebaseDatabase.instance.ref("$uid/people");
    DatabaseEvent event = await ref.once();
    if (event.snapshot.exists) {
      event.snapshot.children.forEach((element) {
        var val = element.value as Map;
        persons.add(Person(
            date: val['date'],
            email: val['email'],
            image: val['image'],
            name: val['name'],
            phone: val['phone']));
      });
    }

    notifyListeners();
  }
}
