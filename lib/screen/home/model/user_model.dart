class userModel {
  String? name, number, address, area, pincode, city, state, id;

  userModel(
      {this.name,
      this.number,
      this.address,
      this.area,
      this.pincode,
      this.city,
      this.state,
      this.id});

  factory userModel.mapToModel(Map m1, String docId) {
    return userModel(
        id: docId,
        address: m1['address'],
        city: m1['city'],
        area: m1['area'],
        name: m1['name'],
        number: m1['number'],
        pincode: m1['pincode'],
        state: m1['state']);
  }
}
