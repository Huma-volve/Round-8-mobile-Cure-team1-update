// import 'package:chatapp/const/const.dart';
// import 'package:chatapp/model/message_model.dart';
// import 'package:flutter/material.dart';

// class BubbleFreind extends StatelessWidget {
//   final MessageModel message;
//   const BubbleFreind({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.only(
//           top: 10,
//           bottom: 10,
//         ),
//         decoration: BoxDecoration(
//             color: Colors.blue[700],
//             borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(28),
//                 bottomLeft: Radius.circular(28))),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Text(
//             message.message,
//             textAlign: TextAlign.start,
//             style: const TextStyle(color: Colors.white, fontSize: 18),
//           ),
//         ),
//       ),
//     );
//   }
// }
