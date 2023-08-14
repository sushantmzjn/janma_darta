import 'package:flutter_riverpod/flutter_riverpod.dart';

final birthData = StateNotifierProvider.autoDispose<BirthDataProvider, Map>((ref) => BirthDataProvider({}));

class BirthDataProvider extends StateNotifier<Map>{
  BirthDataProvider(super.state);

  void addBirth(data){
    state.addAll(data);
    print(state);
  }
}