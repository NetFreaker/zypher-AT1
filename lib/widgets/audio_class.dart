
class AudioClass {
  int status;
  AudioBooks audioBooks;

  AudioClass({this.status, this.audioBooks});

  AudioClass.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    audioBooks = json['audioBooks'] != null
        ? new AudioBooks.fromJson(json['audioBooks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.audioBooks != null) {
      data['audioBooks'] = this.audioBooks.toJson();
    }
    return data;
  }
}

class AudioBooks {
  CurrentBook currentBook;
  List<SimilarBooks> similarBooks;

  AudioBooks({this.currentBook, this.similarBooks});

  AudioBooks.fromJson(Map<String, dynamic> json) {
    currentBook = json['currentBook'] != null
        ? new CurrentBook.fromJson(json['currentBook'])
        : null;
    if (json['similarBooks'] != null) {
      similarBooks = new List<SimilarBooks>();
      json['similarBooks'].forEach((v) {
        similarBooks.add(new SimilarBooks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentBook != null) {
      data['currentBook'] = this.currentBook.toJson();
    }
    if (this.similarBooks != null) {
      data['similarBooks'] = this.similarBooks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentBook {
  String sId;
  String duration;
  String audioSrcMp3;
  String audioSrcZip;
  String platformPid;
  String readBy;
  String productName;
  String authorName;
  String summary;
  String imageURL;

  CurrentBook(
      {this.sId,
      this.duration,
      this.audioSrcMp3,
      this.audioSrcZip,
      this.platformPid,
      this.readBy,
      this.productName,
      this.authorName,
      this.summary,
      this.imageURL});

  CurrentBook.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    duration = json['duration'];
    audioSrcMp3 = json['audioSrc_mp3'];
    audioSrcZip = json['audioSrc_zip'];
    platformPid = json['platform_pid'];
    readBy = json['readBy'];
    productName = json['productName'];
    authorName = json['authorName'];
    summary = json['summary'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['duration'] = this.duration;
    data['audioSrc_mp3'] = this.audioSrcMp3;
    data['audioSrc_zip'] = this.audioSrcZip;
    data['platform_pid'] = this.platformPid;
    data['readBy'] = this.readBy;
    data['productName'] = this.productName;
    data['authorName'] = this.authorName;
    data['summary'] = this.summary;
    data['imageURL'] = this.imageURL;
    return data;
  }
}

class SimilarBooks {
  String sId;
  String duration;
  String audioSrcMp3;
  String audioSrcZip;
  String platformPid;
  String readBy;
  String productName;
  String authorName;
  String summary;
  String imageURL;

  SimilarBooks(
      {this.sId,
      this.duration,
      this.audioSrcMp3,
      this.audioSrcZip,
      this.platformPid,
      this.readBy,
      this.productName,
      this.authorName,
      this.summary,
      this.imageURL});

  SimilarBooks.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    duration = json['duration'];
    audioSrcMp3 = json['audioSrc_mp3'];
    audioSrcZip = json['audioSrc_zip'];
    platformPid = json['platform_pid'];
    readBy = json['readBy'];
    productName = json['productName'];
    authorName = json['authorName'];
    summary = json['summary'];
    imageURL = json['imageURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['duration'] = this.duration;
    data['audioSrc_mp3'] = this.audioSrcMp3;
    data['audioSrc_zip'] = this.audioSrcZip;
    data['platform_pid'] = this.platformPid;
    data['readBy'] = this.readBy;
    data['productName'] = this.productName;
    data['authorName'] = this.authorName;
    data['summary'] = this.summary;
    data['imageURL'] = this.imageURL;
    return data;
  }
}