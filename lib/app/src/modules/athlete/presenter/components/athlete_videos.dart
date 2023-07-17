import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../../prestars_exports.dart';

class AthleteVideos extends StatelessWidget {
  final AthleteController controller;
  const AthleteVideos({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              SizedBox(
                height: 60,
                child: ReactiveValueListenableBuilder(
                    formControlName: ConstantsForms.videosUrl,
                    builder: (context, form, child) {
                      final videos = form.value as List<String?>;
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: videos.isEmpty ? 1 : videos.length + 1,
                          itemBuilder: (context, index) {
                            if (index == (videos.isEmpty ? 0 : videos.length)) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: InkWell(
                                  onTap: () => CaptureVideos.call(
                                      form: controller.athleteForm),
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: ThemeService.colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                ThemeService.colors.primary)),
                                    child: Center(
                                        child: Icon(Icons.add,
                                            color:
                                                ThemeService.colors.primary)),
                                  ),
                                ),
                              );
                            } else {
                              // final bytes = base64.decode(
                              //     (videos[index] ?? '').split(',').last);

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: InkWell(
                                  onTap: videos.length <= 2
                                      ? () => CaptureVideos.call(
                                          form: controller.athleteForm)
                                      : null,
                                  child: Container(
                                    height: 50,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        color: ThemeService.colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                ThemeService.colors.primary)),
                                    child: Center(
                                        child: Text('Vídeo ${index + 1}')),
                                  ),
                                ),
                              );
                            }
                          });
                    }),
              )
            ],
          ),
          UiErrorList(
            formControlName: ConstantsForms.videosUrl,
            hasFirstError: true,
            validationMessages: (control) => {
              'required': 'Esse campo precisa ser preenchido',
              'minLength': 'Você deve adicionar pelo menos uma imagem',
            },
          )
        ],
      ),
    );
  }
}
