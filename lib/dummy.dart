// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:Avatarro/home_controller.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }




// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Music App',
//       home: MusicScreen(),
//     );
//   }
// }

// class MusicScreen extends StatelessWidget {
//   final MusicController _musicController = Get.put(MusicController());

//   // Future<void> _pickFile() async {
//   //   final result = await FilePicker.platform.pickFiles(
//   //     allowMultiple: true,
//   //     type: FileType.audio,
//   //   );

//   //   if (result != null) {
//   //     final path = result.files.single.path;
//   //     if (path != null) {
//   //       await _musicController.loadMusicFromFile(path);
//   //       _musicController.play();
//   //     }
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Music Player'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() => Text(
//                   'Current Song: ${_musicController.currentSong.value}',
//                   textAlign: TextAlign.center,
//                 )),
//             SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: _pickFile,
//             //   child: Text('Pick Music File'),
//             // ),
//             SizedBox(height: 20),
//             // Obx(() => _musicController.isPlaying.value
//             //     ? ElevatedButton(
//             //         onPressed: _musicController.pause,
//             //         child: Text('Pause'),
//             //       )
//             //     : ElevatedButton(
//             //         onPressed: _musicController.play,
//             //         child: Text('Play'),
//             //       )),
//             SizedBox(height: 20),
//             // ElevatedButton(
//             //   onPressed: _musicController.stop,
//             //   child: Text('Stop'),
//             // ),
//             ElevatedButton(
//                 onPressed: () {
//                   _makingPhoneCall() async {
//                     var url = Uri.parse("tel:7005398930");
//                     if (await canLaunchUrl(url)) {
//                       await launchUrl(url);
//                     } else {
//                       throw 'Could not launch $url';
//                     }
//                   }

//                   _makingPhoneCall();
//                 },
//                 child: Text("call")),
//             ElevatedButton(
//                 onPressed: () {
//                   void _sendSMS(String message, String recipient) async {
//                     final Uri smsUri = Uri(
//                       scheme: 'sms',
//                       path: recipient,
//                       queryParameters: <String, String>{'body': message},
//                     );

//                     if (await canLaunchUrl(smsUri)) {
//                       await launchUrl(smsUri);
//                     } else {
//                       throw 'Could not send SMS';
//                     }
//                   }

//                   _sendSMS('helloe', "7005398930");
//                 },
//                 child: Text("Message")),
//             ElevatedButton(
//                 onPressed: () {
//                   Share.share('www.google.com');
//                 },
//                 child: Text("Share"))
//           ],
//         ),
//       ),
//     );
//   }
// }
