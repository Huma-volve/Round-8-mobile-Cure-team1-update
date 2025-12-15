import 'package:flutter/material.dart';

class Favoritesappber extends StatefulWidget {
  const Favoritesappber({super.key});

  @override
  State<Favoritesappber> createState() => _FavoritesappberState();
}

class _FavoritesappberState extends State<Favoritesappber> {
  List<String> buttoms = ["ALL", "Unread", "Favorites "];

  int current_indx = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          buttoms.length,
          (index) => InkWell(
              onTap: () {
                setState(() {
                  current_indx = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: current_indx == index
                            ? const Color(0xff145DB8)
                            : Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        buttoms[index],
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: current_indx == index
                                ? Colors.white
                                : const Color(0xff99A2AB)),
                      ),
                    )),
              ))),
    );
  }
}
