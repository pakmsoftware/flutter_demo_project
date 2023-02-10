import 'package:isar/isar.dart';

import '../collections/user.dart';

abstract class IsarRepository {
  late Future<Isar> isar;
  IsarRepository() {
    isar = _initIsarDb();
  }

  Future<Isar> _initIsarDb() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema],
        inspector: true,
      );
    }
    // else
    return Future.value(Isar.getInstance());
  }
}
