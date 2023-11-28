import 'package:crud/class/model.dart';

class CardViewModel {
  List<stackbuildermodel> stackbuilderdataList = [];

  // Initialize the card data in the constructor
  CardViewModel() {
    // You can fetch data from APIs, databases, or any source here
    stackbuilderdataList = [
      stackbuildermodel(
          title: "BBQ",
          rating: "4.5",
          image:
              "https://myfoodbook.com.au/sites/default/files/styles/card_c_wd_wp/public/recipe_photo/Chicken_Pineapple_Summer_Skewers_web.jpg"),
      stackbuildermodel(
          title: "Noodles",
          rating: "5",
          image:
              "https://lh6.googleusercontent.com/DeHsaiZNjMgQ7KOMqu5BzSteUsVKf0obfPMqDtG16slGzEw397kdedJ9QB-6bZfMUQoLoYzvX0FLnzdJfKt8dxUOxd9J35c07xxJF6q1s6isM1YyiJOMj7nRERhbiXg8qQ96ZB6w=s0"),
      stackbuildermodel(
          title: "Fries",
          rating: "4.0",
          image:
              "https://upload.wikimedia.org/wikipedia/commons/8/83/French_Fries.JPG"),
      // Add more card data items as needed
    ];
  }
}
