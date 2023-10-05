class WeatherModel {
  Response? response;

  WeatherModel({this.response});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.toJson();
    }
    return data;
  }
}

class Response {
  Header? header;
  Body? body;

  Response({this.header, this.body});

  Response.fromJson(Map<String, dynamic> json) {
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Header {
  String? resultCode;
  String? resultMsg;

  Header({this.resultCode, this.resultMsg});

  Header.fromJson(Map<String, dynamic> json) {
    resultCode = json['resultCode'];
    resultMsg = json['resultMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCode'] = resultCode;
    data['resultMsg'] = resultMsg;
    return data;
  }
}

class Body {
  String? dataType;
  Items? items;
  int? pageNo;
  int? numOfRows;
  int? totalCount;

  Body(
      {this.dataType,
      this.items,
      this.pageNo,
      this.numOfRows,
      this.totalCount});

  Body.fromJson(Map<String, dynamic> json) {
    dataType = json['dataType'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
    pageNo = json['pageNo'];
    numOfRows = json['numOfRows'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dataType'] = dataType;
    if (items != null) {
      data['items'] = items!.toJson();
    }
    data['pageNo'] = pageNo;
    data['numOfRows'] = numOfRows;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Items {
  List<Item>? item;

  Items({this.item});

  Items.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (item != null) {
      data['item'] = item!.map((v) => v).toList();
    }
    return data;
  }
}

class Item {
  String? baseDate;
  String? baseTime;
  String? category;
  String? fcstDate;
  String? fcstTime;
  String? fcstValue;
  int? nx;
  int? ny;

  Item(
      {this.baseDate,
      this.baseTime,
      this.category,
      this.fcstDate,
      this.fcstTime,
      this.fcstValue,
      this.nx,
      this.ny});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      baseDate: json['baseDate'],
      baseTime: json['baseDate'],
      fcstDate: json['baseDate'],
      fcstTime: json['baseDate'],
      category: json['baseDate'],
      fcstValue: json['baseDate'],
      nx: json['baseDate'],
      ny: json['baseDate'],
    );
  }
}
