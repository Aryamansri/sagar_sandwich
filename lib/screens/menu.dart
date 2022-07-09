import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/data_provider.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.watch(userDataProvider);
    return Scaffold(
      body: ListView(
        children: [
          data.when(
            data: (data) {
              return Column(
                children: [
                  ...data.map(
                    (e) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 250,
                              child: Row(
                                children: [
                                  Text(
                                    e.productName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 125,
                                    child: Text(e.categoryName),
                                  ),
                                  SizedBox(
                                    width: 125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.size.toString(),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(e.price),
                                      ],
                                    ),
                                  ),

                                  // SizedBox(
                                  //   width: 125,
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.end,
                                  //     children: const [
                                  //       // IconButton(
                                  //       //   onPressed: () {},
                                  //       //   icon: const Icon(Icons.remove_circle),
                                  //       // ),
                                  //       // const Text('0'),
                                  //       // IconButton(
                                  //       //   onPressed: () {},
                                  //       //   icon: const Icon(Icons.add_circle),
                                  //       // ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Divider()
                      ],
                    ),
                  )
                ],
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_circle),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_circle),
        ),
        const Text('data')
      ],
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});











//  data.when(
//         data: (data) {
//           return Column(
//             children: [
//               ...data.map(
//                 (e) => Column(
//                   children: [
//                     // InkWell(
//                     //   // onTap: () => Navigator.of(context).push(
//                     //   //   MaterialPageRoute(
//                     //   //     builder: (context) => DetailPage(
//                     //   //       e: e,
//                     //   //     ),
//                     //   //   ),
//                     //   // ),
//                     //   child: ListTile(
//                     //     title: Text(e.name),
//                     //     subtitle: Text(e.size),
//                     //   ),
//                     // ),

//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           e.name.toString(),
//                           style: const TextStyle(fontSize: 25),
//                         ),
//                         Row(
//                           children: [
//                             Text(e.categoryId),
//                             const Spacer(),
//                             Text(e.price),
//                             const Spacer(),
//                             Text(e.quentity)
//                           ],
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//         error: (err, s) => Text(err.toString()),
//         loading: () => const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_5/model/allproduct.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart' as http;

// Future<List<Product>> fetchPost() async {
//   final response = await http
//       .get(Uri.parse('http://103.50.213.207:8080/restarunt/api/allproduct'));

//   if (response.statusCode == 200) {
//     var responseData = json.decode(response.body);

//     return (responseData['product'] as List)
//         .map((e) => Product.fromJson(e))
//         .toList();
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

// // final abcProvider = FutureProvider<List<Product>>((ref) async {
// //   String url = "http://103.50.213.207:8080/restarunt/api/allproduct";
// //   final response = await http
// //       .get(Uri.parse('http://103.50.213.207:8080/restarunt/api/allproduct'));
// //   var responseData = json.decode(response.body);
// //   return (responseData['product'] as List)
// //       .map((e) => Product.fromJson(e))
// //       .toList();
// // });

// //  Future<List<Product>> men() async {
// //      String url = "http://103.50.213.207:8080/restarunt/api/allproduct";
// //      final response = await http.get(Uri.parse('http://103.50.213.207:8080/restarunt/api/allproduct'));
// //        var responseData = json.decode(response.body);
// //        return (
// //          responseData['product'] as List
// //        ).map((e) => Product.fromJson(e)).toList()  ;
// //  }
// class Menu extends StatefulWidget {
//   const Menu({Key? key}) : super(key: key);

//   @override
//   State<Menu> createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   late Future<List<Product>> futurePost;
//   @override
//   void initState() {
//     super.initState();
//     futurePost = fetchPost();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Image.asset(
//                   'assets/x.avif',
//                   width: 50,
//                   height: 50,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   'Burger',
//                   style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           NewWidget(futurePost: futurePost),
//         ],
//       ),
//     );
//   }
// }

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     Key? key,
//     required this.futurePost,
//   }) : super(key: key);

//   final Future<List<Product>> futurePost;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Product>>(
//       future: futurePost,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Expanded(
//             child: ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (_, index) => Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         flex: 1,
//                         child: Text(
//                           snapshot.data![index].name,
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Row(
//                           children: [
//                             Text(snapshot.data![index].price.toString()),
//                           ],
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Row(
//                           children: [
//                             const Icon(Icons.remove_circle),
//                             Text(snapshot.data![index].quentity),
//                             const Icon(Icons.add_circle),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Row(
//                   //   children: [
//                   //     Expanded(
//                   //         child: Row(
//                   //       children: [
//                   //         Expanded(
//                   //           flex: 1,
//                   //           child: Text(
//                   //             snapshot.data![index].name,
//                   //           ),
//                   //         ),
//                   //         Expanded(
//                   //           flex: 1,
//                   //           child: Row(
//                   //             children: [
//                   //               Text(snapshot.data![index].price.toString()),
//                   //             ],
//                   //           ),
//                   //         ),
//                   //         Expanded(
//                   //           flex: 1,
//                   //           child: Row(
//                   //             children: [
//                   //               const Icon(Icons.remove_circle),
//                   //               Text(snapshot.data![index].quentity),
//                   //               const Icon(Icons.add_circle),
//                   //             ],
//                   //           ),
//                   //         ),
//                   //       ],
//                   //     ))
//                   //   ],
//                   // )
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class Burgermenu extends HookWidget {
//   const Burgermenu(
//     this.Burgers, {
//     Key? key,
//   }) : super(key: key);
//   // ignore: non_constant_identifier_names
//   final String Burgers;

//   @override
//   Widget build(BuildContext context) {
//     final count = useState<int>(0);
//     return Row(
//       children: [
//         Expanded(
//           flex: 3,
//           child: Row(
//             children: [
//               Text(Burgers),
//               const Spacer(),
//               const Text('99'),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   if (count.value > 0) {
//                     count.value--;
//                   } else {}
//                 },
//                 icon: const Icon(Icons.remove_circle),
//               ),
//               Text(count.value.toString()),
//               const Text('0'),
//               IconButton(
//                 onPressed: () {
//                   count.value++;
//                 },
//                 icon: const Icon(Icons.add_circle),
//               ),
//               const Divider()
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Menutile extends HookWidget {
//   const Menutile(
//     this.title, {
//     Key? key,
//   }) : super(key: key);

//   final String title;
//   @override
//   Widget build(BuildContext context) {

//     return Row(
//       children: [
//         Expanded(
//           flex: 4,
//           child: Row(
//             children: [
//               Text(title),
//               const Spacer(),
//               Padding(
//                 padding: EdgeInsets.only(left: 8.w),
//                 child: const Text('129'),
//               ),
//               const Spacer(),
//               const Text('109'),
//               const Spacer(),
//               IconButton(
//                 onPressed: () {
//                   if (count.value > 0) {
//                     count.value--;
//                   } else {}
//                 },
//                 icon: const Icon(Icons.remove_circle),
//               ),
//               Text(count.value.toString()),
//               IconButton(
//                 onPressed: () {
//                   count.value++;
//                 },
//                 icon: const Icon(Icons.add_circle),
//               ),
//             ],
//           ),
//         ),
//         const Divider()
//       ],
//     );
//   }
// }

//return: Scaffold(
//       body: ListView(
//         children: [
//           Row(
//             children: const [
//               Text(
//                 'MENU',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           Row(
//             children: const [
//               Text(
//                 'BURGER',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           //  Burgermenu(),
//           SizedBox(
//             height: 350.h,
//             child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return const Burgermenu('title');
//               },
//               itemCount: 10,
//             ),
//           ),

//           Row(
//             children: const [
//               Text(
//                 'SANDWICH',
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                 flex: 4,
//                 child: Row(
//                   children: const [
//                     Text(
//                       'Regular',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'Full',
//                       style:
//                           TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 350.h,
//             child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return const Menutile('title');
//               },
//               itemCount: 10,
//             ),
//           ),

//           //   SizedBox(
//           //   height: 350.h,
//           //   child: ListView.builder(
//           //     physics: const NeverScrollableScrollPhysics(),
//           //     itemBuilder: (context, index) {
//           //       return const Menutile('title');
//           //     },
//           //     itemCount: 10,
//           //   ),
//           // ),

//           SizedBox(
//             height: 350.h,
//             child: ListView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return const Menutile('title');
//               },
//               itemCount: 10,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
