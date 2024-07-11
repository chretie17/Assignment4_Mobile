import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      title: 'Contact Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const HomePage(title: 'Contact Manager Home'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  List<Contact> _contacts = [];
  XFile? _imageFile;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts.toList();
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  void _changeLanguage(Locale locale) {
    MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          PopupMenuButton<Locale>(
            onSelected: _changeLanguage,
            itemBuilder: (BuildContext context) {
              return S.delegate.supportedLocales.map((Locale locale) {
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Text(locale.languageCode),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text("John Doe"),
              accountEmail: const Text("johndoe@example.com"),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(S.of(context).editProfilePicture),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.gallery);
                          },
                          child: Text(S.of(context).selectFromGallery),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.camera);
                          },
                          child: Text(S.of(context).takePicture),
                        ),
                      ],
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundImage: _imageFile == null
                      ? const NetworkImage("https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/14-512.png")
                      : FileImage(File(_imageFile!.path)) as ImageProvider,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: Text(S.of(context).getContacts),
              onTap: _getContacts,
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).counterMessage),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _getContacts,
              child: Text(S.of(context).getContacts),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_contacts[index].displayName ?? ''),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: S.of(context).increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
