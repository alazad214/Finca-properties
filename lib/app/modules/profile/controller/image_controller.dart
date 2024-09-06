import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  var imagePath = ''.obs;
  var isImagePickerActive = false.obs; // Flag to track image picker status

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    if (isImagePickerActive.value) {
      return;
    }

    isImagePickerActive.value = true; // Set the flag to active
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imagePath.value = pickedFile.path;
      }
    } finally {
      isImagePickerActive.value = false; // Reset the flag once done
    }
  }
}
