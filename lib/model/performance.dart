class Performance {

  int _id;
  String _name;
  String _description;

  Performance(int id, String name, String description) {
    this._id = id;
    this._name = name;
    this._description = description;
  }

  int getId() {
    return this._id;
  }

  String getName() {
    return this._name;
  }

  String getDescription() {
    return this._description;
  }

}