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
  MasterLocationModel(id: 1, longitude: 1, latitude: 1, address: "address", active: true)
};
