class Activity {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final double lng;
  final double lat;

  const Activity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.lng,
    required this.lat
  });

  static const List<Activity> activities = [
    Activity(
      id: '1',
      title: 'Haouaria Pearl of Cap Bon',
      description:
          '''A charming coastal town located in the northeastern part of Tunisia. Nestled between the Mediterranean Sea and the lush greenery of the surrounding hills, Haouaria boasts stunning natural beauty and a rich cultural heritage.''',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIAWdOsC2gC-fMYGsJyal_MVbafFmOxmKXfcbRNLy0v4Ml02gPrYuEXV1ghxJ2jAsEMMg&usqp=CAU',
      price: 39.99,
      rating: 4,
      lng: 11.0441724,
      lat: 37.0852826
    ),
    Activity(
      id: '2',
      title: 'The Ribat Tower in Monastir',
      description:
          '''The Ribat Tower in Monastir is a majestic structure that stands proudly on the coastline of Monastir, Tunisia. Dating back to the 8th century, this ancient tower holds significant historical and cultural importance in the region.''',
      imageUrl:
          'https://fastly.4sqi.net/img/general/600x600/405675977_zB320PkH6CIuKphUBGDYRwFUOqbE43fUE2d2NHq4vp0.jpg',
      price: 39.99,
      rating: 4,
        lng: 10.8304655,
        lat: 35.7761179
    ),
    Activity(
      id: '3',
      title: 'Sidi Bou Said',
      description:
          '''Sidi Bou Said is a charming coastal village in Tunisia, known for its picturesque blue-and-white architecture and stunning views of the Mediterranean Sea. It's a popular tourist destination, offering a blend of history, culture, and breathtaking landscapes.''',
      imageUrl:
          'https://www.tunisienumerique.com/wp-content/uploads/2024/04/Sidi-1.jpg',
      price: 39.99,
      rating: 4,
        lng: 10.3328132,
        lat: 36.8715587
    ),
    Activity(
      id: '4',
      title: 'Kaser Al Jam',
      description:
          '''A historic fortress in Tunisia, renowned for its imposing architecture and strategic location overlooking the Mediterranean Sea. It served as a key defensive stronghold throughout history, offering panoramic views and insights into Tunisia's rich heritage.''',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP0vhl9nU0XXZc3pYDorS9ek3krrX63BhK9NGWVSrCkg&s',
      price: 39.99,
      rating: 4,
        lng: 10.7043254,
        lat:  35.2964821
    ),
    Activity(
      id: '5',
      title: 'Tataouine',
      description:
          '''A town in southern Tunisia, famous for its unique desert landscapes and traditional Berber architecture, including underground cave dwellings. ''',
      imageUrl:
          'https://tunisie.co/uploads/images/content/sud-080316-8.jpg',
      price: 39.99,
      rating: 4,
        lng: 10.4013052,
        lat: 32.9245763
    ),
    Activity(
      id: '6',
      title: 'Dar Chraiet Tozeur',
      description:
          '''Dar Chraiet is a historic monument located in Tozeur, Tunisia. This architectural gem dates back to the 19th century and is renowned for its traditional Tunisian design, featuring ornate geometric patterns and intricate woodwork. ''',
      imageUrl:
          'https://tunisie.co/uploads/images/content/Mus%C3%A9edarcherait-260919-3.jpg',
      price: 39.99,
      rating: 4,
        lng: 8.1180345,
        lat: 33.9131625
    ),
    Activity(
      id: '7',
      title: 'Chak Wak Tozeur',
      description:
          '''Chakwak is a traditional Tunisian structure located in Tozeur, Tunisia. It typically consists of a circular building with a distinctive conical roof made from palm fronds. ''',
      imageUrl:
          'https://media.safarway.com/content/549e23f7-ec74-40a4-b95f-89c08b1f19da_sm.jpg',
      price: 39.99,
      rating: 4,
        lng: 8.1440345,
        lat: 33.9115125
    ),
    Activity(
      id: '8',
      title: 'Bardo Museum',
      description:
          '''The Bardo Museum, situated in Tunis, Tunisia, is renowned for its extensive collection of ancient artifacts and treasures.  ''',
      imageUrl:
          'https://cdnfr.africanmanager.com/wp-content/uploads/2023/09/bardo.jpg',
      price: 39.99,
      rating: 4,
        lng: 10.1316342,
        lat: 36.8093547
    ),
    Activity(
      id: '9',
      title: 'Mosque of Uqba ibn Nefaa',
      description:
         '''The Great Mosque of Kairouan, also known as the Mosque of Uqba, is one of the most significant Islamic monuments in Tunisia and North Africa. Located in the city of Kairouan, it holds great historical and architectural importance, dating back to the 7th century.''',
      imageUrl:
          'https://i.pinimg.com/736x/22/a7/47/22a7479eca7265e09085d2351d7db9e3.jpg',
      price: 39.99,
      rating: 4,
        lng: 9.9517298,
        lat: 35.6813693
    ),
     Activity(
      id: '10',
      title: 'The Ruins of Dougga',
      description:
         '''Located in northern Tunisia, are among the most impressive Roman archaeological sites in North Africa and a UNESCO World Heritage Site. ''',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQMjw1SOVF7Iq-USulePP-PBLVIQkOTYXwDTKnGwpTkRqU6pfeX44eQ9UvqCmO3eupgtR8&usqp=CAU',
      price: 39.99,
      rating: 4,
         lng: 9.2135502,
         lat: 36.4232909
    ),
       
  ];
}
