import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_nih/core/resources/app_router.dart';
import 'package:movie_nih/core/resources/app_routes.dart';
import 'package:movie_nih/core/resources/app_strings.dart';
import 'package:movie_nih/core/resources/app_values.dart';

/// A stateful widget that represents the main page of the application,
/// containing a [BottomNavigationBar] and handling back navigation logic.
class MainPage extends StatefulWidget {
  /// Creates a [MainPage] widget.
  ///
  /// The [child] parameter is required and represents the content
  /// to be displayed in the body of the page.
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// The content to be displayed in the body of the page.
  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        // Intercepts the back navigation to provide custom behavior.
        onWillPop: () async {
          final String location = GoRouterState.of(context).location;

          // Allow default behavior if on an authentication-related path.
          if (location.startsWith(authPaths)) {
            return true;
          }

          // Navigate to the movies page if not currently on it.
          if (!location.startsWith(moviesPath)) {
            _onItemTapped(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: AppStrings.movies,
            icon: Icon(
              Icons.movie_creation_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.shows,
            icon: Icon(
              Icons.tv_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.search,
            icon: Icon(
              Icons.search_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.watchlist,
            icon: Icon(
              Icons.bookmark_rounded,
              size: AppSize.s20,
            ),
          ),
          BottomNavigationBarItem(
            label: AppStrings.favorite,
            icon: Icon(
              Icons.favorite,
              size: AppSize.s20,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  /// Determines the selected index of the [BottomNavigationBar] based on the current route.
  ///
  /// Returns 0 for the movies path, 1 for TV shows, 2 for search, and 3 for the watchlist.
  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith(moviesPath)) {
      return 0;
    }
    if (location.startsWith(tvShowsPath)) {
      return 1;
    }
    if (location.startsWith(searchPath)) {
      return 2;
    }
    if (location.startsWith(watchlistPath)) {
      return 3;
    }
    return 0;
  }

  /// Handles navigation when a [BottomNavigationBar] item is tapped.
  ///
  /// Navigates to the appropriate route based on the [index] parameter.
  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.tvShowsRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.searchRoute);
        break;
      case 3:
        context.goNamed(AppRoutes.watchlistRoute);
        break;
    }
  }
}
