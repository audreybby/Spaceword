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
              const Layout(),
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
              Color(0xFF0D006F),
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
                // Logo splash screen
                Image.asset(
                  'assets/image/LOGO GEM DEV REVISI.png',
                  width: 170,
                ),
                const SizedBox(height: 20),
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
              Color(0xFF0D006F),
              Color(0xFF7509FE), 
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
                        55.0),
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
                            const Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black.withOpacity(0.5),
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
                    ),
                  ),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontFamily: 'FontdinerSwanky',
                    color: Color(0xFFFFF50B),
                    fontSize: 25,
                  ),
                ),
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
              IconData(0xf02db, fontFamily: 'MaterialIcons'),
              color: Color(0xFFFFC700),
              size: 50,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Layout()),
              ); 
            },
          ),
          actions: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      right: 8.0), 
                  child: Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white, 
                      fontSize: 45, 
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    IconData(0xeea2,
                        fontFamily:
                            'MaterialIcons'), 
                    color: Color(0xFFFFC700), 
                    size: 50, 
                  ),
                  onPressed: () {},
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
                  MainAxisAlignment.center, // kolom jadi vertikal
              children: [
                const SizedBox(
                    height: 80), // jarak atas layar dan tombol
                SizedBox(
                  width: 200,
                  child: _buildStrokeButton(
                    color: const Color(0xFF18F513),
                    text: 'EASY',
                    onPressed: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EasyLevel()),
                  );
                    },
                  ),
                ),
                const SizedBox(height: 35),

                SizedBox(
                  width: 200, 
                  child: _buildStrokeButton(
                    color: const Color(0xFFF3DC0E),
                    text: 'MEDIUM',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MediumLevel())
                        );
                    },
                  ),
                ),
                const SizedBox(height: 35),
         
                SizedBox(
                  width: 200,
                  child: _buildStrokeButton(
                    color: const Color(0xFFF82609),
                    text: 'HARD',
                    onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HardLevel())
                      ); 
                    },
                  ),
                ),
                const SizedBox(height: 40), 
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        IconData(0xef4c,
                            fontFamily:
                                'MaterialIcons'), 
                        color: Color(0xFFFFC700), 
                        size: 50,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CustomChr()),
                        ); 
                      },
                    ),
                    const Text(
                      'CUSTOM', 
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, 
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
        color: color, 
        borderRadius: BorderRadius.circular(12), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
            offset: const Offset(4.0, 4.0), 
            blurRadius: 6.0, 
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color
              .withOpacity(0),
          shadowColor: Colors.transparent, 
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), 
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
                    0xFF000000), 
                offset: Offset(2.0, 2.0), 
                blurRadius: 4.0, 
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
              labelText: 'Edit Username',
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

          // Clothes
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

          // Skin 
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
    ['A', 'P', 'E', 'L'],
    ['R', 'U', 'S', 'A'],
    ['U', 'A', 'N', 'G'],
    ['M', 'A', 'T', 'A'],
    ['J', 'A', 'U', 'H'],
  ];

  List<List<String>> crossword = [
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
    ['', '', '', ''],
  ];

  List<String> clues = [
    "Buah yang dimakan snow white",
    "Hewan ...",
    "Alat yang digunakan untuk jual beli",
    "Melihat dengan menggunakan ...",
    "Lawan kata dekat",
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
      // kalau jumlah karakter beda dengan jumlah karakter jawaban benar maka dianggap jawaban salah
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // dan kolom akan tetap kosong
        }
        return;
      }

      // kalau lengkap tetap lanjut pengecekan antara benar atau salah (disesuaiin sama karakter pada jawaban benar)
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
          crossword[rowIndex][i] = ''; // jawaban salah = kolom kosong
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return; // kolom yang sudah terjawab ga bisa dimainkan lagi alias pop up nya ga akan muncul
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
                    .trim(); // spasi = jawaban kosong

                // cek input kosong, kalau kosong = kolom juga tetap kosong
                if (newValue.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                updateRow(rowIndex,
                    newValue); // update row hanya saat jawabannya dah bener
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
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; 
        }
        return;
      }

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
          crossword[rowIndex][i] = '';
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return; 
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
                    .trim(); 
                
                if (newValue.isEmpty) {
                  Navigator.pop(context); 
                  return;
                }

                updateRow(rowIndex,
                    newValue); 
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
    ['L', 'A', 'P', 'T', 'O', 'P'],
    ['P', 'I', 'R', 'I', 'N', 'G'],
    ['A', 'U', 'D', 'R', 'E', 'Y'],
    ['K', 'E', 'R', 'E', 'T', 'A'],
    ['T', 'A', 'N', 'G', 'A', 'N'],
  ];

  List<List<String>> crossword = [
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
    ['', '', '', '', '', ''],
  ];

  List<String> clues = [
    "Gue ngoding paake apa rek",
    "Alas makan",
    "Nama programmer roblox",
    "Transportasi yang berjalan diatas rel",
    "Anggota badan yang digunakan untuk membawa barang",
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
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; 
        }
        return;
      }

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
          crossword[rowIndex][i] = '';
        }
      }
    });
  }

  void showAnswerInputDialog(BuildContext context, int rowIndex) {
    if (isCorrectRow[rowIndex]) {
      return;
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
                    .trim();
                
                if (newValue.isEmpty) {
                  Navigator.pop(context); 
                  return;
                }

                updateRow(rowIndex,
                    newValue);
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
