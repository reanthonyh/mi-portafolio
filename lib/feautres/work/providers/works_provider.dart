import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/models/models.dart';

part 'works_provider.g.dart';

@riverpod
List<Work> works(Ref ref) {
  return <Work>[
    Work(
      id: '002',
      title: 'QA Tester',
      companyName: 'NTT DATA',
      startDate: DateTime(2022),
      description: 'Decription',
    ),
  ];
}
