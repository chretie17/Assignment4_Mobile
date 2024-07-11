import 'package:image_picker/image_picker.dart';

Future<void> pickImage(ImageSource source) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    // Use the pickedFile
    print('Image selected: ${pickedFile.path}');
  } else {
    print('No image selected');
  }
}

// Method to select image from gallery
Future<void> selectFromGallery() async {
  await pickImage(ImageSource.gallery);
}

// Method to take a new picture
Future<void> takePicture() async {
  await pickImage(ImageSource.camera);
}
