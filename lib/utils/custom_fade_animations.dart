// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

Widget fade_animation(ImageProvider<Object>? image) {
  return Positioned.fill(
      child: ImageFade(
    image: image,
    height: 67,
    // duration: const Duration(milliseconds: 700),
    syncDuration: const Duration(milliseconds: 1800),
    alignment: Alignment.center,
    repeat: ImageRepeat.repeat,
    fit: BoxFit.fill,
    scale: 2,
  ));
}
