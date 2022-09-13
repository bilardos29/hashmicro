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
  MasterLocationModel(id: 1, longitude: -122.084, latitude: 37.4219983, address: "", active: true)
};
