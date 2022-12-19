import 'package:flutter/material.dart';
import 'package:flutter_app/current_user.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {

  TextEditingController textControllerForFirstName = TextEditingController();
  TextEditingController textControllerForLastName = TextEditingController();

  CurrentUser currentUser = CurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(currentUser.user!.login),
              InkWell(
                child: Icon(Icons.edit),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                    child: Icon(Icons.exit_to_app)
                )
              )
            ],
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    width: 120,
                    height: 200,
                    child: Image.network(currentUser.user!.profileImage, fit: BoxFit.cover)
                )
            ),
            TextField(
              controller: textControllerForFirstName,
              decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder()
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            TextField(
              controller: textControllerForLastName,
              decoration: const InputDecoration(
                hintText: 'Last Name',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        )
      )
    );
  }
}
