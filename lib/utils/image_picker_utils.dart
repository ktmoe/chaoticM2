import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  static Future<File> getGalleryImage() async {
    final _imagePicker = Modular.get<ImagePicker>();
    final imageFile = await _imagePicker.getImage(source: ImageSource.gallery);
    if (imageFile != null) {
      return await _cropImage(imageFile);
    } else
      return null;
  }

  static Future<File> _cropImage(PickedFile imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        maxWidth: 1080,
        maxHeight: 1080,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      return croppedImage;
    } else {
      return null;
    }
  }
}
