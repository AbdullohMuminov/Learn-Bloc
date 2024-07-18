import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/home_screen/api/product_repository.dart';
import '../api/product_model.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeLoadingDate>((event, emit) async {
      emit(HomeLoading());
      try {
        final result = await ProductRepository().getData();
        if (result.isNotEmpty) {
          emit(HomeSuccess(productList: result));
        } else {
          emit(HomeError());
        }
      } catch (e) {
        emit(HomeError());
      }
    });
  }
}
