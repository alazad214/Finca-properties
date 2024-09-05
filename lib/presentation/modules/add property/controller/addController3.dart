import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Addcontroller3 extends GetxController {
  ///Featured Image Functionality...
  RxString fileName = 'No file chosen'.obs;
  final ImagePicker _picker = ImagePicker();
  Future<void> pickFile() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      fileName.value = pickedFile.name;
    }
  }

  ///
  var imageList = <String>[].obs;

  // Function to pick image
  Future<void> pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageList[index] = image.name; // Store the image name at the index
    }
  }

  // Function to add another image picker container
  void addImageContainer() {
    imageList.add(""); // Add an empty string as a placeholder for the new image
  }

  // Function to remove a selected image container
  void removeImageContainer(int index) {
    imageList.removeAt(index); // Remove the container at the specified index
  }
}
