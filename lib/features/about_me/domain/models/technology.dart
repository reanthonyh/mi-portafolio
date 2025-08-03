import 'package:freezed_annotation/freezed_annotation.dart';

part 'technology.freezed.dart';

@freezed
abstract class Technology with _$Technology {
  const factory Technology({String? id, required String name, required String iconPath}) =
      _Technology;
}
