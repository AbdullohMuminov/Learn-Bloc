part of 'home_bloc.dart';

// @immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState{}

class HomeSuccess extends HomeState{

  List<ProductModel> productList;
  HomeSuccess({required this.productList});

}

class HomeError extends HomeState{}