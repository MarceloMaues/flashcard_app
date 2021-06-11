class DecksTest {
  List<String> info;

  DecksTest(this.info);

  DecksTest.fromJson(Map<String, dynamic> json)
      : info = json['Info'].cast<String>();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Info'] = this.info;
    return data;
  }
}
