class WetherModel {
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String conditional;

  WetherModel(
      {required this.cityName,
      required this.date,
      this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.conditional});

  factory WetherModel.fromJson(json) {
    return WetherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        conditional: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
}
