import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(TamanNasionalApp());
}

class TamanNasionalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taman Nasional Indonesia',
      theme: ThemeData(
        primarySwatch: Colors.green,
          ),
      home: TamanNasionalList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TamanNasional {
  final String name;
  final String description;
  final List<String> imageUrls;
  final String category;

  TamanNasional({
    required this.name,
    required this.description,
    required this.imageUrls,
    required this.category,
  });
}

final List<TamanNasional> tamanNasionalList = [
  TamanNasional(
    name: 'Taman Nasional Komodo',
    description:
        'Taman Nasional Komodo adalah kawasan konservasi yang terletak di Kepulauan Nusa Tenggara, Indonesia yang didirikan pada tahun 1980.',
    imageUrls: [
      'https://asset.kompas.com/crops/eIP2s99xXyYl2dhwW9hDQ6QxisY=/0x0:780x520/750x500/data/photo/2019/09/26/5d8c64544d656.jpg',
      'https://www.mongabay.co.id/wp-content/uploads/2022/07/5-komodo-ntt.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49bHZSZe-61vgGOPXw7uOGNQ0Ge7y-NH9-sCTphbP0VB_L9oE9yJMAsu7hLWazIv7P_A&usqp=CAU',
    ],
    category: 'Laut',
  ),
  TamanNasional(
    name: 'Taman Nasional Gunung Leuser',
    description:
        'Taman Nasional Gunung Leuser adalah salah satu kawasan konservasi terbesar dan paling penting di Indonesia.',
    imageUrls: [
    'https://cdn.idntimes.com/content-images/community/2022/07/zyro-image-3-4c4e0935346233c8fec14261a45ff371-e2f6ef5c3686feda3025baa955b72eb8_600x400.png',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSICV7Y6W9aYCuIcacvLyx0gAF3d_upA_A2-w&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAbzyQwYiZ_OA6N0qPIK8J-NSeyJFiKs2Duw&s',

    ],
    category: 'Gunung',
  ),
  TamanNasional(
    name: 'Taman Nasional Lorentz',
    description:
        'Taman Nasional Lorentz adalah salah satu taman nasional terbesar di Indonesia dan juga merupakan situs Warisan Dunia UNESCO.',
    imageUrls: [
  'https://asset.kompas.com/crops/5PNPoJaKd-2HcF6gzUkoN8nAeSs=/0x0:1046x697/750x500/data/photo/2019/12/04/5de71e2531cf2.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwkIa30PAIjJEXqTz5X9Y1wFSDaoRFUmjkDQ&s',
      'https://asset.kompas.com/crops/5PNPoJaKd-2HcF6gzUkoN8nAeSs=/0x0:1046x697/750x500/data/photo/2019/12/04/5de71e2531cf2.jpg',

    ],
    category: 'Gunung',
  ),
  TamanNasional(
    name: 'Taman Nasional Bukit Tiga Puluh',
    description:
        'Taman Nasional Bukit Tiga Puluh adalah salah satu kawasan konservasi yang terletak di Provinsi Riau dan Jambi, Indonesia.',
    imageUrls: [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx1JedUiN8XGcjW5qEtKSrzWkCWpotQ8YcBg&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBrSygBefaCnno5innDSuyIPc_pqHztccTPw&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8UImWiCRjp1-9q5C1hpjIVrPKCeGF3ri87w&s',
    ],
    category: 'Hutan',
  ),
];

class TamanNasionalList extends StatefulWidget {
  @override
  _TamanNasionalListState createState() => _TamanNasionalListState();
}

class _TamanNasionalListState extends State<TamanNasionalList> {
  String selectedCategory = 'Semua';
  List<String> categories = ['Semua', 'Laut', 'Gunung', 'Hutan'];

  @override
  Widget build(BuildContext context) {
    List<TamanNasional> filteredList = selectedCategory == 'Semua'
        ? tamanNasionalList
        : tamanNasionalList
            .where((tn) => tn.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Taman Nasional Indonesia'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedCategory,
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              isExpanded: true,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Image.network(
                      filteredList[index].imageUrls[0],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      filteredList[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TamanNasionalDetail(
                              tamanNasional: filteredList[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TamanNasionalDetail extends StatelessWidget {
  final TamanNasional tamanNasional;

  TamanNasionalDetail({required this.tamanNasional});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(tamanNasional.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
              ),
              items: tamanNasional.imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: screenWidth,
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              tamanNasional.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              tamanNasional.description,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
