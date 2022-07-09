// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// import '../model/cart_model.dart';


// class Homepagesss extends HookWidget {
//   final int index;
//   const Homepagesss({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 2,
//               itemBuilder: (context, int index) {
//                 return ListTile(
//                   leading: const Icon(Icons.list_alt_outlined),
//                   trailing: Text(Product.product[index].name),
//                 );
//               },
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Text(Product.product[index].name),
//                 Text('${Product.product[index].price}'),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
