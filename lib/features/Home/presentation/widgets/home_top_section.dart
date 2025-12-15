import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_route.dart';
import '../pages/favorite_page.dart';
class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          child: Icon(Icons.person),
        ),
        const SizedBox(width: 12),
         Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

               const Text("Welcome back, Rahma", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, size: 16),
                  SizedBox(height: 4),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push('/map');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      "129, El-Nasr Street, Cairo",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(color: Colors.black26, offset: Offset(0, 6), blurRadius: 6),
            ],
          ),
              child: InkWell(onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritePage()));
              },
                  child: const Icon(Icons.favorite_border,))),

        const SizedBox(
          width: 4,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: const [
              BoxShadow(color: Colors.black26, offset: Offset(0, 6), blurRadius: 6),
            ],
          ),
          child: InkWell(onTap: (){

          },
              child: const Icon(Icons.notifications_none_outlined,)),
        ),
      ],
    );
  }
}

