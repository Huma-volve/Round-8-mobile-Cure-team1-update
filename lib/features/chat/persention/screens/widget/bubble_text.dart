// import 'package:chatapp/const/const.dart';
// import 'package:chatapp/function/time.dart';
// import 'package:chatapp/model/message_model.dart';
// import 'package:flutter/material.dart';

// class BubbleText extends StatelessWidget {
//   final MessageModel message;
//   const BubbleText({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.only(
//           top: 10,
//           bottom: 10,
//         ),
//         decoration: const BoxDecoration(
//             color: kPrimaryColor,
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(28),
//                 bottomRight: Radius.circular(28))),
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Wrap(children: [
//             Text(
//               message.message,
//               textAlign: TextAlign.start,
//               style: const TextStyle(color: Colors.white, fontSize: 18),
//             ),
//             const Text(
//               "✔✔",
//               style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold),
//             ),
//             Text(
//               textAlign: TextAlign.start,
//               '${tiem(message.time)}Am',
//               style: const TextStyle(color: Colors.white),
//             )
//           ]),
//         ),
//       ),
//     );
//   }
// }
