import 'package:file_picker/file_picker.dart';

class MediaService {
  MediaService() {}

  Future<PlatformFile?> pickImageFromLibrary() async {
    FilePickerResult? _result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      // allowedExtensions: ['jpeg', 'jpg', 'HEIC', 'pdf'],
    );
    if (_result != null) {
      return _result.files[0];
    }
    return null;
  }
}
