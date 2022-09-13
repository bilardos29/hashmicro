class MasterLocationModel {
  int id;
  double longitude;
  double latitude;
  String address;
  bool active;

  MasterLocationModel(
      {required this.id,
      required this.longitude,
      required this.latitude,
      required this.address,
      required this.active});
}

var listTagging = {
  MasterLocationModel(id: 1, longitude: 106.376013, latitude: -6.341790, address: "", active: true)
};
