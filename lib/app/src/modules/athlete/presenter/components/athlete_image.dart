import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'dart:convert';
import '../../../../../../prestars_exports.dart';

class AthleteImage extends StatelessWidget {
  final AthleteController controller;
  const AthleteImage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ReactiveValueListenableBuilder(
        formControlName: ConstantsForms.image,
        builder: (context, form, child) {
          final image = form.value as String?;
          if (image != null && image.isEmpty) {
            return InkWell(
              onTap: () => CaptureImage.call(form: controller.athleteForm),
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: ThemeService.colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text('Foto')),
              ),
            );
          } else {
            final bytes = base64.decode((image ?? '').split(',').last);
            return InkWell(
              onTap: () => CaptureImage.call(form: controller.athleteForm),
              child: Container(
                height: 160,
                width: 160,
                margin: const EdgeInsets.only(right: 12.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(bytes), fit: BoxFit.contain),
                    borderRadius: BorderRadius.circular(8)),
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.edit, color: Colors.white, size: 16),
                ),
              ),
            );
          }
        });
  }
}
