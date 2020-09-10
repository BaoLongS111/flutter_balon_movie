///分类选项的模型
class CategoryModel {
  String type;
  String area;
  String hd;
  String size;
  String ma;
  String language;
  String paixu;

  CategoryModel(
      {this.type = "*",
      this.area = "*",
      this.hd = "*",
      this.size = "*",
      this.ma = "*",
      this.language = "*",
      this.paixu = "*"});
  void toZi() {
    print("all:$type,$area,$hd,$size,$ma,$language,$paixu");
  }
}
