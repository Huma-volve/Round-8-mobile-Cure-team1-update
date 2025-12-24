class DoctorModel {
  final int id;
  final String image;
  final String name;
  final String hospital;
  final double rating;
  final String specialty;
  final String date;
  final bool isFavorite;
  final double lat;
  final double lng;

  DoctorModel({
    required this.id,
    required this.image,
    required this.name,
    required this.hospital,
    required this.rating,
    required this.date,
    required this.isFavorite,
    required this.specialty,
    required this.lat,
    required this.lng,
  });
}

List<DoctorModel> doctorsList = [
  DoctorModel(
    id: 1,
    specialty: "Cardiologist",
    image: 'assets/images/f62102f2c9084a917a6a9ec004fbb686e7eabea4.jpg',
    name: 'Dr. Ahmed Mohamed',
    hospital: 'Al Salam Hospital',
    rating: 4.5,
    date: '2:30 to 5 pm',
    isFavorite: true,
    lat: 30.0444,
    lng: 31.2357,
  ),
  DoctorModel(
    id: 2,
    specialty: "Dentist",
    image: 'assets/images/f62102f2c9084a917a6a9ec004fbb686e7eabea4.jpg',
    name: 'Dr. Sara Ali',
    hospital: 'Al Shifa Hospital',
    rating: 4.8,
    date: '2:30 to 5 pm',
    isFavorite: false,
    lat: 30.0506,
    lng: 31.2333,
  ),
  DoctorModel(
    id: 3,
    specialty: "ENT",
    image: 'assets/images/f62102f2c9084a917a6a9ec004fbb686e7eabea4.jpg',
    name: 'Dr. Mahmoud Hassan',
    hospital: 'Dar AlFouad Hospital',
    rating: 4.2,
    date: '2:30 to 5 pm',
    isFavorite: false,
    lat: 30.0802,
    lng: 31.2985,
  ),
  DoctorModel(
    id: 4,
    specialty: "Cardiologist",
    image: 'assets/images/f62102f2c9084a917a6a9ec004fbb686e7eabea4.jpg',
    name: 'Dr. Mona Abdallah',
    hospital: 'Nozha Hospital',
    rating: 4.9,
    date: '2:30 to 5 pm',
    isFavorite: true,
    lat: 29.9866,
    lng: 31.2461,
  ),
  DoctorModel(
    id: 5,
    specialty: "Cardiologist",
    image: 'assets/images/f62102f2c9084a917a6a9ec004fbb686e7eabea4.jpg',
    name: 'Dr. Khaled Youssef',
    hospital: 'Al Salama Hospital',
    rating: 4.0,
    date: '2:30 to 5 pm',
    isFavorite: false,
    lat: 30.1007,
    lng: 31.2036,
  ),
];
