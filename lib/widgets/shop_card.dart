import 'package:flutter/material.dart';
import 'package:azmuh_global/screens/shoplist_form.dart';
import 'package:azmuh_global/screens/item_list.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // Menambahkan variabel color agar warna dari items dapat dicustom

  ShopItem(this.name, this.icon, this.color);

  get amount => null;
  get description => null;
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          if (item.name == "Tambah Item") {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
          }
          if (item.name == "Lihat Item") {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemListPage(),
                  ));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: const Color(0xFF69585F),
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF69585F)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
