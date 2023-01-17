class TaskRequest {
  Field? field;

  TaskRequest({this.field});

  TaskRequest.fromJson(Map<String, dynamic> json) {
    field =
    json['fields'] != null ? new Field.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.field != null) {
      data['fields'] = this.field!.toJson();
    }
    return data;
  }
}

class Field {
  Date? date;
  CategoryId? categoryId;
  CategoryId? name;
  IsCompleted? isCompleted;

  Field({this.date, this.categoryId, this.name, this.isCompleted});

  Field.fromJson(Map<String, dynamic> json) {
    date = json['date'] != null ? Date.fromJson(json['date']) : null;
    categoryId = json['categoryId'] != null
        ? CategoryId.fromJson(json['categoryId'])
        : null;
    name = json['name'] != null ? CategoryId.fromJson(json['name']) : null;
    isCompleted = json['isCompleted'] != null
        ? IsCompleted.fromJson(json['isCompleted'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (categoryId != null) {
      data['categoryId'] = categoryId!.toJson();
    }
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.isCompleted != null) {
      data['isCompleted'] = this.isCompleted!.toJson();
    }
    return data;
  }
}

class Date {
  String? integerValue;

  Date({this.integerValue});

  Date.fromJson(Map<String, dynamic> json) {
    integerValue = json['integerValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['integerValue'] = this.integerValue;
    return data;
  }
}

class CategoryId {
  String? stringValue;

  CategoryId({this.stringValue});

  CategoryId.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stringValue'] = this.stringValue;
    return data;
  }
}

class IsCompleted {
  bool? booleanValue;

  IsCompleted({this.booleanValue});

  IsCompleted.fromJson(Map<String, dynamic> json) {
    booleanValue = json['booleanValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booleanValue'] = this.booleanValue;
    return data;
  }
}
