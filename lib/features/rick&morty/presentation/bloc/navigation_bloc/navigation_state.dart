part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  const NavigationState({this.currentPage = 0});

  final int currentPage;

  NavigationState copyWith({int? currentPage}) =>
      NavigationState(currentPage: currentPage ?? this.currentPage);

  @override
  List<Object> get props => [currentPage];
}
