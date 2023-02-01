import 'package:bookely_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/books_action.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookImage(
            imageUrl:
                book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          textAlign: TextAlign.center,
          book.volumeInfo.title!,
          style: Styles.titleStyle30.copyWith(fontWeight: FontWeight.bold),
          ),
          
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
              style: Styles.titleStyle18.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              )),
        ),
        const SizedBox(height: 18),
        BookRating(
          rating: book.volumeInfo.averageRating??0,
          ratingCount: book.volumeInfo.ratingsCount??0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        const BoxActionButton(),
      ],
    );
  }
}
