class CategoryRequest {
  Fields? fields;

  CategoryRequest({this.fields});

  CategoryRequest.fromJson(Map<String, dynamic> json) {
    fields =
    json['fields'] != null ? Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fields != null) {
      data['fields'] = fields!.toJson();
    }
    return data;
  }
}

class Fields {
  Name? name;
  Name? color;

  Fields({this.name, this.color});

  Fields.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    color = json['color'] != null ? Name.fromJson(json['color']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (color != null) {
      data['color'] = color!.toJson();
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
