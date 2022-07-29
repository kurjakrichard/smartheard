class Note {
  int? _id;
  String _title;
  String _date;
  bool _priority;
  String? _description;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int? get id => _id;
  set id(int? value) => _id = value;
  get title => _title;
  set title(value) => _title = value;
  get date => _date;
  set date(value) => _date = value;
  get priority => _priority;
  set priority(value) => _priority = value;
  get description => _description;
  set description(value) => _description = value;

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
}
