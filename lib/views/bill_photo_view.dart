import 'package:delivery/views/image_preview_dialog_view.dart';
import 'package:flutter/material.dart';

class BillPhotoImageView extends StatefulWidget {
  final BuildContext parentContext;
  final String imagePath;
  final double width, height;
  final bool isZoomming;
  final String? zoommingMessage;
  BillPhotoImageView({
    required this.parentContext,
    required this.imagePath,
    this.width = 70,
    this.height = 70,
    this.isZoomming = true,
    this.zoommingMessage,
  });

  @override
  _BillPhotoImageViewState createState() => _BillPhotoImageViewState();
}

class _BillPhotoImageViewState extends State<BillPhotoImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.imagePath),
          fit: BoxFit.fill,
        ),
        border: Border.all(color: const Color(0XFF115056)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: widget.isZoomming
            ? () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ImagePreviewDialogView();
                  },
                );
              }
            : null,
        child: widget.isZoomming
            ? const Center(
                child: Icon(
                  Icons.zoom_in,
                  color: Color(0XFF115056),
                  size: 35,
                ),
              )
            : null,
      ),
    );
  }
}
