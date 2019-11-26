import 'package:randombytes/randombytes.dart';

const UNMISTAKABLE_CHARS = "23456789ABCDEFGHJKLMNPQRSTWXYZabcdefghijkmnopqrstuvwxyz";
String randomId([int charsCount = 17]) {
  return _randomString(charsCount, UNMISTAKABLE_CHARS);
}

String _randomString(int charsCount, String alphabet) {
  final digits = <String>[];
  for (int i = 0; i < charsCount; i++) {
    digits.add(choice(alphabet));
  }
  return digits.join("");
}

String choice(String arrayOrString) {
  var index = (fraction() * arrayOrString.length).floor();
  return arrayOrString.substring(index, index + 1);
}

double fraction() {
  var numerator = int.parse(hexString(8), radix: 16);
  return numerator * 2.3283064365386963e-10;
}

String hexString(int digits) {
  final numBytes = (digits / 2).ceil();
  final bytes = randomBytes(numBytes);
  final result = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  // If the number of digits is odd, we'll have generated an extra 4 bits
  // of randomness, so we need to trim the last digit.
  return result.substring(0, digits);
}
