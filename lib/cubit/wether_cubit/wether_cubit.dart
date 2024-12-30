import 'package:completwether/cubit/wether_cubit/wether_state.dart';
import 'package:completwether/model/wethermodel.dart';
import 'package:completwether/service/servicewether.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WetherCubit extends Cubit<WetherStates> {
  WetherCubit() : super(WetherInitialStaet());

  getCurentWehter({required String cityName}) async {
    try {
      WetherModel wetherModel =
          await Servicewether(Dio()).getCurrentWether(cityName: cityName);
      emit(WetherSucessStaet(wetherModel));
    } catch (e) {
      emit(WetherErrorStaet());
    }
  }
}
