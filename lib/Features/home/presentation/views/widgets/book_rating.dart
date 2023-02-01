import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating(
      {super.key, this.mainAxisAlignment = MainAxisAlignment.center, required this.rating, required this.ratingCount});

  final MainAxisAlignment mainAxisAlignment;
  final num rating ;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          size: 14,
          color: Colors.yellow,
        ),
        const SizedBox(width: 6.3),
        Text(
          rating.toString(),
          style: Styles.titleStyle16,
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(
            '($ratingCount)',
              style: Styles.titleStyle14.copyWith(
                fontWeight: FontWeight.w600,
              )),
        )
      ],
    );
  }
}
