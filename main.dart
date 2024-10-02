import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get image => null;

  @override
  void initState() {
    super.initState();
    // Simulasi loading, bisa diatur sesuai kebutuhan
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              const Layout(), // Ganti dengan halaman utama Anda
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
            colors: [
              Color(0xFF0D006F), // Warna pertama// Warna kedua
              Color(0xFF9614D0),
            ], // Warna gradasi
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Logo atau gambar untuk splash screen
                Image.asset(
                  'assets/image/LOGO GEM DEV REVISI.png', // Ganti dengan nama file gambar Anda
                  width: 170, // Atur ukuran gambar
                ),
                const SizedBox(height: 20),
                // Teks atau widget lain yang ingin ditampilkan
              ],
            ),
          ),
        ),
    );
  }
  
  logoFlutter({required int size}) {}
}

class Logo {
  const Logo({required int size});
}

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0D006F), // Warna pertama
              Color(0xFF7509FE), // Warna kedua
              Color(0xFF9614D0),
            ], // Warna gradasi
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    bottom:
                        55.0), // Menempatkan teks 50 piksel dari atas dan 20 piksel dari kiri
                child: Text(
                  'Spaceword',
                  style: TextStyle(
                    fontFamily: 'FontdinerSwanky',
                    color: const Color(0xFFFFF50B),
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset:
                            const Offset(2.0, 2.0), // Posisi bayangan (x, y)
                        blurRadius: 3.0, // Tingkat blur bayangan
                        color: Colors.black.withOpacity(0.5), // Warna bayangan
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Level()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAE0AFB),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  minimumSize: const Size(120, 50), // Padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: const BorderSide(
                      color: Color(0xFFD1BEDA),
                      width: 7.0,
                    ), // Membuat sudut melengkung
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontFamily: 'FontdinerSwanky',
                    color: Color(0xFFFFF50B),
                    fontSize: 25,
                  ),
                ), // Teks tombol
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Level extends StatelessWidget {
  const Level({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              IconData(0xf02db, fontFamily: 'MaterialIcons'), // Ikon pertama
              color: Color(0xFFFFC700), // Warna ikon
              size: 50, // Ukuran ikon
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Layout()),
              ); // Aksi saat ikon pertama ditekan
            },
          ),
          actions: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      right: 8.0), // Memberikan jarak antara teks dan ikon
                  child: Text(
                    '0', // Teks "0"
                    style: TextStyle(
                      color: Colors.white, // Warna teks
                      fontSize: 45, // Ukuran teks
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    IconData(0xeea2,
                        fontFamily:
                            'MaterialIcons'), // Menambahkan ikon attach_money_outlined
                    color: Color(0xFFFFC700), // Warna ikon
                    size: 50, // Ukuran ikon
                  ),
                  onPressed: () {
                    // Aksi saat ikon attach_money_outlined ditekan
                  },
                ),
              ],
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0D006F),
                Color(0xFF7509FE),
                Color(0xFF9614D0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Pusatkan kolom secara vertikal
              children: [
                // Menambahkan jarak atas untuk menurunkan tombol lebih bawah
                const SizedBox(
                    height: 80), // Jarak antara atas layar dan tombol
                // Button EASY
                SizedBox(
                  width: 200, // Lebar yang sama untuk semua tombol
                  child: _buildStrokeButton(
                    color: const Color(0xFF18F513),
                    text: 'EASY',
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EasyLevel()),
                  );// Aksi untuk tombol EASY
                    },
                  ),
                ),
                const SizedBox(height: 35), // Jarak antara tombol
                // Button MEDIUM
                SizedBox(
                  width: 200, // Lebar yang sama untuk semua tombol
                  child: _buildStrokeButton(
                    color: const Color(0xFFF3DC0E),
                    text: 'MEDIUM',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MediumLevel())
                        );// Aksi untuk tombol MEDIUM
                    },
                  ),
                ),
                const SizedBox(height: 35), // Jarak antara tombol
                // Button HARD
                SizedBox(
                  width: 200, // Lebar yang sama untuk semua tombol
                  child: _buildStrokeButton(
                    color: const Color(0xFFF82609),
                    text: 'HARD',
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HardLevel())
                      );  // Aksi untuk tombol HARD
                    },
                  ),
                ),
                const SizedBox(height: 40), // Jarak antara tombol dan ikon
                // Menambahkan ikon checkroom_outlined dengan teks di bawahnya
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        IconData(0xef4c,
                            fontFamily:
                                'MaterialIcons'), // Ikon checkroom_outlined
                        color: Color(0xFFFFC700), // Warna ikon
                        size: 50, // Ukuran ikon
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomChr()),
                        ); // Aksi saat ikon checkroom_outlined ditekan
                      },
                    ),
                    const Text(
                      'CUSTOM', // Teks di bawah ikon
                      style: TextStyle(
                        fontSize: 14, // Ukuran teks
                        color: Colors.white, // Warna teks
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStrokeButton({
    required Color color,
    required String text,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color, // Warna latar belakang tombol
        borderRadius: BorderRadius.circular(12), // Radius sudut tombol
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7), // Warna bayangan
            offset: const Offset(4.0, 4.0), // Posisi bayangan
            blurRadius: 6.0, // Jarak kabur bayangan
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color
              .withOpacity(0), // Warna latar belakang tombol menjadi transparan
          shadowColor: Colors.transparent, // Menghilangkan shadow default
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Radius sudut tombol
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'FontdinerSwanky',
            fontSize: 20,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Color(
                    0xFF000000), // Warna bayangan hitam dengan transparansi 50%
                offset: Offset(2.0, 2.0), // Posisi bayangan
                blurRadius: 4.0, // Jarak kabur bayangan
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomChr extends StatelessWidget {
  const CustomChr({super.key});

  @override
  Widget build(BuildContext context) {
    return const CharacterCustomizationPage();
  }
}

class CharacterCustomizationPage extends StatefulWidget {
  const CharacterCustomizationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterCustomizationPageState createState() =>
      _CharacterCustomizationPageState();
}

class _CharacterCustomizationPageState
    extends State<CharacterCustomizationPage> {
  String selectedBody = 'assets/bodies/Alien Biru.png';
  String selectedClothes = 'assets/clothes/KOSTUM PENCURI.png';
  int playerCoins = 1000;

  final List<String> bodyAssets = [
    'assets/bodies/Alien Biru.png',
    'assets/bodies/Alien Hijau.png',
    'assets/bodies/Alien Pink.png',
    'assets/bodies/Alien Ungu.png',
    'assets/bodies/Alien Kuning.png',
  ];

  final List<int> bodyPrices = [300, 400, 500, 600, 700];

  final List<String> clothesAssets = [
    'assets/clothes/KOSTUM PENCURI.png',
    'assets/clothes/Kostum Iblis Revisi.png',
    'assets/clothes/Kostum Koki Revisi Lagi.png',
    'assets/clothes/Kostum Raja.png',
    'assets/clothes/Kostum Domba.png',
    'assets/clothes/Kostum Rubah.png',
    'assets/clothes/Kostum Sapi.png',
    'assets/clothes/Kostum Santa.png',
    'assets/clothes/Kostum Superhero.png',
  ];

  final List<int> clothesPrices = [
    200, 300, 400, 500, 600, 700, 800, 900, 1000
  ];

  List<String> purchasedBodies = [];
  List<String> purchasedClothes = [];

  @override
  void initState() {
    super.initState();
    _loadCharacterPreferences();
  }



  Future<void> _loadCharacterPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedBody = prefs.getString('selectedBody') ?? bodyAssets[0];
      selectedClothes = prefs.getString('selectedClothes') ?? clothesAssets[0];
      purchasedBodies = prefs.getStringList('purchasedBodies') ?? [bodyAssets[0]];
      purchasedClothes = prefs.getStringList('purchasedClothes') ?? [clothesAssets[0]];
      playerCoins = prefs.getInt('playerCoins') ?? 1000; // Load player coins
    });
  }

  Future<void> _saveCharacterPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedBody', selectedBody);
    await prefs.setString('selectedClothes', selectedClothes);
    await prefs.setStringList('purchasedBodies', purchasedBodies);
    await prefs.setStringList('purchasedClothes', purchasedClothes);
    await prefs.setInt('playerCoins', playerCoins); // Save player coins
  }

  void selectItem(String item, String itemType) {
    setState(() {
      if (itemType == 'clothes') {
        selectedClothes = item;
      } else if (itemType == 'body') {
        selectedBody = item;
      }
    });
    _saveCharacterPreferences();
  }

  void buyItem(int price, String item, String itemType) {
    if (playerCoins >= price) {
      setState(() {
        playerCoins -= price;
        if (itemType == 'clothes') {
          purchasedClothes.add(item);
        } else if (itemType == 'body') {
          purchasedBodies.add(item);
        }
      });
      _saveCharacterPreferences();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have purchased $itemType for $price coins!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough coins!')),
      );
    }
  }

  void showConfirmationDialog(BuildContext context, String itemType, String item, int price) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Purchase'),
          content: Text('Do you want to buy this $itemType for $price coins?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                buyItem(price, item, itemType);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

    Widget username(BuildContext context) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
              labelText: 'Edit Userrname',
              border: OutlineInputBorder(),
              ),
              onChanged: (value) {
              debugPrint('Username entered: $value');
              },
            ),
          ],
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customize Character'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFC700),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.monetization_on, color: Colors.yellow),
                const SizedBox(width: 5),
                Text('$playerCoins'),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    selectedBody,
                    height: 220,
                  ),
                  Image.asset(
                    selectedClothes,
                    height: 220,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Clothes Section
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Clothes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: clothesAssets.length,
                    itemBuilder: (context, index) {
                      final isPurchased = purchasedClothes.contains(clothesAssets[index]);
                      return GestureDetector(
                        onTap: () {
                          if (isPurchased) {
                            selectItem(clothesAssets[index], 'clothes');
                          } else {
                            showConfirmationDialog(context, 'clothes', clothesAssets[index], clothesPrices[index]);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 7, top: 11, right: 7),
                          decoration: BoxDecoration(
                            color: isPurchased ? Colors.grey : const Color.fromARGB(255, 239, 223, 253),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                    clothesAssets[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                if (!isPurchased)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${clothesPrices[index]} coins',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Skin Section
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Skin',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: bodyAssets.length,
                    itemBuilder: (context, index) {
                      final isPurchased = purchasedBodies.contains(bodyAssets[index]);
                      return GestureDetector(
                        onTap: () {
                          if (isPurchased) {
                            selectItem(bodyAssets[index], 'body');
                          } else {
                            showConfirmationDialog(context, 'body', bodyAssets[index], bodyPrices[index]);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 7, top: 9, right: 7, bottom: 11),
                          decoration: BoxDecoration(
                            color: isPurchased ? Colors.grey : const Color(0xFFBB84F3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Image.asset(
                                    bodyAssets[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                if (!isPurchased)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${bodyPrices[index]} coins',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CrosswordApp extends StatelessWidget {
  const CrosswordApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crossword Vortex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EasyLevel(),
    );
  }
}

class EasyLevel extends StatefulWidget {
  const EasyLevel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CrosswordGridState createState() => _CrosswordGridState();
}

class _CrosswordGridState extends State<EasyLevel> {
  List<List<String>> correctAnswers = [
    ['J', 'E', 'R', 'U'],
    ['H', 'U', 'T', 'A'],
    ['S', 'I', 'N', 'G'],
    ['M', 'A', 'L', 'A'],
    ['D', 'E', 'N', 'D'],
  ];

  List<List<String>> crossword = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
  ];

  List<String> clues = [
    "Jenis buah yang identik dengan vitamin C",
    "Ekosistem yang terdiri dari pohon dan tumbuhan",
    "Raja hewan yang dikenal dengan nama “King of the Jungle”",
    "Waktu untuk istirahat dan tidur",
    "Sejumlah uang yang harus dibayar sebagai sanksi karena melanggar aturan",
  ];

  int activeClueIndex = 0;

  List<bool> isCorrectRow = [false, false, false, false, false];
  List<bool> isRowWrong = [false, false, false, false, false];

  int score = 0;

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void addScore(int points) {
    setState(() {
      score += points;
    });
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      // Jika input tidak lengkap (jumlah karakter tidak sesuai dengan jawaban benar)
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
        return;
      }

      // Jika input lengkap, lanjutkan proses pengecekan
      List<String> newRow = newRowValue.split('');
      bool isCorrect = true;

      for (int i = 0; i < newRow.length; i++) {
        if (newRow[i].toUpperCase() != correctAnswers[rowIndex][i]) {
          isCorrect = false;
          break;
        }
      }

      if (isCorrect) {
        crossword[rowIndex] = List.from(correctAnswers[rowIndex]);
        isCorrectRow[rowIndex] = true;
        isRowWrong[rowIndex] = false;
        addScore(10);
      } else {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < newRow.length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return; // Jika baris sudah benar, dialog tidak akan muncul
    }

    final TextEditingController controller =
        TextEditingController(text: crossword[rowIndex].join());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            clues[rowIndex],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                focusNode: _focusNode,
                controller: controller,
                onSubmitted: (newValue) {
                  if (newValue.trim().isNotEmpty) {
                    updateRow(rowIndex, newValue);
                  }
                  Navigator.pop(context);
                },
                maxLength: crossword[rowIndex].length,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newValue = controller.text
                    .trim(); // Ambil nilai dari controller dan trim spasi

                // Cek apakah input kosong, jika ya, jangan lakukan apapun
                if (newValue.isEmpty) {
                  Navigator.pop(context); // Tutup dialog jika input kosong
                  return;
                }

                updateRow(rowIndex,
                    newValue); // Hanya update row jika input tidak kosong
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    ).then((_) {
      _focusNode.unfocus();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crossword Grid'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Score: $score',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                clues[activeClueIndex],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(crossword.length, (rowIndex) {
                return Row(
                  children:
                      List.generate(crossword[rowIndex].length, (colIndex) {
                    Color borderColor = Colors.black;

                    if (isCorrectRow[rowIndex]) {
                      borderColor = Colors.green;
                    } else if (isRowWrong[rowIndex]) {
                      borderColor = Colors.red;
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!isCorrectRow[rowIndex]) {
                            setState(() {
                              activeClueIndex = rowIndex;
                            });
                            showAnswerInputDialog(context, rowIndex);
                          }
                        },
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 2.0),
                            ),
                            child: Text(
                              crossword[rowIndex][colIndex],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class MediumLevel extends StatefulWidget {
  const MediumLevel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MediumLevelState createState() => _MediumLevelState();
}

class _MediumLevelState extends State<MediumLevel> {
  List<List<String>> correctAnswers = [
    ['J', 'E', 'R', 'U', 'K'],
    ['H', 'U', 'T', 'A', 'N'],
    ['S', 'I', 'N', 'G', 'A'],
    ['M', 'A', 'L', 'A', 'M'],
    ['D', 'E', 'N', 'D', 'A'],
  ];

  List<List<String>> crossword = [
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
    ['', '', '', '', ''],
  ];

  List<String> clues = [
    "Jenis buah yang identik dengan vitamin C",
    "Ekosistem yang terdiri dari pohon dan tumbuhan",
    "Raja hewan yang dikenal dengan nama “King of the Jungle”",
    "Waktu untuk istirahat dan tidur",
    "Sejumlah uang yang harus dibayar sebagai sanksi karena melanggar aturan",
  ];

  int activeClueIndex = 0;

  List<bool> isCorrectRow = [false, false, false, false, false];
  List<bool> isRowWrong = [false, false, false, false, false];

  int score = 0;

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void addScore(int points) {
    setState(() {
      score += points;
    });
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      // Jika input tidak lengkap (jumlah karakter tidak sesuai dengan jawaban benar)
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
        return;
      }

      // Jika input lengkap, lanjutkan proses pengecekan
      List<String> newRow = newRowValue.split('');
      bool isCorrect = true;

      for (int i = 0; i < newRow.length; i++) {
        if (newRow[i].toUpperCase() != correctAnswers[rowIndex][i]) {
          isCorrect = false;
          break;
        }
      }

      if (isCorrect) {
        crossword[rowIndex] = List.from(correctAnswers[rowIndex]);
        isCorrectRow[rowIndex] = true;
        isRowWrong[rowIndex] = false;
        addScore(10);
      } else {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < newRow.length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return; // Jika baris sudah benar, dialog tidak akan muncul
    }

    final TextEditingController controller =
        TextEditingController(text: crossword[rowIndex].join());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            clues[rowIndex],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                focusNode: _focusNode,
                controller: controller,
                onSubmitted: (newValue) {
                  if (newValue.trim().isNotEmpty) {
                    updateRow(rowIndex, newValue);
                  }
                  Navigator.pop(context);
                },
                maxLength: crossword[rowIndex].length,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newValue = controller.text
                    .trim(); // Ambil nilai dari controller dan trim spasi

                // Cek apakah input kosong, jika ya, jangan lakukan apapun
                if (newValue.isEmpty) {
                  Navigator.pop(context); // Tutup dialog jika input kosong
                  return;
                }

                updateRow(rowIndex,
                    newValue); // Hanya update row jika input tidak kosong
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    ).then((_) {
      _focusNode.unfocus();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crossword Grid'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Score: $score',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                clues[activeClueIndex],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(crossword.length, (rowIndex) {
                return Row(
                  children:
                      List.generate(crossword[rowIndex].length, (colIndex) {
                    Color borderColor = Colors.black;

                    if (isCorrectRow[rowIndex]) {
                      borderColor = Colors.green;
                    } else if (isRowWrong[rowIndex]) {
                      borderColor = Colors.red;
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!isCorrectRow[rowIndex]) {
                            setState(() {
                              activeClueIndex = rowIndex;
                            });
                            showAnswerInputDialog(context, rowIndex);
                          }
                        },
                        child: SizedBox(
                          width: 75,
                          height: 75,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 2.0),
                            ),
                            child: Text(
                              crossword[rowIndex][colIndex],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class HardLevel extends StatefulWidget {
  const HardLevel({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HardLevelState createState() => _HardLevelState();
}

class _HardLevelState extends State<HardLevel> {
  List<List<String>> correctAnswers = [
    ['Z', 'A', 'K', 'A', 'R', 'I'],
    ['Z', 'A', 'K', 'A', 'R', 'I'],
    ['Z', 'A', 'K', 'A', 'R', 'I'],
    ['Z', 'A', 'K', 'A', 'R', 'I'],
    ['Z', 'A', 'K', 'A', 'R', 'I'],
  ];

  List<List<String>> crossword = [
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
  ];

  List<String> clues = [
    "Jenis buah yang identik dengan vitamin C",
    "Ekosistem yang terdiri dari pohon dan tumbuhan",
    "Raja hewan yang dikenal dengan nama “King of the Jungle”",
    "Waktu untuk istirahat dan tidur",
    "Sejumlah uang yang harus dibayar sebagai sanksi karena melanggar aturan",
  ];

  int activeClueIndex = 0;

  List<bool> isCorrectRow = [false, false, false, false, false];
  List<bool> isRowWrong = [false, false, false, false, false];

  int score = 0;

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void addScore(int points) {
    setState(() {
      score += points;
    });
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      // Jika input tidak lengkap (jumlah karakter tidak sesuai dengan jawaban benar)
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
        return;
      }

      // Jika input lengkap, lanjutkan proses pengecekan
      List<String> newRow = newRowValue.split('');
      bool isCorrect = true;

      for (int i = 0; i < newRow.length; i++) {
        if (newRow[i].toUpperCase() != correctAnswers[rowIndex][i]) {
          isCorrect = false;
          break;
        }
      }

      if (isCorrect) {
        crossword[rowIndex] = List.from(correctAnswers[rowIndex]);
        isCorrectRow[rowIndex] = true;
        isRowWrong[rowIndex] = false;
        addScore(10);
      } else {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < newRow.length; i++) {
          crossword[rowIndex][i] = ''; // Kosongkan kolom jika salah
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return; // Jika baris sudah benar, dialog tidak akan muncul
    }

    final TextEditingController controller =
        TextEditingController(text: crossword[rowIndex].join());

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            clues[rowIndex],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                focusNode: _focusNode,
                controller: controller,
                onSubmitted: (newValue) {
                  if (newValue.trim().isNotEmpty) {
                    updateRow(rowIndex, newValue);
                  }
                  Navigator.pop(context);
                },
                maxLength: crossword[rowIndex].length,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                style: const TextStyle(fontSize: 24),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                String newValue = controller.text
                    .trim(); // Ambil nilai dari controller dan trim spasi

                // Cek apakah input kosong, jika ya, jangan lakukan apapun
                if (newValue.isEmpty) {
                  Navigator.pop(context); // Tutup dialog jika input kosong
                  return;
                }

                updateRow(rowIndex,
                    newValue); // Hanya update row jika input tidak kosong
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    ).then((_) {
      _focusNode.unfocus();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crossword Grid'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Score: $score',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                clues[activeClueIndex],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: List.generate(crossword.length, (rowIndex) {
                return Row(
                  children:
                      List.generate(crossword[rowIndex].length, (colIndex) {
                    Color borderColor = Colors.black;

                    if (isCorrectRow[rowIndex]) {
                      borderColor = Colors.green;
                    } else if (isRowWrong[rowIndex]) {
                      borderColor = Colors.red;
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!isCorrectRow[rowIndex]) {
                            setState(() {
                              activeClueIndex = rowIndex;
                            });
                            showAnswerInputDialog(context, rowIndex);
                          }
                        },
                        child: SizedBox(
                          width: 65,
                          height: 65,
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: borderColor, width: 2.0),
                            ),
                            child: Text(
                              crossword[rowIndex][colIndex],
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}