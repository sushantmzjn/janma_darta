

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';


final autoValidateMode = StateNotifierProvider<AutoValidate, AutovalidateMode>((ref) => AutoValidate(AutovalidateMode.disabled));

class AutoValidate extends StateNotifier<AutovalidateMode>{
  AutoValidate(super.state);

  void autoValidate(){
    state = AutovalidateMode.onUserInteraction;
  }
}
//
// final loadingProvider = StateNotifierProvider<LoadingProvider, bool>((ref) => LoadingProvider(false));
//
// class LoadingProvider extends StateNotifier<bool>{
//   LoadingProvider(super.state);
//
//
//   void toggle(){
//     state = !state;
//   }
//
// }
//
//
// final connectivityProvider = Provider((ref) => Connectivity());
//
//
//
//
//
// final imageProvider = StateNotifierProvider.autoDispose<ImageProvider, XFile?>(
//         (ref) => ImageProvider(null));
//
//
// class ImageProvider extends StateNotifier<XFile?>{
//   ImageProvider(super.state);
//
//   void pickAnImage(bool isCamera) async{
//     final ImagePicker _picker = ImagePicker();
//     if(isCamera){
//       state = await _picker.pickImage(source: ImageSource.camera);
//     }else{
//       state = await _picker.pickImage(source: ImageSource.gallery);
//     }
//   }
//
// }
//
//
// final imageProvider1 = StateNotifierProvider.autoDispose<ImageProvider1, XFile?>(
//         (ref) => ImageProvider1(null));
//
//
// class ImageProvider1 extends StateNotifier<XFile?>{
//   ImageProvider1(super.state);
//
//   void pickAnImage(bool isCamera) async{
//     final ImagePicker _picker = ImagePicker();
//     if(isCamera){
//       state = await _picker.pickImage(source: ImageSource.camera);
//     }else{
//       state = await _picker.pickImage(source: ImageSource.gallery);
//     }
//   }
//
// }
//
//
//
// final passView = StateProvider.autoDispose<bool>((ref) => false);