/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Root {
  String? name;
  String? ascenciondocumentnumber;
  String? ascenciondocumentdate;
  int? ascencionyear;
  String? photourl;
  String? birthdate;
  String? birthplace;
  String? deathdate;
  String? deathplace;
  String? burialplace;
  String? description;

  Root(
      {this.name,
      this.ascenciondocumentnumber,
      this.ascenciondocumentdate,
      this.ascencionyear,
      this.photourl,
      this.birthdate,
      this.birthplace,
      this.deathdate,
      this.deathplace,
      this.burialplace,
      this.description});

  Root.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    ascenciondocumentnumber = json['ascencion_document_number'];
    ascenciondocumentdate = json['ascencion_document_date'];
    ascencionyear = json['ascencion_year'];
    photourl = json['photo_url'];
    birthdate = json['birth_date'].toString();
    birthplace = json['birth_place'];
    deathdate = json['death_date'].toString();
    deathplace = json['death_place'];
    burialplace = json['burial_place'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['ascencion_document_number'] = ascenciondocumentnumber;
    data['ascencion_document_date'] = ascenciondocumentdate;
    data['ascencion_year'] = ascencionyear;
    data['photo_url'] = photourl;
    data['birth_date'] = birthdate;
    data['birth_place'] = birthplace;
    data['death_date'] = deathdate;
    data['death_place'] = deathplace;
    data['burial_place'] = burialplace;
    data['description'] = description;
    return data;
  }
}
