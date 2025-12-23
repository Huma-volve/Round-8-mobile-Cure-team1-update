import 'package:flutter/material.dart';

class Specialty {
  final String name;
  final IconData icon;
  final int id;

  Specialty({required this.name, required this.icon, required this.id});
  static List<Specialty> specialties = [
    Specialty(name: "Dentist", icon: Icons.medical_services, id: 7),
    Specialty(name: "Cardiologist", icon: Icons.favorite, id: 2),
    Specialty(name: "ENT", icon: Icons.hearing, id: 3),
    Specialty(name: "Neurologist", icon: Icons.psychology, id: 4),
    Specialty(name: "General Practitioner", icon: Icons.local_hospital, id: 1),
    Specialty(name: "Ophthalmologist", icon: Icons.remove_red_eye, id: 6),
    Specialty(name: "Pulmonologist", icon: Icons.air, id: 7),
    Specialty(name: "Dermatologist", icon: Icons.accessibility_new, id: 3),
    Specialty(name: "Gastroenterologist", icon: Icons.ramen_dining, id: 9),
    Specialty(name: "Oncologist", icon: Icons.health_and_safety, id: 10),
    Specialty(name: "Endocrinologist", icon: Icons.bloodtype, id: 11),
    Specialty(name: "Psychiatrist", icon: Icons.psychology_outlined, id: 12),
  ];
}
