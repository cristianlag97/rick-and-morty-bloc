import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final KeyValueStorageService keyValueStorageService;
  NavigationBloc(this.keyValueStorageService) : super(const NavigationState()) {
    on<CurrentPageEnvet>((event, emit) {
      emit(state.copyWith(currentPage: event.currentPage));
    });
  }

  Future<void> handleCurrentPage(BuildContext context, currentPage) async {
    switch (currentPage) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
    add(CurrentPageEnvet(currentPage));
  }

  void handleReset() {
    add(const CurrentPageEnvet(0));
  }
}
