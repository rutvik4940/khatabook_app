class entryModel {
  String? name, qua, price, date, id, username,total;
  int? status;

  entryModel(
      {this.name,
      this.qua,
      this.price,
      this.date,
      this.id,
      this.status,
      this.username,this.total});

  factory entryModel.mapToModel(Map m1, String docId) {
    return entryModel(
      id: docId,
      name: m1['name'],
      qua: m1['qua'],
      price: m1['price'],
      date: m1['date'],
      status: m1['status'],
      username: m1['username'],
      total: m1['total']
    );
  }
}
