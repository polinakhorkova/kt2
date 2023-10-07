import 'package:dio/dio.dart';
import 'models/getCars/getCars.dart';
import 'models/cars/cars.dart';

void main(List<String> arguments) async {
  Dio httpClient = Dio();
  String url = 'https://myfakeapi.com/api/cars/';
  var response = await httpClient.get(url);
  GetCars data = GetCars.fromJson(response.data);
  List<Cars> carsMassive = data.cars;
  int count = 0; //кол во машин
  double sum = 0.0; //цены
  for (var el in carsMassive) {
    // для каждого элемента
    if (el.car_color == "Yellow") {
      String str = el.price; //удалить $
      double price = double.parse(str.substring(1));
      sum += price;
      count++;
    }
  }
  double average = (sum / count);

  print(average);

}
