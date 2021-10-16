// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:marketing_buzz/style/constants.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:marketing_buzz/views/home/cubits/cat_cubits.dart';
// import 'package:marketing_buzz/views/home/cubits/cat_states.dart';
// import 'package:marketing_buzz/widgets/loading_indicator.dart';
//
// import '../../../../locale_keys.dart';
//
// class CategoryListTile extends StatelessWidget {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final category = CategoryCubit.get(context);
//     return BlocBuilder<CategoryCubit , CategoryStates>(
//       bloc: category,
//       builder:(context , state)=> state is CategoryLoading? LoadingIndicator() : Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                   image: AssetImage(category.categoryModel.data.)
//                 )
//               ),
//               height: 100,
//               width: 100,
//
//             ),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     LocaleKeys.Category_ElectronicDevices.tr(),
//                     // overflow: TextOverflow.ellipsis,
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.arrow_forward_ios,
//                         size: 20,
//                         color: Colors.black,
//                       )),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }