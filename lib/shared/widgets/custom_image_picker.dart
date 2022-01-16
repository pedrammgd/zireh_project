import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'camera_gallery_dialog.dart';

typedef SendImageFunction = Function(File filePath);

//ignore: must_be_immutable
class CustomImagePicker extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function()? onPressed;
  File? file;
  final String? pathNetworkImage;
  final double height;
  final double width;

  final SendImageFunction? sendImageFunction;

  CustomImagePicker(
      {this.icon = Icons.photo_camera_outlined,
      this.title = 'انتخاب عکس',
      this.onPressed,
      this.file,
      this.pathNetworkImage,
      this.height = 119,
      this.width = 105,
      this.sendImageFunction});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: widget.onPressed ??
            () {
              CameraOrGalleryDialog.chooseCameraOrGallery(
                context,
                cameraButtonFunction: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                galleryButtonFunction: () {
                  _getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              );
            },
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: CustomPaint(
            painter: MyRectangle(),
            child:  filePathWidget(),

          ),
        ),
      ),
    );
  }

  Widget filePathWidget() {
    if (widget.file == null || widget.file!.path.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            widget.icon,
            color: Colors.black54,
            size: 40,
          ),
          Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
          // ),
        ],
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.file(
          widget.file!,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  Future _getImage(
    ImageSource imageSource,
  ) async {
    final pickFile = await ImagePicker().pickImage(source: imageSource);
    if (pickFile != null) {
      setState(() {
        widget.file = File(pickFile.path);

        widget.sendImageFunction == null
            ? () {}
            : widget.sendImageFunction!.call(widget.file!);
      });
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  SnackBar snackBar = const SnackBar(
    content: Text(
      'خطا در انتخاب عکس',
      style: TextStyle(fontFamily: 'IRANYekan'),
    ),
    backgroundColor: Colors.redAccent,
    padding: EdgeInsets.all(20),
  );
}

class MyRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Colors.black12;
    path.lineTo(size.width * 0.4, size.height);
    path.cubicTo(size.width * 0.29, size.height, size.width * 0.16,
        size.height * 0.98, size.width * 0.09, size.height * 0.97);
    path.cubicTo(size.width * 0.06, size.height * 0.97, size.width * 0.06,
        size.height * 0.96, size.width * 0.05, size.height * 0.96);
    path.cubicTo(size.width * 0.04, size.height * 0.95, size.width * 0.04,
        size.height * 0.94, size.width * 0.03, size.height * 0.91);
    path.cubicTo(size.width * 0.01, size.height * 0.77, 0, size.height * 0.61,
        0, size.height * 0.44);
    path.cubicTo(size.width * 0.01, size.height * 0.32, size.width * 0.02,
        size.height / 5, size.width * 0.03, size.height * 0.11);
    path.cubicTo(size.width * 0.04, size.height * 0.07, size.width * 0.04,
        size.height * 0.06, size.width * 0.05, size.height * 0.05);
    path.cubicTo(size.width * 0.06, size.height * 0.04, size.width * 0.07,
        size.height * 0.04, size.width * 0.11, size.height * 0.03);
    path.cubicTo(size.width * 0.34, -0.01, size.width * 0.66, -0.01,
        size.width * 0.89, size.height * 0.03);
    path.cubicTo(size.width * 0.94, size.height * 0.04, size.width * 0.95,
        size.height * 0.04, size.width * 0.96, size.height * 0.05);
    path.cubicTo(size.width * 0.96, size.height * 0.06, size.width * 0.97,
        size.height * 0.07, size.width * 0.97, size.height * 0.1);
    path.cubicTo(size.width, size.height * 0.32, size.width, size.height * 0.63,
        size.width * 0.98, size.height * 0.86);
    path.cubicTo(size.width * 0.97, size.height * 0.94, size.width * 0.96,
        size.height * 0.95, size.width * 0.95, size.height * 0.96);
    path.cubicTo(size.width * 0.92, size.height * 0.97, size.width * 0.77,
        size.height, size.width * 0.65, size.height);
    path.cubicTo(size.width * 0.59, size.height, size.width * 0.46, size.height,
        size.width * 0.4, size.height);
    path.cubicTo(size.width * 0.4, size.height, size.width * 0.4, size.height,
        size.width * 0.4, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
