import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/api_constants.dart';
import '../../../../domain/entities/cast_entity.dart';

class CastWidget extends StatelessWidget {
  const CastWidget({
    super.key,
    required this.castEntity,
  });

  final CastEntity castEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.w),
              ),
              child: CachedNetworkImage(
                height: 170.h,
                width: 160.w,
                imageUrl:
                    '${ApiConstants.baseImageUrl}${castEntity.posterPath}',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              castEntity.name,
              overflow: TextOverflow.fade,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.w,
              right: 8.w,
              bottom: 20.h,
            ),
            child: Text(
              castEntity.character,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    wordSpacing: 0.25,
                    letterSpacing: 0.25,
                    height: 1.5,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
