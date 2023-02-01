import 'package:bookely_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookely_app/Features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookely_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(height: 16),
          Text('Search Result', style: Styles.titleStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultsListView()),
        ],
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // child: BookListViewItem(),
          child: Text('BookListViewItem()'),
        );
      },
    );
  }
}
