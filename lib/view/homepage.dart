import 'package:completwether/cubit/wether_cubit/wether_cubit.dart';
import 'package:completwether/cubit/wether_cubit/wether_state.dart';
import 'package:completwether/model/wethermodel.dart';
import 'package:completwether/view/searchview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWether extends StatelessWidget {
  const HomePageWether({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'WetherApp',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchViewWether()));
                },
                icon: const Icon(Icons.search_rounded))
          ],
        ),
        body: BlocBuilder<WetherCubit, WetherStates>(
          builder: (context, state) {
            if (state is WetherInitialStaet) {
              return body();
            } else if (state is WetherSucessStaet) {
              return BodyInfo(
                wetherModel: state.wetherModel,
              );
            } else {
              return Text("oops this is error");
            }
          },
        ));
  }
}

class body extends StatelessWidget {
  const body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Wether Data is heare '),
      ),
    );
  }
}

class BodyInfo extends StatelessWidget {
  const BodyInfo({
    super.key,
    required this.wetherModel,
  });

  final WetherModel wetherModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            wetherModel.cityName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Data ${wetherModel.date}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 50,
                child: Image(image: NetworkImage(wetherModel.image ?? 'opps')),
              ),
              const SizedBox(
                width: 90,
              ),
              Text(
                '${wetherModel.temp}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text('maxtemp ${wetherModel.maxTemp}'),
                  SizedBox(
                    height: 5,
                  ),
                  Text('mintemp ${wetherModel.maxTemp} ')
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            ' ${wetherModel.conditional}',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
