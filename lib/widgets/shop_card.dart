import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:azmuh_global/screens/login.dart';
import 'package:azmuh_global/screens/shoplist_form.dart';
import 'package:azmuh_global/screens/list_item.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color
      color; // Menambahkan variabel color agar warna dari items dapat dicustom

  ShopItem(this.name, this.icon, this.color);

  get amount => null;
  get description => null;
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Provider(
      create: (_) {
          CookieRequest request = CookieRequest();
          return request;
      },
      child: Material(
        color: item.color,
        child: InkWell(
          // Area responsive terhadap sentuhan
          onTap: () async {
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
            else if (item.name == "Lihat Item") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ItemPage(),
                  ));
            }
            else if (item.name == "Logout") {
                final response = await request.logout(
                    "http://127.0.0.1:8000/auth/logout/");
                String message = response["message"];
                if (response['status']) {
                  if (context.mounted) {
                    String uname = response["username"];
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("$message Sampai jumpa, $uname."),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  }
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message),
                    ));
                  }
                }
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
      )
    );
  }
}
