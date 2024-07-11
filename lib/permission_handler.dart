import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> getContacts() async {
  // Request permissions
  if (await Permission.contacts.request().isGranted) {
    // Get all contacts
    Iterable<Contact> contacts = await ContactsService.getContacts();
    // Use the contacts list
  }
}
