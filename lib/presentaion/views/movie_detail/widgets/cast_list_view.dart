import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/cast_entity.dart';
import 'cast_widget.dart';

class CastListView extends StatelessWidget {
  const CastListView({
    super.key,
    required this.castlist,
  });
  final List<CastEntity> castlist;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: castlist.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 185.h,
          width: 160.w,
          child: CastWidget(castEntity: castlist[index]),
        );
      },
    );
  }
}
