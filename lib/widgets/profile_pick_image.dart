import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();

  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    // SnackBar(backgroundColor: Colors.blue, content: Text('Image selected'));
    return _file.readAsBytes();
  }
  // SnackBar(backgroundColor: Colors.blue, content: Text('No image is selected'));
  print('No image selected');
}
