# Azmmuh Global

## Tugas 8

### Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

- `Navigator.push()`: Metode ini digunakan untuk menavigasi ke halaman baru dan menambahkannya ke tumpukan halaman (stack). Halaman sebelumnya tetap ada di tumpukan dan dapat kembali dengan menggunakan tombol kembali atau metode `Navigator.pop()`. Contoh penggunaannya:
    ```
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage()),
    );
    ```
- `Navigator.pushReplacement()`: Metode ini juga digunakan untuk menavigasi ke halaman baru, tetapi ia menggantikan halaman saat ini di tumpukan dengan halaman baru. Dengan kata lain, halaman sebelumnya dihapus dari tumpukan. Jadi, jika mencoba kembali, tidak akan kembali ke halaman sebelumnya. Contoh penggunaannya:
    ```
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage()),
    );
    ```
Dalam prakteknya, `Navigator.push()` biasanya digunakan ketika pengguna ingin kembali ke halaman sebelumnya, seperti dalam kasus detail produk di aplikasi e-commerce. Sementara `Navigator.pushReplacement()` biasanya digunakan dalam kasus seperti proses login, di mana setelah berhasil login, tidak ingin mereka dapat kembali ke halaman login dengan menekan tombol kembali.

### Jelaskan masing-masing _layout_ widget pada Flutter dan konteks penggunaannya masing-masing!

- **Container**: merupakan widget yang paling sering digunakan dalam Flutter. Widget ini dapat menambahkan padding, margin, border, dan warna latar belakang.
- **Row dan Column**: digunakan untuk mengatur sejumlah widget _child_ secara horizontal (Row) atau vertikal (Column).
- **Stack**: berguna jika ingin menumpuk beberapa widget _child_, misalnya memiliki beberapa teks dan gambar, yang ditumpuk dengan cara tertentu.
- **GridView**: digunakan untuk membuat daftar grid yang terdiri dari pola sel yang diulang dan disusun dalam tata letak vertikal dan horizontal.
- **ListView**: merupakan widget scrolling yang paling umum digunakan. Ia menampilkan _child_-nya satu per satu dalam arah scroll.
- **Expanded**: digunakan untuk memperluas _child_ dari Row, Column, atau Flex.
- **Padding**: digunakan untuk memberikan jarak antara widget dengan widget lainnya.
- **Align**: digunakan untuk menyesuaikan posisi widget _child_ di dalam dirinya sendiri.
- **AspectRatio**: digunakan untuk mencoba mengatur ukuran widget _child_ ke rasio aspek tertentu.
- **Center**: digunakan untuk memusatkan widget _child_ di dalam dirinya sendiri.
- **SizedBox**: digunakan untuk memberikan ukuran tertentu pada widget.
- **Transform**: digunakan untuk menerapkan transformasi sebelum melukis widget _child_-nya.

### Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Dalam kode `ShopFormPage` milik saya, terdapat tiga elemen input yang digunakan, yaitu:

- **Nama Item**: Elemen input ini menggunakan widget TextFormField dengan validator yang memeriksa apakah nilai yang dimasukkan kosong atau tidak. Elemen input ini digunakan untuk memasukkan nama item yang akan ditambahkan ke daftar item/produk.
- **Jumlah**: Elemen input ini juga menggunakan widget TextFormField, tetapi dengan validator tambahan yang memeriksa apakah nilai yang dimasukkan adalah angka. Elemen input ini digunakan untuk memasukkan jumlah item yang akan ditambahkan ke daftar item/produk.
- **Deskripsi**: Elemen input ini menggunakan widget TextFormField dengan validator yang memeriksa apakah nilai yang dimasukkan kosong atau tidak. Elemen input ini digunakan untuk memasukkan deskripsi item yang akan ditambahkan ke daftar item/produk.

Pemilihan elemen input ini didasarkan pada kebutuhan aplikasi untuk mengumpulkan informasi tentang item belanja dari pengguna. `TextFormField` adalah widget input teks yang paling umum digunakan dalam Flutter dan cocok untuk kebutuhan ini.

### Bagaimana penerapan _clean architecture_ pada aplikasi Flutter?

_Clean Architecture_ pada aplikasi Flutter umumnya terdiri dari lapisan-lapisan berikut:
- **_Presentation Layer_ / Lapisan Presentasi (UI)**: Lapisan ini berisi komponen-komponen antarmuka pengguna, seperti widget, layar, dan tampilan. Lapisan ini bertanggung jawab untuk menangani interaksi pengguna dan merender antarmuka pengguna. Lapisan presentasi harus independen dari logika bisnis dan detail implementasi akses data.
- **_Domain Layer_ / Lapisan Domain (Logika Bisnis)**: Lapisan domain mewakili logika bisnis inti dari aplikasi. Lapisan ini berisi use case, entitas, dan aturan bisnis. Use case mendefinisikan operasi atau tindakan yang dapat dilakukan dalam aplikasi. Entitas mewakili objek-objek penting dalam domain dan mengkapsulasi perilaku dan statusnya. Lapisan domain harus tidak bergantung pada kerangka kerja atau teknologi tertentu.
- **_Data Layer_ / Lapisan Data**: Lapisan data bertanggung jawab untuk pengambilan dan penyimpanan data. Lapisan ini terdiri dari repository dan data source. Repository menyediakan lapisan abstraksi untuk mengakses dan memanipulasi data. Mereka mendefinisikan kontrak atau antarmuka untuk operasi data, yang diimplementasikan oleh data source. Data source dapat berupa API remote, database lokal, atau penyedia data eksternal lainnya. Lapisan data melindungi lapisan domain dari detail penyimpanan dan pengambilan data.

Kemudina, prinsip-prinsip _Clean Architecture_ menyarankan panduan berikut mengenai ketergantungan antar lapisan:
- **Lapisan Presentasi bergantung pada Lapisan Domain**: Lapisan presentasi berinteraksi dengan lapisan domain melalui antarmuka atau abstraksi yang disediakan oleh lapisan domain. Hal ini memungkinkan logika bisnis terpisah dari lapisan presentasi.
- **Lapisan Domain independen dari lapisan lainnya**: Lapisan domain berisi logika bisnis inti dan tidak boleh memiliki ketergantungan pada kerangka kerja eksternal, pustaka, atau komponen terkait antarmuka pengguna. Hal ini membuat lapisan domain dapat digunakan kembali dan tidak bergantung pada platform tertentu.
- **Lapisan Data bergantung pada Lapisan Domain**: Lapisan data mengimplementasikan antarmuka atau abstraksi yang didefinisikan dalam lapisan domain. Hal ini memungkinkan berbagai sumber data (misalnya, API, database) dapat dihubungkan ke aplikasi tanpa mempengaruhi lapisan domain.

Dengan mengikuti prinsip-prinsip _Clean Architecture_ ini, aplikasi Flutter dapat menjadi lebih mudah dipelihara, memiliki pengujian yang lebih baik, dan lebih mudah untuk mengubah atau memperluas aplikasi.

### Jelaskan bagaimana cara kamu mengimplementasikan _checklist_ di atas secara _step-by-step_! (bukan hanya sekadar mengikuti tutorial)

1. *Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru*:
    - Pada direktori baru bernama `screens` di direktori`lib`, membuat file baru bernama `shoplist_form.dart`.
    - Pada `shoplist_form.dart`:
        - Membuat class `ShopFormPage extends StatefulWidget` dan class `_ShopFormPageState extends State<ShopFormPage>`
        - Membuat variabel baru bernama `_formKey` lalu menambahkan `_formKey` tersebut ke dalam atribut `key` milik widget `Form` yang kemudian akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form seperti berikut:
            ```
            ...
            class _ShopFormPageState extends State<ShopFormPage> {
                final _formKey = GlobalKey<FormState>();
            ...
            ```
            ```
            ...
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    ...
                ),
            ),
            ...
            ```
        - Mengisi widget `Form` dengan beberapa field seperti berikut:
            ```
            class _ShopFormPageState extends State<ShopFormPage> {
                final _formKey = GlobalKey<FormState>();
                String _name = "";
                int _amount = 0;
                String _description = "";
                ...
            }
            ```
        - Membuat widget `Column` sebagai _child_ dari `SingleChildScrollView()` dan menambahkan 3 `TextFormField()` untuk input nama, jumlah, dan deskripsi beserta validatornya yang dibungkus oleh `Padding` seperti berikut:
            ```
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Nama Item",
                                    labelText: "Nama Item",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                        _name = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Nama tidak boleh kosong!";
                                    }
                                    return null;
                                },
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Jumlah",
                                    labelText: "Jumlah",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                        _amount = int.parse(value!);
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Jumlah tidak boleh kosong!";
                                    }
                                    if (int.tryParse(value) == null) {
                                        return "Jumlah harus berupa angka!";
                                    }
                                    return null;
                                },
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Deskripsi",
                                    labelText: "Deskripsi",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState(() {
                                        _description = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return "Deskripsi tidak boleh kosong!";
                                    }
                                    return null;
                                },
                            ),
                        ),
                    ...
            ```
        - Membuat sebuah tombol *Save* sebagai _child_ lanjutan dari `Column` yang dibungkus dalam widget `Column` dan `Padding` seperti berikut:
            ```
            ...
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(const Color(0xFF69585F)),
                        ),
                        onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
                ),
            ),
            ...
            ```

2. *Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama*:
    - Pada widget `ShopItem` pada file `shop_card.dart` pada direktori `widgets`, melakukan navigasi ke `ShopFormPage` pada atribut `onTap` dari `InkWell` seperti berikut:
        ```
        ...
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
            ...
        },
        ...
        ```

3. *Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru*:
    - Pada `shoplist_form.dart` pada child `ElevatedButton`, menambahkan fungsi `showDialog()` pada bagian `onPressed()` dan munculkan widget `AlertDialog` pada fungsi tersebut. Kemudian, tambahkan juga fungsi untuk reset form seperti berikut:
        ```
        ...
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF69585F)),
            ),
            onPressed: () {
                if (_formKey.currentState!.validate()) {
                    // Menambahkan item ke itemList
                    itemList.add(Item(_name, _amount, _description));
                    showDialog(
                        context: context,
                        builder: (context) {
                            return AlertDialog(
                                title: const Text('Produk berhasil tersimpan'),
                                content: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                            Text('Nama: $_name'),
                                            Text('Jumlah: $_amount'),
                                            Text('Deskripsi: $_description'),
                                        ],
                                    ),
                                ),
                                actions: [
                                    TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                            Navigator.pop(context);
                                        },
                                    ),
                                ],
                            );
                        },
                    );
                }
                _formKey.currentState!.reset();
            },
            child: const Text(
                "Save",
                style: TextStyle(color: Colors.white),
            ),
        ),
        ...
        ```

4. *Membuat sebuah drawer pada aplikasi*:
    - Membuat file `left_drawer.dart` pada direktori `widgets`
    - Membuat class `LeftDrawer extends StatelessWidget` seperti berikut:
        ```
        class LeftDrawer extends StatelessWidget {
            const LeftDrawer({super.key});

            @override
            Widget build(BuildContext context) {
                return Drawer(
                    child: ListView(
                        children: [
                        const DrawerHeader(
                            decoration: BoxDecoration(
                                color: Color(0xFF69585F),
                            ),
                            child: Column(
                                children: [
                                    Text(
                                        'Azmuh Global',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                        ),
                                    ),
                                    Padding(padding: EdgeInsets.all(10)),
                                    Text("Catat seluruh keperluan belanjamu di sini!",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.normal,)
                                        ),
                                ],
                            ),
                        ),
                        // Bagian routing
                        ],
                    ),
                );
            }
        }
        ```
    - Memunculkan opsi halaman `Halaman Utama` dan `Tambah Item` serta melakukan navigasi ke kedua halaman tersebut seperti berikut:
        ```
        ...
        // Bagian routing
        ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                    ));
            },
        ),
        ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShopFormPage(),
                    ));
            },
        ),
        ...
        ```

5. *Bonus*:
    - Membuat file `item_list.dart` pada direktori `screens`
    - Membuat class `Item` dengan 3 atribut berupa `name`, `amount`, dan `description` serta membuat List bernama `itemList` yang akan menyimpan data yang telah diinput pada `shoplist_form.dart`
    - Menambhkan item yang sudah dibuat pada `shoplist_form.dart` ke dalam list `itemList` seperti berikut:
        ```
        ...
        if (_formKey.currentState!.validate()) {
            // Menambahkan item ke itemList
            itemList.add(Item(_name, _amount, _description));
        ...
        ```
    - Menampilkan daftar item pada `ItemListPage` dengan menggunakan implementasi `Card`
    - Melakukan navigasi pada `shop_card.dart` agar dapat berpindah ke `ItemListPage` seperti berikut:
        ```
        ...
        onTap: () {
            // Memunculkan SnackBar ketika diklik
            ...
            if (item.name == "Lihat Item") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemListPage(),
                    ));
            }
        },
        ...
        ```
    - Melakukan navigasi pada `left_drawer.dart` agar dapat berpindah ke `ItemListPage` seperti berikut:
        ```
        ...
        ListTile(
            leading: const Icon(Icons.list_all_outlined),
            title: const Text('Daftar Item'),
            // Bagian redirection ke ItemListPage
            onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ItemListPage(),
                    ));
            },
        ),
        ...

        ```
</summary>

## Tugas 7

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
