import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

class ImageHandler {
  ImageHandlerListener _listener;
  BuildContext context;

  ImageHandler(this._listener, this.context);

  openGallery() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      cropImage(image);
    } catch (e) {
      if (e != null) {
        notifyError();
      }
    }
  }

  openCamera() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.camera);
      cropImage(image);
    } catch (e) {
      if (e != null) {
        notifyError();
      }
    }
  }

  Future cropImage(File image) async {
    if (image != null) {
      File croppedFile = await ImageCropper.cropImage(
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        sourcePath: image.path,
        maxHeight: 256,
        maxWidth: 256,
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editor',
          toolbarColor: Colors.white,
          toolbarWidgetColor: Theme.of(context).primaryColor,
          activeControlsWidgetColor: Theme.of(context).primaryColor,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      );
      _listener.userImage(croppedFile);
    } else {
      notifyError();
    }
  }

  void notifyError() {
    Flushbar(
      message: "Nenhuma imagem selecionada!",
      duration: Duration(seconds: 3),
      isDismissible: false,
    ).show(context);
  }
}

abstract class ImageHandlerListener {
  userImage(File _image);
}
