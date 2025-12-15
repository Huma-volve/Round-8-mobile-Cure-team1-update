class DoctorModel{

  final String image;
  final String name;
  final String hospital;
  final double rating;
  final String specialty;
  final String date;
  final bool isFavorite;

  DoctorModel( {
    required this.image,
    required this.name,
    required this.hospital,
    required this.rating,
    required this.date,
    required this.isFavorite,
    required  this.specialty,
  });
}
List<DoctorModel> doctorsList = [
  DoctorModel(
    specialty: "Cardiologist",
    image: 'assets/images/Card (2).png',
    name: 'Dr. Ahmed Mohamed',
    hospital: 'Al Salam Hospital',
    rating: 4.5,
    date: '2:30 to 5 pm',
    isFavorite: true,
  ),
  DoctorModel(
    specialty: "Dentist",

    image: 'assets/images/Card (2).png',
    name: 'Dr. Sara Ali',
    hospital: 'Al Shifa Hospital',
    rating: 4.8,
    date: '2:30 to 5 pm',
    isFavorite: false,
  ),
  DoctorModel(
    specialty: "ENT",

    image: 'assets/images/Card (2).png',
    name: 'Dr. Mahmoud Hassan',
    hospital: 'Dar AlFouad Hospital',
    rating: 4.2,
    date: '2:30 to 5 pm',
    isFavorite: false,
  ),
  DoctorModel(
    specialty: "Cardiologist",

    image: 'assets/images/Card (2).png',
    name: 'Dr. Mona Abdallah',
    hospital: 'Nozha Hospital',
    rating: 4.9,
    date: '2:30 to 5 pm',
    isFavorite: true,
  ),
  DoctorModel(
    specialty: "Cardiologist",
    image: 'assets/images/Card (2).png',
    name: 'Dr. Khaled Youssef',
    hospital: 'Al Salama Hospital',
    rating: 4.0,
    date: '2:30 to 5 pm',
    isFavorite: false,
  ),
];
