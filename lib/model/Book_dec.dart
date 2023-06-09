class Bookdec {
  String? error;
  String? title;
  String? subtitle;
  String? authors;
  String? publisher;
  String? language;
  String? isbn10;
  String? isbn13;
  String? pages;
  String? year;
  String? rating;
  String? desc;
  String? price;
  String? image;
  String? url;
  Pdf? pdf;
  int? quantity;

  Bookdec();

  Bookdec.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    title = json['title'];
    subtitle = json['subtitle'];
    authors = json['authors'];
    publisher = json['publisher'];
    language = json['language'];
    isbn10 = json['isbn10'];
    isbn13 = json['isbn13'];
    pages = json['pages'];
    year = json['year'];
    rating = json['rating'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
    url = json['url'];
    //pdf = json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['error'] = error;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['authors'] = authors;
    data['publisher'] = publisher;
    data['language'] = language;
    data['isbn10'] = isbn10;
    data['isbn13'] = isbn13;
    data['pages'] = pages;
    data['year'] = year;
    data['rating'] = rating;
    data['desc'] = desc;
    data['price'] = price;
    data['image'] = image;
    data['url'] = url;
    /*if (pdf != null) {
      data['pdf'] = pdf!.toJson();
    }*/
    return data;
  }
}

class Pdf {
  String? chapter2;
  String? chapter5;

  Pdf();

  Pdf.fromJson(Map<String, dynamic> json) {
    chapter2 = json['Chapter 2'];
    chapter5 = json['Chapter 5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['Chapter 2'] = chapter2;
    data['Chapter 5'] = chapter5;
    return data;
  }
}
