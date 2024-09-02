import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Addcontroller3 extends GetxController {
  RxString fileName = 'No file chosen'.obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      fileName.value = pickedFile.name;
    }
  }
}
