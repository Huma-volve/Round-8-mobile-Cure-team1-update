import 'package:flutter/material.dart';
class BookingSection extends StatelessWidget {
  const BookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.indigo[500],
        borderRadius: BorderRadius.circular(17),
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10
        ),
        child: Row(
          children: [
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Trusted doctor on your schedule ",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),),
                  Text("Consult a doctor ",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                      ,fontWeight: FontWeight.bold
                  ),),
                  Text("— book today!",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                        ,fontWeight: FontWeight.bold
                    ),)
                ],
              ),
            ),
            Image.asset("assets/images/image 44.png",
            ),
          ],
        ),
      ),
    );
  }
}
