import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'root_state.g.dart';

@riverpod
class RootState extends _$RootState {
  @override
  int build() => 0;

  void changeIndex(int index) => state = index;
}
