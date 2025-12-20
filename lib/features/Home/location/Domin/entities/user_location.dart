//الداتا اللي هتعامل بيها او هستخدمها بعد كدا
class UserLocation {
  final double lat;
  final double lng;
  final String? address;

  UserLocation({
    required this.lat,
    required this.lng,
     this.address,
  });
}
class UserAddress {
  final String street;
  final String city;
  final String country;

  const UserAddress({
    required this.street,
    required this.city,
    required this.country,
  });
}
