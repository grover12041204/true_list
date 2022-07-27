class alertsData {

List<Alerts> alerts;

alertsData({required this.alerts});

factory alertsData.fromJson(Map<String, dynamic> json) {
  var list = json['Alerts'] as List ;
  List<Alerts> alertlist = list.map((alerts) => Alerts.fromJson(alerts)).toList();
  return alertsData(
    alerts: alertlist,
  );
}
}

class Alerts{
  String category;
  String subcategory;
  String name;

  Alerts({
    required this.category, 
    required this.subcategory, 
    required this.name
  });

  factory Alerts.fromJson(Map<String, dynamic> json) {
    return new Alerts(
      category: json['category'],
      subcategory: json['sub_category'],
      name: json['name']
    );
  }
}
