import 'package:bookely_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:bookely_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookely_app/Features/home/data/repos/home_repo.dart';
import 'package:bookely_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookely_app/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookely_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookely_app/Features/home/presentation/views/home_view.dart';
import 'package:bookely_app/Features/search/presentation/views/search_view.dart';
import 'package:bookely_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kBookDetailsView = '/bookDetailsView';
  static const String kSearchView = '/SearchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const homeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            book: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
