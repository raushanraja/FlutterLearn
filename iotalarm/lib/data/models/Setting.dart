class Setting {
  final String _globalUrl, _localUrl;
   
   Setting(this._globalUrl,this._localUrl);

   Setting.fromJson(Map<String,dynamic> json):
    _globalUrl = json['globalUrl'],
    _localUrl = json['localUrl'];

   Map<String,dynamic> toJson(){
     Map<String, String> map = {
         'globalUrl':_localUrl,
         'localUrl': _globalUrl
       };
          return map;
   }
  
}