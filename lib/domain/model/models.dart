// onboarding models
class SliderObject {
  String title;
  String subTitle;
  String image;
  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

// login models
class Customer {
  String id;
  String name;
  int numOfNotif;
  Customer(this.id, this.name, this.numOfNotif);
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}

class Auth {
  Customer? customer;
  Contacts? contacts;
  Auth(this.customer, this.contacts);
}
