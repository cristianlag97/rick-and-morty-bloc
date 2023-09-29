part of 'navigation_bloc.dart';

sealed class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class CurrentPageEnvet extends NavigationEvent {
  final int currentPage;

  const CurrentPageEnvet(this.currentPage);

  @override
  List<Object> get props => [];
}
