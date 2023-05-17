import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pfe_project/utils/constants.dart';
import 'package:pfe_project/utils/global.colors.dart';

class ContactsPages extends StatefulWidget {
  const ContactsPages({super.key});

  @override
  State<ContactsPages> createState() => _ContactsPagesState();
}

class _ContactsPagesState extends State<ContactsPages> {
  List<Contact> contacts = [];
  void initState() {
    super.initState();
    askPermissions();
  }

  Future<void> askPermissions() async {
    PermissionStatus permissionStatus = await getContactsPermission();
    if (permissionStatus == PermissionStatus.granted) {
      getAllContacts();
    } else {
      handInvaliedPermissions(permissionStatus);
    }
  }

  handInvaliedPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      dialogueBox(context, "Access to the contacts denied by the user");
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      dialogueBox(context, "the contact does not exist in this device");
    }
  }

  Future<PermissionStatus> getContactsPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  getAllContacts() async {
    List<Contact> _contacts = await ContactsService.getContacts();
    setState(() {
      contacts = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: contacts.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  Contact contact = contacts[index];
                  return ListTile(
                    title: Text(contact.displayName!),
                    //subtitle: Text(contact.phones!.elementAt(0)
                    //.value!)
                    leading:
                        contact.avatar != null && contact.avatar!.length > 0
                            ? CircleAvatar(
                                backgroundColor: GlobalColors.mainColor,
                                backgroundImage: MemoryImage(contact.avatar!),
                              )
                            : CircleAvatar(
                                backgroundColor: GlobalColors.mainColor,
                                child: Text(contact.initials()),
                              ),
                  );
                },
              ));
  }
}
