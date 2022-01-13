import 'package:birthday_flutter/common/Validation.dart';
import 'package:birthday_flutter/providers/birthday_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBirthdayScreen extends StatefulWidget {
  static const routeName = "/AddBirthday";

  const AddBirthdayScreen({Key? key}) : super(key: key);
  @override
  State<AddBirthdayScreen> createState() => _AddBirthdayScreenState();
}

class _AddBirthdayScreenState extends State<AddBirthdayScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BirthdayList>(builder: (context, birthdayResponse, child) {
        String progressState;
        if (birthdayResponse.addResponse == ADD_BIRTHDAY_STATE.requesting) {
          progressState = "Birthday request running";
        } else if (birthdayResponse.addResponse == ADD_BIRTHDAY_STATE.success) {
          progressState = "Birthday added successfully";
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          dateController.clear();
        } else if (birthdayResponse.addResponse == ADD_BIRTHDAY_STATE.failed) {
          progressState = "Request failed";
        } else {
          progressState = "Add birthday detail";
        }
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            color: Colors.cyan,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(progressState),
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (!Validation.isNameValid(value.toString())) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter name", labelText: "Name"),
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (!Validation.isEmailValid(value.toString())) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter email", labelText: "Email"),
                  ),
                  TextFormField(
                    controller: phoneController,
                    validator: (value) {
                      if (!Validation.isPhoneValid(value.toString())) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter phone number",
                        labelText: "Phone Number"),
                  ),
                  TextFormField(
                    controller: dateController,
                    validator: (value) {
                      if (!Validation.isValidDate(value.toString())) {
                        return 'Please enter birthdate';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter birthdate(DD/MM/YYYY)",
                        labelText: "Birthdate"),
                  ),
                  TextButton(
                      child: const Text(
                        'Add Birthday',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<BirthdayList>(context, listen: false)
                              .addBirthday(
                                  "",
                                  nameController.text,
                                  emailController.text,
                                  phoneController.text,
                                  dateController.text);
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
