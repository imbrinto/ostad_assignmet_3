class ImageModel{
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  ImageModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

}