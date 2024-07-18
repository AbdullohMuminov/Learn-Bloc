import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/home_screen/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeLoadingDate());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            const CircularProgressIndicator();
          } else if (state is HomeSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: state.productList.length,
              itemBuilder: (_, __) {
                return Card(
                  color: Colors.white,
                  clipBehavior: Clip.hardEdge,
                  child: GridTile(
                    footer: GridTileBar(
                      title: Text(state.productList[__].title!),
                      backgroundColor: Colors.black,
                    ),
                    header: GridTileBar(
                      title:
                          Text("\$${state.productList[__].price.toString()}"),
                      backgroundColor: Colors.black45,
                    ),
                    child: Image.network(state.productList[__].image!),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
