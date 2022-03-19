class NewArrival {
  final price;
  final name;
  final id;
  final image;
  final desc;
  final mrp;
  NewArrival(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.desc,
      required this.mrp});
}

class ProductOfProducts {
  final id;
  final name;
  final image;
  final List<NewArrival> product;

  ProductOfProducts(
      {required this.id,
      required this.name,
      required this.image,
      required this.product});
}

//items cart
class EItems {
  final id;
  final img;
  final name;
  final price;

  EItems({required this.id,required this.img,required this.name,required this.price}); 
}

List<NewArrival> phones = [
  NewArrival(
    id: 1,
    name: 'Realme C35',
    mrp: 14000.00,
    price: 11999.00,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc:
        'Unisoc T616 Processor \t 4 GB RAM \n50 MP + 2 MP + 0.3 MP Triple Rear Camer\t64 GB Storage\nAndroid v11 OS',
  ),
  NewArrival(
    id: 2,
    name: 'Vivo T1',
    mrp: 17000.00,
    price: 15990.0,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 3,
    name: 'SAMSUNG',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 4,
    name: 'SAMSUNG',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 5,
    name: 'SAMSUNG',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 6,
    name: 'SAMSUNG',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
];
List<NewArrival> chargers = [
  NewArrival(
    id: 1,
    name: 'CHARGER',
    mrp: 17000.00,
    price: 15000.0,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 2,
    name: 'CHARGER',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 3,
    name: 'CHARGER',
    price: 15000.0,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 4,
    name: 'CHARGER',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 5,
    name: 'CHARGER',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 6,
    name: 'CHARGER',
    mrp: 17000.00,
    price: 15000,
    image: [
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
];
List<NewArrival> covers = [
  NewArrival(
    id: 1,
    name: 'COVER',
    mrp: 17000.00,
    price: 15000.0,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 2,
    name: 'COVER',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 3,
    name: 'COVER',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 4,
    name: 'COVER',
    mrp: 17000.00,
    price: 150,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 5,
    mrp: 17000.00,
    name: 'COVER',
    price: 150.0,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 6,
    name: 'COVER',
    mrp: 17000.00,
    price: 150,
    image: [
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
];
List<NewArrival> watches = [
  NewArrival(
    id: 1,
    mrp: 17000.00,
    name: 'Digital Watches',
    price: 15000.0,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      // 'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 2,
    mrp: 17000.00,
    name: 'Digital Watches',
    price: 15000,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      // 'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 3,
    mrp: 17000.00,
    name: 'Digital Watches',
    price: 15000,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      // 'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 4,
    name: 'Digital Watches',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      // 'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 5,
    name: 'Digital Watches',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
  NewArrival(
    id: 6,
    name: 'Digital Watches',
    price: 15000,
    mrp: 17000.00,
    image: [
      'assets/images/manwoman/watches.jpeg',
      'assets/images/manwoman/realmec35.jpg',
      'assets/images/manwoman/charger.jpg',
      'assets/images/manwoman/cover.jpg',
      'assets/images/manwoman/realmec35.jpg',
    ],
    desc: 'Its Good',
  ),
];
// products of products
List<ProductOfProducts> otherstuffs = [
  ProductOfProducts(
    id: 1,
    name: "Phones",
    image: 'assets/images/manwoman/realmec35.jpg',
    product: phones,
  ),
  ProductOfProducts(
    id: 2,
    name: "Chargers",
    image: 'assets/images/manwoman/charger.jpg',
    product: chargers,
  ),
  ProductOfProducts(
    id: 3,
    name: "Watches",
    image: 'assets/images/manwoman/watches.jpeg',
    product: watches,
  ),
  ProductOfProducts(
    id: 4,
    name: "Covers",
    image: 'assets/images/manwoman/cover.jpg',
    product: covers,
  ),
  ProductOfProducts(
    id: 5,
    name: "Chargers",
    image: 'assets/images/manwoman/charger.jpg',
    product: chargers,
  ),
];
List<ProductOfProducts> coverpage = [
  ProductOfProducts(
    id: 1,
    name: " Watches",
    image: 'assets/images/manwoman/watches.jpeg',
    product: watches,
  ),
  ProductOfProducts(
    id: 2,
    name: "Phones",
    image: 'assets/images/manwoman/realmec35.jpg',
    product: phones,
  ),
  ProductOfProducts(
    id: 3,
    name: "Chargers",
    image: 'assets/images/manwoman/charger.jpg',
    product: chargers,
  ),
  ProductOfProducts(
    id: 4,
    name: "Covers ",
    image: 'assets/images/manwoman/cover.jpg',
    product: covers,
  ),
  ProductOfProducts(
    id: 5,
    name: "Phones",
    image: 'assets/images/manwoman/realmec35.jpg',
    product: phones,
  ),
];
