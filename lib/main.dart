import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
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
          builder: (context) => const Layout(),
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

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_FallingStar> _stars = [];

  @override
  void initState() {
    super.initState();

    // Create an animation controller for the stars
    _controller = AnimationController(
      duration: const Duration(seconds: 6), // Duration for full effect
      vsync: this,
    )..repeat(); // Loop animation

    // Generate random stars
    for (int i = 0; i < 15; i++) {
      _stars.add(_FallingStar(delayFactor: i * 0.1)); // Delay factor for sequential falling
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/Background Galaxy.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 55.0),
                    child: Text(
                      'Spaceword',
                      style: TextStyle(
                        fontFamily: 'FontdinerSwanky',
                        color: const Color(0xFFFFF50B),
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: const Offset(2.0, 2.0),
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
                      minimumSize: const Size(120, 50),
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
          // Add the falling star animation with smoke trails and bling effect
          ..._stars.map((star) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double animationValue = (_controller.value + star.delayFactor) % 1;

                // Star and smoke trail
                return Stack(
                  children: [
                    // Smoke trail behind the star
                    Positioned(
                      left: star.getXPosition(animationValue),
                      top: star.getYPosition(animationValue) - star.size / 2,
                      child: Opacity(
                        opacity: 1 - animationValue, // Fades out as it falls
                        child: Icon(
                          Icons.circle,
                          color: Colors.grey.withOpacity(0.2),
                          size: star.size * 1.5, // Slightly larger for the trail effect
                        ),
                      ),
                    ),
                    // Falling star with rotation, bling, and shadow
                    Positioned(
                      left: star.getXPosition(animationValue),
                      top: star.getYPosition(animationValue),
                      child: Transform.rotate(
                        angle: animationValue * 2 * pi * star.rotationSpeed,
                        child: Transform.scale(
                          scale: 1 + 0.3 * sin(animationValue * 2 * pi * star.twinkleSpeed), // Enhanced bling
                          child: Icon(
                            Icons.star,
                            color: Colors.white, // White for bright effect
                            size: star.size,
                            shadows: [
                              Shadow(
                                color: Colors.blueAccent.withOpacity(0.7), // Glow shadow
                                blurRadius: 10,
                              ),
                              Shadow(
                                color: Colors.yellowAccent.withOpacity(0.5),
                                blurRadius: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

// Helper class for individual falling stars with added smoke trail and delay
class _FallingStar {
  final double size;
  final double speed;
  final double rotationSpeed;
  final double twinkleSpeed;
  final double delayFactor;

  _FallingStar({required this.delayFactor})
      : size = Random().nextDouble() * 8 + 8,    // Random smaller size for more realism
        speed = Random().nextDouble() * 2 + 0.5, // Random speed multiplier
        rotationSpeed = Random().nextDouble() * 2, // Random rotation speed for asteroid effect
        twinkleSpeed = Random().nextDouble() * 2 + 0.5; // Random twinkle speed

  double getXPosition(double animationValue) {
    return 400 - animationValue * 600 * speed; // Diagonal movement from right to left
  }

  double getYPosition(double animationValue) {
    return animationValue * 800 * speed; // Vertical downward movement
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
                  padding: EdgeInsets.only(right: 8.0),
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
                    IconData(0xeea2, fontFamily: 'MaterialIcons'),
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
                const SizedBox(height: 80), // jarak atas layar dan tombol
                SizedBox(
                  width: 200,
                  child: _buildStrokeButton(
                    color: const Color(0xFF18F513),
                    text: 'EASY',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EasyLevel()),
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
                          MaterialPageRoute(
                              builder: (context) => const MediumLevel()));
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
                          MaterialPageRoute(
                              builder: (context) => const HardLevel()));
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(
                        IconData(0xef4c, fontFamily: 'MaterialIcons'),
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
          backgroundColor: color.withOpacity(0),
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
                color: Color(0xFF000000),
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
    'assets/clothes/Kostum Koki Revisi lagi.png',
    'assets/clothes/Kostum Raja.png',
    'assets/clothes/Kostum Domba.png',
    'assets/clothes/Kostum Rubah.png',
    'assets/clothes/Kostum Sapi.png',
    'assets/clothes/Kostum Santa.png',
    'assets/clothes/Kostum Superhero.png',
  ];

  final List<int> clothesPrices = [
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    1000
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
      purchasedBodies =
          prefs.getStringList('purchasedBodies') ?? [bodyAssets[0]];
      purchasedClothes =
          prefs.getStringList('purchasedClothes') ?? [clothesAssets[0]];
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
        SnackBar(
            content: Text('You have purchased $itemType for $price coins!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Not enough coins!')),
      );
    }
  }

  void showConfirmationDialog(
      BuildContext context, String itemType, String item, int price) {
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: clothesAssets.length,
                    itemBuilder: (context, index) {
                      final isPurchased =
                          purchasedClothes.contains(clothesAssets[index]);
                      return GestureDetector(
                        onTap: () {
                          if (isPurchased) {
                            selectItem(clothesAssets[index], 'clothes');
                          } else {
                            showConfirmationDialog(context, 'clothes',
                                clothesAssets[index], clothesPrices[index]);
                          }
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 7, top: 11, right: 7),
                          decoration: BoxDecoration(
                            color: isPurchased
                                ? Colors.grey
                                : const Color.fromARGB(255, 239, 223, 253),
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: bodyAssets.length,
                    itemBuilder: (context, index) {
                      final isPurchased =
                          purchasedBodies.contains(bodyAssets[index]);
                      return GestureDetector(
                        onTap: () {
                          if (isPurchased) {
                            selectItem(bodyAssets[index], 'body');
                          } else {
                            showConfirmationDialog(context, 'body',
                                bodyAssets[index], bodyPrices[index]);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              left: 7, top: 9, right: 7, bottom: 11),
                          decoration: BoxDecoration(
                            color: isPurchased
                                ? Colors.grey
                                : const Color(0xFFBB84F3),
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
  _EasyLevelState createState() => _EasyLevelState();
}

class _EasyLevelState extends State<EasyLevel>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  Timer? timer;
  int timerCount = 30;
  int score = 0;
  int remainingTime = 30;

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
    "Hewan yang memiliki tanduk",
    "Alat yang digunakan untuk jual beli",
    "Melihat dengan menggunakan ...",
    "Lawan kata dekat",
  ];

  int activeClueIndex = 0;
  List<bool> isCorrectRow = [false, false, false, false, false];
  List<bool> isRowWrong = [false, false, false, false, false];
  String statusMessage = '';
  Color statusColor = Colors.white;
  double statusMessageYPosition = 200;

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;


  @override
    void initState() {
      super.initState();
      startTime();

      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
    );

      _opacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void addScore1(int points) {
    setState(() {
      score += points;
    });

    if (isCorrectRow.every((row) => row)) {
      showFinalPopup(true);
      timer?.cancel();
    }
  }

  void showFinalPopup(bool isWin) {
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return isWin ? WinPopup(score: score) : LosePopup(score: score);
        },
      );
    });
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        if (!allRowsCorrect()) {
          showFinalPopup(false);
        }
      }
    });
  }

  bool allRowsCorrect() {
    return isCorrectRow.every((correct) => correct);
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
        if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        for (int i = 0; i < crossword[rowIndex].length; i++) {
          crossword[rowIndex][i] = ''; // kolom akan tetap kosong
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
        statusMessage = 'BENAR!';
        statusColor = Colors.green;
        _animationController.forward(from: 0.0);


        remainingTime += 3;
        addScore1(5);
      } else {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        statusMessage = 'SALAH!';
        statusColor = const Color.fromARGB(255, 207, 17, 4);
        _animationController.forward(from: 0.0);
      }

      if (isCorrectRow.every((row) => row)) {
        showFinalPopup(true);
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
          title: Text(clues[rowIndex],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                String newValue = controller.text.trim();
                if (newValue.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                updateRow(rowIndex, newValue);
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Waktu: $remainingTime detik',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Score: $score',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Column(
                  children: List.generate(crossword.length, (rowIndex) {
                    return Row(
                      children:
                          List.generate(crossword[rowIndex].length, (colIndex) {
                        Color borderColor = const Color.fromARGB(255, 255, 255, 255);

                        if (isCorrectRow[rowIndex]) {
                          borderColor = Colors.green;
                        } else if (isRowWrong[rowIndex]) {
                          borderColor = Colors.red;
                        }

                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showAnswerInputDialog(context, rowIndex);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: borderColor, width: 2.0),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Center(
                                  child: Text(
                                    crossword[rowIndex][colIndex],
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
                ),
                const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        statusMessage,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
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

class _MediumLevelState extends State<MediumLevel>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  Timer? timer;
  int timerCount = 20;
  int score = 0;
  int remainingTime = 20;

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
  List<Offset> emotePositions = [];
  List<IconData> emotes = [];
  String statusMessage = '';
  Color statusColor = Colors.white;
  double statusMessageYPosition = 100;

  late AnimationController _emoteController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    startTime();

    _emoteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _emoteController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _focusNode.dispose();
    _emoteController.dispose();
    super.dispose();
  }

  void addScore1(int points) {
    setState(() {
      score += points;
    });

    if (isCorrectRow.every((row) => row)) {
      showFinalPopup(true);
      timer?.cancel();
    }
  }

  void showFinalPopup(bool isWin) {
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return isWin ? WinPopup(score: score) : LosePopup(score: score);
        },
      );
    });
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        if (!allRowsCorrect()) {
          showFinalPopup(false);
        }
      }
    });
  }

  bool allRowsCorrect() {
    return isCorrectRow.every((correct) => correct);
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        triggerSadEmotes();
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
        triggerHappyEmotes();
        remainingTime += 1;
        addScore1(3);
      } else {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        triggerSadEmotes();
      }

      if (isCorrectRow.every((row) => row)) {
        showFinalPopup(true);
      }
    });
  }

  void _animateStatusMessage() {
    setState(() {
      statusMessageYPosition = MediaQuery.of(context).size.height - 40;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        statusMessageYPosition = 0;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        statusMessage = '';
      });
    });
  }

  void triggerHappyEmotes() {
    setState(() {
      emotePositions.clear();
      emotes.clear();
      for (int i = 0; i < 5; i++) {
        emotePositions.add(Offset(
          MediaQuery.of(context).size.width / 5 * (i + 1) - 64,
          MediaQuery.of(context).size.height - 400,
        ));
        emotes.add(Icons.emoji_emotions_outlined);
      }
      statusMessage = 'BENAR!';
      statusColor = Colors.green;
      _emoteController.reset();
      _emoteController.forward();
    });

    _animateStatusMessage();
  }

  void triggerSadEmotes() {
    setState(() {
      emotePositions.clear();
      emotes.clear();
      for (int i = 0; i < 5; i++) {
        emotePositions.add(Offset(
          MediaQuery.of(context).size.width / 5 * (i + 1) - 64,
          MediaQuery.of(context).size.height - 50,
        ));
        emotes.add(Icons.emoji_emotions);
      }
      statusMessage = 'SALAH!';
      statusColor = const Color.fromARGB(255, 207, 17, 4);
      _emoteController.reset();
      _emoteController.forward();
    });

    _animateStatusMessage();
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
          title: Text(clues[rowIndex],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                String newValue = controller.text.trim();
                if (newValue.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                updateRow(rowIndex, newValue);
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Waktu: $remainingTime detik',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Score: $score',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                              showAnswerInputDialog(context, rowIndex);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: borderColor, width: 2.0),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Center(
                                  child: Text(
                                    crossword[rowIndex][colIndex],
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
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
          AnimatedBuilder(
            animation: _emoteController,
            builder: (context, child) {
              return Stack(
                children: List.generate(emotePositions.length, (index) {
                  return Positioned(
                    left: emotePositions[index].dx,
                    top: emotePositions[index].dy -
                        (MediaQuery.of(context).size.height *
                            _emoteController.value),
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: statusMessageYPosition,
            child: Center(
              child: Text(
                statusMessage,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                  fontFamily: 'FontdinerSwanky',
                ),
              ),
            ),
          ),
        ],
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

class _HardLevelState extends State<HardLevel>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  Timer? timer;
  int timerCount = 30;
  int score = 0;
  int remainingTime = 30;

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
  List<Offset> emotePositions = [];
  List<IconData> emotes = [];
  String statusMessage = '';
  Color statusColor = Colors.white;
  double statusMessageYPosition = 200;

  late AnimationController _emoteController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    startTime();

    _emoteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _opacityAnimation = Tween<double>(begin: 1.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _emoteController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    _focusNode.dispose();
    _emoteController.dispose();
    super.dispose();
  }

  void addScore1(int points) {
    setState(() {
      score += points;
    });

    if (isCorrectRow.every((row) => row)) {
      showFinalPopup(true);
      timer?.cancel();
    }
  }

  void showFinalPopup(bool isWin) {
    Future.delayed(const Duration(seconds: 2), () {
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return isWin ? WinPopup(score: score) : LosePopup(score: score);
        },
      );
    });
  }

  void startTime() {
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        if (!allRowsCorrect()) {
          showFinalPopup(false);
        }
      }
    });
  }

  bool allRowsCorrect() {
    return isCorrectRow.every((correct) => correct);
  }

  void updateRow(int rowIndex, String newRowValue) {
    setState(() {
      if (newRowValue.length != correctAnswers[rowIndex].length) {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        triggerSadEmotes();
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
        triggerHappyEmotes();
        remainingTime += 3;
        addScore1(5);
      } else {
        isRowWrong[rowIndex] = true;
        crossword[rowIndex].fillRange(0, crossword[rowIndex].length, '');
        triggerSadEmotes();
      }

      if (isCorrectRow.every((row) => row)) {
        showFinalPopup(true);
      }
    });
  }

  void _animateStatusMessage() {
    setState(() {
      statusMessageYPosition = MediaQuery.of(context).size.height - 100;
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        statusMessageYPosition = 0;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        statusMessage = '';
      });
    });
  }

  void triggerHappyEmotes() {
    setState(() {
      emotePositions.clear();
      emotes.clear();
      for (int i = 0; i < 5; i++) {
        emotePositions.add(Offset(
          MediaQuery.of(context).size.width / 5 * (i + 1) - 64,
          MediaQuery.of(context).size.height - 100,
        ));
        emotes.add(Icons.emoji_emotions_outlined);
      }
      statusMessage = 'BENAR!';
      statusColor = Colors.green;
      _emoteController.reset();
      _emoteController.forward();
    });

    _animateStatusMessage();
  }

  void triggerSadEmotes() {
    setState(() {
      emotePositions.clear();
      emotes.clear();
      for (int i = 0; i < 5; i++) {
        emotePositions.add(Offset(
          MediaQuery.of(context).size.width / 5 * (i + 1) - 64,
          MediaQuery.of(context).size.height - 150,
        ));
        emotes.add(Icons.emoji_emotions);
      }
      statusMessage = 'SALAH!';
      statusColor = const Color.fromARGB(255, 207, 17, 4);
      _emoteController.reset();
      _emoteController.forward();
    });

    _animateStatusMessage();
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
          title: Text(clues[rowIndex],
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                String newValue = controller.text.trim();
                if (newValue.isEmpty) {
                  Navigator.pop(context);
                  return;
                }

                updateRow(rowIndex, newValue);
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Waktu: $remainingTime detik',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Score: $score',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                              showAnswerInputDialog(context, rowIndex);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: borderColor, width: 2.0),
                              ),
                              child: AspectRatio(
                                aspectRatio: 1.0,
                                child: Center(
                                  child: Text(
                                    crossword[rowIndex][colIndex],
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
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
          AnimatedBuilder(
            animation: _emoteController,
            builder: (context, child) {
              return Stack(
                children: List.generate(emotePositions.length, (index) {
                  return Positioned(
                    left: emotePositions[index].dx,
                    top: emotePositions[index].dy -
                        (MediaQuery.of(context).size.height *
                            _emoteController.value),
                    child: Opacity(
                      opacity: _opacityAnimation.value,
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: statusMessageYPosition,
            child: Center(
              child: Text(
                statusMessage,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                  fontFamily: 'FontdinerSwanky',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LosePopup extends StatefulWidget {
  final int score;

  const LosePopup({super.key, required this.score});

  @override
  // ignore: library_private_types_in_public_api
  _LosePopupState createState() => _LosePopupState();
}

class _LosePopupState extends State<LosePopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
              height: 320,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 227, 255),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 50,
                    child: Column(
                      children: [
                        const Icon(person, size: 140, color: Colors.black),
                        const SizedBox(height: 1),
                        const Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Score: ${widget.score}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -30,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 196, 32, 20),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "LOSE",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CharacterCustomizationPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Level()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "PLAY",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Layout()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WinPopup extends StatefulWidget {
  final int score;

  const WinPopup({super.key, required this.score});

  @override
  // ignore: library_private_types_in_public_api
  _WinPopupState createState() => _WinPopupState();
}

class _WinPopupState extends State<WinPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..forward();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  static const IconData person = IconData(0xe491, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300,
              height: 320,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 227, 255),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 50,
                    child: Column(
                      children: [
                        const Icon(person, size: 140, color: Colors.black),
                        const SizedBox(height: 1),
                        const Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Score: ${widget.score}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -30,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 23, 196, 20),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "WIN",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CharacterCustomizationPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Icon(
                      Icons.checkroom,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Level()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "PLAY",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Layout()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      backgroundColor: const Color.fromARGB(255, 156, 39, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Icon(
                      Icons.home,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
