import 'package:bookely_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookely_app/core/utils/app_router.dart';
import 'package:bookely_app/core/utils/widgets/custom_error_widget.dart';
import 'package:bookely_app/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () 
                    {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: state.books[index]);
                    },
                    child: CustomBookImage(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail??'',
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
