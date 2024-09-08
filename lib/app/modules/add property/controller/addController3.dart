import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Addcontroller3 extends GetxController {
  /// Featured Image Functionality...
  RxString fileName = 'No file chosen'.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      fileName.value = pickedFile.name;
    }
  }


  var selectedFiles = [].obs;
  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      selectedFiles.addAll(result.files.where((file) => file.path != null));
    }
  }

  // Method to remove a selected file
  void removeFile(PlatformFile file) {
    selectedFiles.remove(file);
  }
}
