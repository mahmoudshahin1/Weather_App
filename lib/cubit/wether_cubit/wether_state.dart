import 'package:completwether/model/wethermodel.dart';

class WetherStates {}

class WetherInitialStaet extends WetherStates {}

class WetherSucessStaet extends WetherStates {
  final WetherModel wetherModel;

  WetherSucessStaet(this.wetherModel);
}

class WetherErrorStaet extends WetherStates {}
