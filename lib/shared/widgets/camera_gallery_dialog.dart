import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraOrGalleryDialog {
  static final CameraOrGalleryDialog _instance =
      CameraOrGalleryDialog.internal();

  CameraOrGalleryDialog.internal();

  factory CameraOrGalleryDialog() => _instance;

  static void chooseCameraOrGallery(BuildContext context,
      { String? title, Function()? cameraButtonFunction,Function()? galleryButtonFunction,}) {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 400),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 70,
              margin: const EdgeInsets.only(bottom: 30, left: 50, right: 50),
              child: Material(
                color: Colors.white,
                elevation: 20,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: cameraButtonFunction,
                          // () =>
                          // _imagePicker.pickImage(source: ImageSource.camera),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.camera_alt_outlined, size: 35),
                          Text(
                            'دوربین',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: galleryButtonFunction,
                          // () =>
                          // _imagePicker.pickImage(source: ImageSource.gallery),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(
                            Icons.photo,
                            size: 35,
                          ),
                          Text(
                            'گالری',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return _buildNewTransition(context, anim1, anim2, child);
      },
    );
  }



}
Widget _buildNewTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    ) {
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeInOut,
      reverseCurve: Curves.easeOutCirc,
    ),
    child: child,
  );
}

