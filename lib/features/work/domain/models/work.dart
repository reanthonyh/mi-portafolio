import 'package:freezed_annotation/freezed_annotation.dart';

part 'work.freezed.dart';

@freezed
abstract class Work with _$Work {
  const factory Work({
    String? id,
    required String title,
    required String description,
    required DateTime startDate,
    DateTime? endDate,
    required String companyName,
  }) = _Work;
}
