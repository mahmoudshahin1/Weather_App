import 'package:completwether/cubit/wether_cubit/wether_cubit.dart';
import 'package:completwether/cubit/wether_cubit/wether_state.dart';
import 'package:completwether/model/wethermodel.dart';
import 'package:completwether/service/servicewether.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewWether extends StatelessWidget {
  const SearchViewWether({super.key});

  @override
  Widget build(BuildContext context) {
    var wetherData = BlocProvider.of<WetherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Search From your city"),
      ),
      body: BlocBuilder<WetherCubit, WetherStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: TextField(
                onSubmitted: (value) async {
                  wetherData.getCurentWehter(cityName: value);

                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 32,
                    ),
                    labelText: "search",
                    suffixIcon: Icon(Icons.search),
                    hintText: "Enter city name ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ))),
              ),
            ),
          );
        },
      ),
    );
  }
}
