class listmyAds{
  String message;
  List<myAdsJson> li;

  listmyAds({
    required this.li, 
    required this.message});

  factory listmyAds.fromJson(Map<String, dynamic> json) {
    var list = json['MyAds'] as List;
    List<myAdsJson> myList = list.map((li) => myAdsJson.fromJson(li)).toList();
    return new listmyAds(
      message: json['message'],
      li: myList
      );
  }

}

class myAdsJson{
  String category;
  String subcategory;
  List<dynamic> title;
  String date;
  dynamic status;

  myAdsJson({
    required this.category, 
    required this.subcategory, 
    required this.title,
    required this.date,
    required this.status
  });

  factory myAdsJson.fromJson(Map<String, dynamic> json){
    return new myAdsJson(
      category: json['category'],
      subcategory: json['sub_category'],
      title: json['tile'],
      date: json['ad_promoted_date'],
      status: json['ad_status']
      
      );
    
  }
}