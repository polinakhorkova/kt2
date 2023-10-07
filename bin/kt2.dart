import 'package:dio/dio.dart';
import 'models/getCars/getCars.dart';
import 'models/cars/cars.dart';

void main(List<String> arguments) async {
  Dio httpClient = Dio();
  String url = 'https://myfakeapi.com/api/cars/';
  var response = await httpClient.get(url);
  GetCars data = GetCars.fromJson(response.data);
  List<Cars> carsMassive = data.cars;
  int count = 0;
  double sum = 0.0;
  for (var el in carsMassive) {
    if (el.car_color == "Yellow" && el.availability == true) {
      String str = el.price;
      double price = double.parse(str.substring(1));
      sum += price;
      count++;
    }
  }
  print(count);
  print(sum);
}
