import 'package:birthday_flutter/model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

enum BIRTHDAYSTATE {
  fetching,
  success,
  failed,
}

enum ADD_BIRTHDAY_STATE {
  initial,
  requesting,
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
      for (var element in event.snapshot.children) {
        var val = element.value as Map;
        persons.add(Person(
            date: val['date'],
            email: val['email'],
            image: val['image'],
            name: val['name'],
            phone: val['phone']));
      }
    }

    notifyListeners();
  }

  ADD_BIRTHDAY_STATE addResponse = ADD_BIRTHDAY_STATE.initial;

  void addBirthday(image, name, email, phone, date) {
    addResponse = ADD_BIRTHDAY_STATE.requesting;
    notifyListeners();

    //Added dummy delay to check the state changes
    Future.delayed(const Duration(milliseconds: 1000), () async {
      try {
        var newItem = {
          "image": image,
          "name": name,
          "email": email,
          "phone": phone,
          "date": date
        };
        var uid = FirebaseAuth.instance.currentUser!.uid;
        var ref = FirebaseDatabase.instance.ref(uid + "/people");
        await ref.push().set(newItem);
        addResponse = ADD_BIRTHDAY_STATE.success;
      } catch (e) {
        addResponse = ADD_BIRTHDAY_STATE.failed;
      }
      notifyListeners();
    });
  }
}
