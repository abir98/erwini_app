

class languages {
late int id;
late String flag;
late String name;
late String languageCode;


languages(this.id,this.flag,this.languageCode,this.name);

static List<languages> languagelist() {
return <languages>[
  languages(1,"🇺🇸","en", "English"),
  languages(2,"🇸🇦","ar", "العربية")

];

}






}