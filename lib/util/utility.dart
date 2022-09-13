import 'dart:math';

class Utility {
  static double calculateDistance(
      {double startLatitude = 0,
      double endLatitude = 0,
      double startLongitude = 0,
      double endLongitude = 0}) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((endLatitude - startLatitude) * p) / 2 +
        cos(startLatitude * p) *
            cos(endLatitude * p) *
            (1 - cos((endLongitude - startLongitude) * p)) /
            2;

    //return in kilometer
    return 12742 * asin(sqrt(a));
  }
}
