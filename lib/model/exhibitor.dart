class Exhibitor {

  int _id;
  String _name;
  String _description;
  String _url;  

  Exhibitor(int id, String name, String description, String url) {
    this._id = id;
    this._name = name;
    this._description = description;
    this._url = url;
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

  String getUrl() {
    return this._url;
  }

}