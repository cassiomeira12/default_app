import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatefulWidget {
  final String url;
  final double size;

  ImageNetworkWidget({
    @required this.url,
    @required this.size,
  });

  @override
  _ImageNetworkWidgetState createState() => _ImageNetworkWidgetState();
}

class _ImageNetworkWidgetState extends State<ImageNetworkWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: CachedNetworkImage(
        useOldImageOnUrlChange: true,
        imageUrl: widget.url == null ? "" : widget.url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Container(
            margin: EdgeInsets.all(widget.size / 5),
            child: CircularProgressIndicator(value: downloadProgress.progress),
          );
        },
        errorWidget: (context, url, error) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage("assets/images/default_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
