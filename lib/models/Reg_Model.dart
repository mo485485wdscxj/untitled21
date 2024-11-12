class Re_Model
{
  String Token;
  Re_Model({required this.Token});
  factory Re_Model.fromjson(Map<String,dynamic>json)
  {
    return Re_Model(Token: json['token']);
  }
}