class Note {
  int? _id;
  late String _title;
  late String _date;
  late int _priority;
  String? _description;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  get id => _id;
  get title => _title;
  set title(value) => _title = value;
  get date => _date;
  set date(value) => _date = value;
  get priority => _priority;
  set priority(value) => _priority = value;
  get description => _description;
  set description(value) =>
      value.toString().length <= 255 ? _description = value : null;

//Convert a Note object to a Map opject
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['date'] = _date;
    map['priority'] = _priority;
    map['description'] = _description;

    return map;
  }

//Extract a Note object to a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _title = map['title'];
    _date = map['date'];
    _priority = map['priority'];
    _description = map['description'];
  }
}
