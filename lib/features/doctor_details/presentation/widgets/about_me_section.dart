import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/style/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AboutMeSection extends StatefulWidget {
  final String? aboutMe;
  const AboutMeSection({
    super.key,
    this.aboutMe,
  });

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  static const int _maxPreviewLength = 120;
  bool fullText = false;

  @override
  Widget build(BuildContext context) {
    final text = (widget.aboutMe ?? '').trim();
    final hasContent = text.isNotEmpty;
    final preview = hasContent && text.length > _maxPreviewLength
        ? '${text.substring(0, _maxPreviewLength)}...'
        : text;
    final showReadMore = hasContent && text.length > _maxPreviewLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About me',
          style: AppTextStyles.georgiaRegular20(context),
        ),
        Wrap(
          children: [
            Text(
              hasContent ? (fullText ? text : preview) : 'No description yet.',
              style: AppTextStyles.georgiaRegular14(context)
                  .copyWith(color: ColorsLight.blueGray),
            ),
            if (showReadMore && !fullText)
              GestureDetector(
                onTap: () {
                  setState(() {
                    fullText = true;
                  });
                },
                child: Text(
                  ' Read more',
                  style: AppTextStyles.georgiaRegular14(context)
                      .copyWith(color: ColorsLight.royalBlue),
                ),
              )
          ],
        )
      ],
    );
  }
}
