class TaskResponse {
  List<Document>? documents;
  String? nextPageToken;

  TaskResponse({this.documents, this.nextPageToken});

  TaskResponse.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Document>[];
      json['documents'].forEach((v) {
        documents!.add(Document.fromJson(v));
      });
    }
    nextPageToken = json['nextPageToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['nextPageToken'] = nextPageToken;
    return data;
  }
}

class Document {
  String? name;
  Fields? fields;
  String? createTime;
  String? updateTime;

  Document({this.name, this.fields, this.createTime, this.updateTime});

  Document.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fields =
    json['fields'] != null ? Fields.fromJson(json['fields']) : null;
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    data['createTime'] = createTime;
    data['updateTime'] = updateTime;
    return data;
  }
}

class Fields {
  Name? name;
  IsCompletedResponse? isCompleted;
  TaskDate? date;
  Name? categoryId;

  Fields({this.name, this.isCompleted, this.date, this.categoryId});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    isCompleted = json['isCompleted'] != null
        ? IsCompletedResponse.fromJson(json['isCompleted'])
        : null;
    date = json['date'] != null ? TaskDate.fromJson(json['date']) : null;
    categoryId = json['categoryId'] != null
        ? Name.fromJson(json['categoryId'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (isCompleted != null) {
      data['isCompleted'] = isCompleted!.toJson();
    }
    if (date != null) {
      data['date'] = date!.toJson();
    }
    if (categoryId != null) {
      data['categoryId'] = categoryId!.toJson();
    }
    return data;
  }
}

class Name {
  String? stringValue;

  Name({this.stringValue});

  Name.fromJson(Map<String, dynamic> json) {
    stringValue = json['stringValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stringValue'] = stringValue;
    return data;
  }
}

class IsCompletedResponse {
  bool? booleanValue;

  IsCompletedResponse({this.booleanValue});

  IsCompletedResponse.fromJson(Map<String, dynamic> json) {
    booleanValue = json['booleanValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booleanValue'] = booleanValue;
    return data;
  }
}

class TaskDate {
  String? integerValue;

  TaskDate({this.integerValue});

  TaskDate.fromJson(Map<String, dynamic> json) {
    integerValue = json['integerValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['integerValue'] = integerValue;
    return data;
  }
}
