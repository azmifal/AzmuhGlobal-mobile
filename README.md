# Azmmuh Global

## Tugas 7

<details>
<summary><b>Detail Tugas 1</b></summary>

### Apa perbedaan utama antara _stateless_ dan _stateful widget_ dalam konteks pengembangan aplikasi Flutter?

- **_Stateless Widget_**: _Widget_ ini mendeskripsikan bagian dari antarmuka pengguna yang dapat dikonfigurasi secara statis atau tidak berubah. Setelah mendeklarasikan _widget_, tampilannya tidak dapat diubah kecuali dengan menghapus dan menggantinya dengan _widget_ lain. _Stateless Widget_ tidak memiliki status internal yang dapat berubah sepanjang waktu. Contoh dari _Stateless Widget_ adalah ikon atau label.

- **_Stateful Widget_**: _Widget_ ini dapat berubah sepanjang waktu. Hal ini berarti memungkinkan pengguna untuk berinteraksi dengan _widget_ atau melihat perubahan data di latar belakang. _Stateful Widget_ memiliki status yang dapat berubah sepanjang waktu dan memicu ulang proses build untuk memperbarui tampilan di layar. Contoh dari _Stateful Widget_ adalah checkbox, radio, slider, InkWell, Form, atau TextField.

### Sebutkan seluruh _widget_ yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

- **MaterialApp**: merupakan widget root untuk banyak aplikasi Flutter. Ini menciptakan widget MaterialApp yang menggunakan Material Design.
- **Scaffold**: merupakan kerangka dasar visual untuk Material Design. Ini memberikan struktur dasar aplikasi Material Design.
- **AppBar**: merupakan bar aplikasi Material Design. Ini biasanya digunakan sebagai AppBar Scaffold.
- **Text**: merupakan widget yang menampilkan teks dengan gaya.
- **SingleChildScrollView**: merupakan kotak yang dapat discroll yang berisi kotak yang biasanya lebih besar daripada dirinya sendiri.
- **Padding**: merupakan widget yang memberikan padding kepada child-nya.
- **Column**: merupakan widget yang menampilkan child-nya dalam arah vertikal.
- **GridView**: merupakan widget yang menampilkan child-nya sebagai grid dua dimensi yang dapat discroll.
- **Material**: merupakan potongan material konseptual. Material adalah permukaan yang dapat memberikan elevasi visual kepada child-nya dan memiliki beberapa perilaku fisik yang lebih kompleks.
- **InkWell**: merupakan area Material yang merespons sentuhan.
- **Container**: merupakan kotak yang berisi beberapa widget dengan opsi penataan.
- **Icon**: merupakan gambar ikonografi yang diambil dari set ikon Material Design.
- **ShopItem**: merupakan kelas Dart yang dibuat pengguna yang digunakan untuk menyimpan data untuk setiap item dalam toko.
- **ShopCard**: merupakan kelas Dart yang dibuat pengguna yang digunakan untuk menampilkan setiap item dalam toko sebagai kartu.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

1. *Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya*:
    - Membuat proyek baru dengan menjalankan command `flutter create azmuh_global`

2. *Membuat tiga tombol sederhana dengan ikon dan teks*:
    - Pada `main.dart`hapus `MyHomePage(title: 'Flutter Demo Home Page')` menjadi `MyHomePage()`
    - Pada `menu.dart`:
        - Mengubah sifat _widget_ halaman menjadi _Stateless Widget_ seperti berikut:
            ```
            class MyHomePage extends StatelessWidget {
                MyHomePage({Key? key}) : super(key: key);

                @override
                Widget build(BuildContext context) {
                    return Scaffold(
                        ...
                    );
                }
            }
            ```
        - Menambahkan teks dan card dengan mendifinisikannya seperti berikut:
            ```
            class ShopItem {
                final String name;
                final IconData icon;

                ShopItem(this.name, this.icon);
            }
            ```
        - Menambahkan barang-barang yang dijual dengan membuat `List` di bawah kode `MyHomePage({Key? key}) : super(key: key);` seperti berikut:
            ```
            final List<ShopItem> items = [
                ShopItem("Lihat Item", Icons.checklist),
                ShopItem("Tambah Item", Icons.add_shopping_cart),
                ShopItem("Logout", Icons.logout),
            ];
            ```
        - Mengubah method `Widget build(BuildContext context)` menjadi seperti berikut:
            ```
            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                        title: const Text(
                            'Azmuh Global',
                        ),
                    ),
                    body: SingleChildScrollView(
                        // Widget wrapper yang dapat discroll
                        child: Padding(
                            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                            child: Column(
                                // Widget untuk menampilkan children secara vertikal
                                children: <Widget>[
                                    const Padding(
                                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                        // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                                        child: Text(
                                            'Azmuh Shop', // Text yang menandakan toko
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                            ),
                                        ),
                                    ),
                                    // Grid layout
                                    GridView.count(
                                        // Container pada card kita.
                                        primary: true,
                                        padding: const EdgeInsets.all(20),
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 3,
                                        shrinkWrap: true,
                                        children: items.map((ShopItem item) {
                                            // Iterasi untuk setiap item
                                            return ShopCard(item);
                                        }).toList(),
                                    ),
                                ],
                            ),
                        ),
                    ),
                );
            }
            ```
        - Membuat _Stateless Widget_ untuk menampilkan card seperti berikut:
            ```
            class ShopCard extends StatelessWidget {
                final ShopItem item;

                const ShopCard(this.item, {super.key}); // Constructor

                @override
                Widget build(BuildContext context) {
                    return Material(
                        color: Colors.indigo,
                        child: InkWell(
                            child: Container(
                                // Container untuk menyimpan Icon dan Text
                                padding: const EdgeInsets.all(8),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Icon(
                                                item.icon,
                                                color: Colors.white,
                                                size: 30.0,
                                            ),
                                            const Padding(padding: EdgeInsets.all(3)),
                                            Text(
                                                item.name,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(color: Colors.white),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    );
                }
            }
            ```
    3. *Memunculkan Snackbar*:
        - Dalam class `ShopCard`, tambahkan potongan kode berikut:
            ```
            @override
            Widget build(BuildContext context){
                return Material(
                    ....
                    child: InkWell(
                        onTap: () {
                        // Memunculkan SnackBar ketika diklik
                        ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text("Kamu telah menekan tombol ${item.name}!")));
                        },
                        ....
                    )
                )
            }
            ```
    4. *Bonus*:
        - Menambahkan field dan constructor baru pada class `ShopItem` seperti berikut:
            ```
            class ShopItem {
                final String name;
                final IconData icon;
                final Color color;

                ShopItem(this.name, this.icon, this.color);
            }
            ```
        - Menambahkan parameter baru dalam pemanggilan class `ShopItem` pada List Items seperti berikut:
            ```
            final List<ShopItem> items = [
                ShopItem("Lihat Item", Icons.checklist,const Color(0xFF94B9AF)),
                ShopItem("Tambah Item", Icons.add_shopping_cart, const Color(0xFF90A583)),
                ShopItem("Logout", Icons.logout, const Color(0xFF3A606E)),
            ];
            ```
        - Mengubah cara pemanggilan warna dari class `ShopCard` agar sesuai dengan warna dari masing-masing Item seperti berikut:
            ```
            class ShopCard extends StatelessWidget {
                ... 
                @override
                Widget build(BuildContext context) {
                    ...
                    color: item.color,
                    ...
                }
            }
            ```