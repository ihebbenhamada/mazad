import 'package:get/get.dart';

import 'en.dart';
import 'fr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'en_US': En().en, 'fr_FR': Fr().fr};
}
