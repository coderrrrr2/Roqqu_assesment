import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarState {
  final int currentIndex;
  final bool isNavbarShown;

  const NavBarState({this.currentIndex = 0, this.isNavbarShown = true});

  /// Creates a copy of the state with optional changes.
  NavBarState copyWith({int? currentIndex, bool? isNavbarShown}) {
    return NavBarState(
      currentIndex: currentIndex ?? this.currentIndex,
      isNavbarShown: isNavbarShown ?? this.isNavbarShown,
    );
  }
}

class NavBarViewmodel extends StateNotifier<NavBarState> {
  NavBarViewmodel() : super(const NavBarState());

  void updateIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }

  void toggleNavbarVisibility({required bool isShown}) {
    state = state.copyWith(isNavbarShown: isShown);
  }

  void hideNavBar() {
    if (state.isNavbarShown) {
      state = state.copyWith(isNavbarShown: false);
    }
  }

  void showNavBar() {
    if (!state.isNavbarShown) {
      state = state.copyWith(isNavbarShown: true);
    }
  }
}

final navBarProvider = StateNotifierProvider<NavBarViewmodel, NavBarState>((
  ref,
) {
  return NavBarViewmodel();
});
