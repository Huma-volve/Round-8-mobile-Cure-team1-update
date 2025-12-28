import 'package:cure_team_1_update/core/style/colors/colors_light.dart';
import 'package:cure_team_1_update/core/utils/styles_text_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQExpansionTile extends StatefulWidget {
  final String title;
  final String content;

  const FAQExpansionTile({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<FAQExpansionTile> createState() => _FAQExpansionTileState();
}

class _FAQExpansionTileState extends State<FAQExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsLight.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          title: Text(widget.title,
              style: StyleTextHelper.textStyle20Regular(context).copyWith(
                fontFamily: 'georgia',
              )),
          trailing: Icon(
            isExpanded ? Icons.add : Icons.minimize,
          ),
          childrenPadding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 10.h),
          children: [
            const Divider(),
            Text(widget.content,
                style: StyleTextHelper.textStyle16Regular(context)),
          ],
        ),
      ),
    );
  }
}
