import 'package:cure_team_1_update/features/Home/Doctor/Data/model/doctor_model.dart';
import 'package:flutter/material.dart';

import '../../Data/models/doctor_model.dart';

class DoctorItem extends StatefulWidget {
  final DoctorsModel doctor;
  const DoctorItem({super.key, required this.doctor});

  @override
  State<DoctorItem> createState() => _DoctorItemState();
}

class _DoctorItemState extends State<DoctorItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.doctor.image != null
                  ? "assets/images/84c1b0d51403f4f1d7e9bd56b7c704bb2bf992e9.jpg"
                  : "assets/images/48de4c7e2653d6ae038592eb93a42c2bd2b7b666.jpg",
              height: 60,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.doctor.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  "${widget.doctor.specialty.name} | ${widget.doctor.clinic}",
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                 Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 18),
                    Text(" 4.8", style: TextStyle(fontSize: 13)),
                    SizedBox(width: 12),
                Icon(Icons.access_time, size: 18),
                    Text(" 2h 30m", style: TextStyle(fontSize: 13)),
                  ],
                 ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
