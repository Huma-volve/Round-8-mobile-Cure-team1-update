import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Specialty {
  final String name;
  final IconData icon;

  Specialty({required this.name, required this.icon});
  static List<Specialty> specialties = [
    Specialty(name: "Dentist", icon: Icons.medical_services),
    Specialty(name: "Cardiologist", icon: Icons.favorite),
    Specialty(name: "ENT", icon: Icons.hearing),
    Specialty(name: "Neurologist", icon: Icons.psychology),
    Specialty(name: "General Practitioner", icon: Icons.local_hospital),
    Specialty(name: "Ophthalmologist", icon: Icons.remove_red_eye),
    Specialty(name: "Pulmonologist", icon: Icons.air),
    Specialty(name: "Orthopedic", icon: Icons.accessibility_new),
    Specialty(name: "Gastroenterologist", icon: Icons.ramen_dining),
    Specialty(name: "Oncologist", icon: Icons.health_and_safety),
    Specialty(name: "Endocrinologist", icon: Icons.bloodtype),
    Specialty(name: "Psychiatrist", icon: Icons.psychology_outlined),
  ];
}
