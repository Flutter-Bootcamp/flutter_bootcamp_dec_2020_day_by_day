import 'dart:convert';

List<Article> articlesFromJson(String str) =>
    List<Article>.from(json.decode(str).map((x) => Article.fromJson(x)));

class Article extends Comparable{
  String id;
  String name;
  String category;
  num price;
  String description;
  String brandName;
  String imgUrl;
  int sellerId;


  Article.fromJson(Map<String, dynamic> json){
    this.id = json['article_id'] ?? 'error';
    this.name = json['name'] ?? 'error';
    this.brandName = json['brand_name'] ?? 'error';
    this.category =json['category'] ?? 'error';
    this.price = json['price'] ?? 0;
    this.description = json['description'] ?? 'error';
    this.imgUrl = json['image'];
    this.sellerId = json['seller_id'] ?? 0;
  }

  Map<String, dynamic> toJson() => {
    'category': category,
    'name': name,
    'price': price,
    'description': description,
    'image': imgUrl,
    'brand_name': brandName,
    'seller_id': sellerId
  };


  @override
  int compareTo(other){
    if(this.price == null || price == null) {
      return null;
    }

    if(this.price < other.price) {
      return 1;
    }

    if(this.price > other.price) {
      return -1;
    }

    if(this.price == other.price) {
      return 0;
    }
    return null;
  }

  Article({this.id, this.category, this.name, this.price,
    this.description, this.imgUrl, this.brandName, this.sellerId});

  Article.dress1() {
    sellerId = 1;
    id = '1';
    name = 'Wedding dress 1';
    category = 'Tailoring';
    price = 8000;
    description = 'Tessuto in raso romano nobile';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLeKFf68-ant2VM5tVN1eYXTG3D0Zjn00hCA&usqp=CAU';
  }

  Article.dress2() {
    sellerId = 1;
    id = '2';
    sellerId = 1;
    name = 'Wedding dress 2';
    category = 'Tailoring';
    price = 2500;
    description = 'Tessuto in seta dallo Sri Lanka';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-17-683x1024.jpeg';
  }

  Article.dress3() {
    sellerId = 1;
    id = '3';
    sellerId = 1;
    name = 'Wedding dress 3';
    category = 'Tailoring';
    price = 10000;
    description = 'Tessuto iin seta straight outta Compton';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-cavioni-19-683x1024.jpeg';
  }


  Article.dress4() {
    sellerId = 1;
    id = '4';
    sellerId = 1;
    name = 'Evening dress 1';
    category = 'Tailoring';
    price = 5000;
    description = 'Tessuto verde zona Verdansk';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://dfocupmdlnlkc.cloudfront.net/original/54e40b32-dcd1-47be-bba2-d7a614a155c6_500x1500.jpg';
  }

  Article.dress5() {
    sellerId = 1;
    id = '5';
    sellerId = 1;
    name = 'Evening dress 2';
    category = 'Tailoring';
    price = 18000;
    description = 'Abito rosso modella che corre';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://www.aisopos.it/wp-content/uploads/2020/03/Rossella-Cavioni-5-724x1024.jpeg';
  }

  Article.dress6() {
    sellerId = 1;
    id = '6';
    sellerId = 1;
    name = 'Evening dress 3';
    category = 'Tailoring';
    price = 7000;
    description = 'Tessuto stra figo';
    brandName = "Cavioni Milano";
    imgUrl =
    'https://dfocupmdlnlkc.cloudfront.net/original/18770afe-00dd-459d-888f-19a98b30dfa1_500x1500.jpg';
  }


  Article.jewel1() {
    sellerId = 1;
    id = '7';
    sellerId = 2;
    name = 'Jewel 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49648133_10156355383433853_2472050302174363648_o.jpg?_nc_cat=104&ccb=2&_nc_sid=9267fe&_nc_ohc=_KY6R0SdlLsAX90JMt2&_nc_ht=scontent-mxp1-1.xx&oh=34d6f5513a0b1942640175938ccc0a7b&oe=5FE6F4A0';
  }

  Article.jewel2() {
    sellerId = 1;
    id = '8';
    sellerId = 2;
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/48374110_10156329843118853_1802988440061476864_o.jpg?_nc_cat=111&ccb=2&_nc_sid=9267fe&_nc_ohc=zTsvjf0BFUoAX8mXO_R&_nc_ht=scontent-mxp1-1.xx&oh=3f8cf09f5c4ba9ad9d4c36ff29cb532f&oe=5FE7658E';
  }

  Article.jewel3() {
    sellerId = 1;
    id = '9';
    sellerId = 2;
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49496913_10156341138163853_8288164683634966528_o.jpg?_nc_cat=111&ccb=2&_nc_sid=9267fe&_nc_ohc=2bRncQgXyWsAX9NLl6S&_nc_ht=scontent-mxp1-1.xx&oh=2dc405fb59e6e404a3b074641b36665b&oe=5FE8447B';
  }

  Article.jewel4() {
    sellerId = 1;
    id = '10';
    sellerId = 2;
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49132459_10156341142948853_6164876231385808896_o.jpg?_nc_cat=104&ccb=2&_nc_sid=9267fe&_nc_ohc=jqOCL6xrCKsAX9ol3E3&_nc_ht=scontent-mxp1-1.xx&oh=2902c12ff516ca941136de17f827d66b&oe=5FE592DC';
  }

  Article.jewel5() {
    sellerId = 1;
    id = '11';
    sellerId = 2;
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/49133152_10156341465663853_4980478324510818304_o.jpg?_nc_cat=102&ccb=2&_nc_sid=9267fe&_nc_ohc=uCNU3kQ6AngAX_DQv3R&_nc_ht=scontent-mxp1-1.xx&oh=8a4eceb5e04c11170df749e8ec9d4e73&oe=5FE5EDCF';
  }

  Article.jewel6() {
    sellerId = 1;
    id = '12';
    sellerId = 2;
    name = 'Gioiello 1';
    category = 'Jewelry';
    price = 7000;
    description = 'Descrizione 1';
    brandName = "Nove29 Jewelry";
    imgUrl =
    'https://scontent-mxp1-1.xx.fbcdn.net/v/t1.0-9/48420605_10156344357578853_2714284125501521920_o.jpg?_nc_cat=106&ccb=2&_nc_sid=9267fe&_nc_ohc=CczPz8DHz7kAX_s6WbO&_nc_ht=scontent-mxp1-1.xx&oh=8cc2e83d19cce4df4315b96bf4cff0a3&oe=5FE6A3A3';
  }
}