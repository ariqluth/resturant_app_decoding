import '../model/resturant.dart';

class ResponseRestaurant {
  ResponseRestaurant({required this.restaurants});

  List<Restaurant> restaurants;

  factory ResponseRestaurant.fromJson(Map<String, dynamic> json) =>
      ResponseRestaurant(
          restaurants: List<Restaurant>.from(
              json['restaurants'].map((x) => Restaurant.fromJson(x))));
}
