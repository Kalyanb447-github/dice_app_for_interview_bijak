import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      // home: AuthExampleApp(),
    ),
  );
}

// /// The entry point of the application.
// ///
// /// Returns a [MaterialApp].
// class AuthExampleApp extends StatelessWidget {
//   const AuthExampleApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: LayoutBuilder(
//         builder: (context, constraines) {
//           return Row(
//             children: [
//               Visibility(
//                 visible: constraines.maxWidth >= 1200,
//                 child: Expanded(
//                   child: Container(
//                     height: double.infinity,
//                     color: Theme.of(context).colorScheme.primary,
//                     child: Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Firebase Auth Desktop',
//                             style: Theme.of(context).textTheme.headline4,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: constraines.maxWidth >= 1200
//                     ? constraines.maxWidth / 2
//                     : constraines.maxWidth,
//                 child: StreamBuilder<User?>(
//                   stream: FirebaseAuth.instance.authStateChanges(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       // return const ProfilePage();
//                       return Text('go to profile');
//                     }
//                     return Text('Login page');

//                     // return const AuthGate();
//                   },
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
