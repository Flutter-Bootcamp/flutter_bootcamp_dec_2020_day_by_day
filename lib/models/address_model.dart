class Address {
  String street;
  String city;
  String postalCode;
  String state;
  String region;

  Address({this.street, this.city, this.postalCode, this.state, this.region});

  Address.fromAddress(Address address){
    street = address.street;
    city = address.city;
    postalCode = address.postalCode;
    state = address.state;
    region = address.region;
  }

  Address.uno(){
    street = 'Via Mazzini 14';
    city = 'Vaprio d\'Adda';
    postalCode = '20069';
    state = 'MI';
    region = 'Lombardia';
  }

  Address.due(){
    street = 'Via Gioberti 9';
    city = 'Cassano d\'Adda';
    postalCode = '20062';
    state = 'MI';
    region = 'Lombardia';
  }
}