import 'package:flutter/material.dart';

import '../../Data/models/doctor_model.dart';

class DoctorItem extends StatefulWidget {
  final DoctorModel doctor;
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
      // /  margin: const EdgeInsets.symmetric(vertical: 8),
      // padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              widget.doctor.image,
              height: 70,
              width: 88,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.doctor.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                overflow: TextOverflow.ellipsis,
                "${widget.doctor.specialty} • ${widget.doctor.hospital}",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.doctor.rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                  const SizedBox(width: 9),
                  const Icon(
                    Icons.watch_later_outlined,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    widget.doctor.date.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          const Expanded(child: Icon(Icons.favorite))
        ],
      ),
    );
  }
}
