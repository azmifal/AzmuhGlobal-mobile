import 'package:flutter/material.dart';
import 'package:azmuh_global/widgets/shop_card.dart';
import 'package:azmuh_global/widgets/left_drawer.dart';

class Item {
  final String name;
  final int amount;
  final String description;

  Item(this.name, this.amount, this.description);
}

List<Item> itemList = [];

class ItemListPage extends StatefulWidget {
  const ItemListPage({super.key});

  @override
  State<ItemListPage> createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<ShopItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Daftar Item',
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF69585F),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  itemList[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jumlah: ${itemList[index].amount}'),
                    Text('Deskripsi: ${itemList[index].description}'),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
