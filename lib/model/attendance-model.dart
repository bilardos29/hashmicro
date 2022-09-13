class AttendanceModel {
  double longitude;
  double latitude;
  String datetime;
  bool rejected;
  String note;

  AttendanceModel(
      {required this.longitude,
      required this.latitude,
      required this.datetime,
      this.rejected = false,
      this.note = ''});

  void clear(){
    longitude = 0;
    latitude = 0;
    datetime = '';
    rejected = false;
    note = '';
  }
}
