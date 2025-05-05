import 'package:flutter/material.dart';
import 'dart:async';


void main() {
  runApp(const MyApp());
}

/// Main App sets up named routes for:
/// • SplashScreen (first splash screen)
/// • StartingScreen (welcome)
/// • LevelScreen (choose between Ingredients & Oven levels)
/// • IngredientsScreen (the Ingredients Level)
/// • TimerScreen (the Oven Level)
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Decoder Game',
      debugShowCheckedModeBanner: false,
      // Set the splash screen as the first screen.
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/': (context) => const StartingScreen(),
        '/level': (context) => const LevelScreen(),
        '/ingredients': (context) => const IngredientsScreen(),
        '/oven': (context) => const TimerScreen(),
      },
    );
  }
}

/// SplashScreen is displayed at the very beginning.
/// After a specified duration, it automatically navigates to the StartingScreen.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Change the duration as needed.
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 133, 57, 0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Minimizes extra space
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            
               Image.asset(
              'assets/Logo.png',
              width: 500,
              height: 500,
            ),
            // Shift the second image upward by 20 pixels.
            Transform.translate(
              offset: const Offset(0, -150),
              child: Image.asset(
                'assets/name.png',
                width: 300,
                height: 300,
              ),
            ),


            Transform.translate(
              offset: const Offset(0, -120),
              child: const CircularProgressIndicator(color: Colors.white),
            ),

            
          ],
        ),
      ),
    );
  }
}


/// StartingScreen is the welcome page with header and buttons.
class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use Stack to layer the background image and content.
      body: Stack(
        children: [
          // Background image container.
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Main.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground content.
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 120),
                // Header container that spans full width.
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  color: const Color.fromARGB(255, 49, 13, 0).withOpacity(0.8),
                  child: const Text(
                    'Smarty Chef',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black38,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Expanded area for the buttons.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, '/level');
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                              backgroundColor: const Color.fromARGB(218, 130, 35, 0)
                            ),
                            child: const Text(
                              'Start',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
                                  content: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Welcome Smarty Chef!',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 49, 13, 0),),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        '- Tap "Start" to begin.',
                                        textAlign: TextAlign.left, style: TextStyle(color: Color.fromARGB(255, 49, 13, 0),),
                                      ),
                                      Text(
                                        '- Follow the instructions on the screen.',
                                        textAlign: TextAlign.left, style: TextStyle( color: Color.fromARGB(255, 49, 13, 0),),
                                      ),
                                      Text(
                                        '- Have fun cooking smartly!',
                                        textAlign: TextAlign.left, style: TextStyle( color: Color.fromARGB(255, 49, 13, 0),),
                                      ),
                                      SizedBox(height: 10),
                                      Divider(
                                        color: Color.fromARGB(255, 49, 13, 0),
                                        thickness: 1,
                                      ),
                                    ],
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(255, 130, 35, 0)
                                      ),
                                      child: const Text('Great!', style: TextStyle(fontSize: 20, color:Colors.white )),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 20),
                              backgroundColor: const Color.fromARGB(218, 130, 35, 0),
                            ),
                            child: const Text(
                              'Instructions',
                              style: TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class LevelScreen extends StatefulWidget {
  const LevelScreen({super.key});

  // Static variable to track win status persistently.
  static bool ingredientsCompleted = false;

  @override
  _LevelScreenState createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background image is added using a Stack.
      body: Stack(
        children: [
          // Background image container.
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Main.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Main UI overlay.
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  // Top row with a home icon on the left.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.home,
                          size: 50,
                          color: Color.fromARGB(255, 49, 13, 0),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                      ),
                    ],
                  ),
                  // Transparent black bar with "Levels" text.
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    color: const Color.fromARGB(255, 49, 13, 0).withOpacity(0.8),
                    child: const Text(
                      'Levels',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Pacifico',
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black38,
                            offset: Offset(3, 3),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Expanded center for positioning the buttons.
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 0),
                          ElevatedButton(
                            onPressed: () async {
                              final result = await Navigator.pushNamed(context, '/ingredients');
                              if (result == true) {
                                setState(() {
                                  // Update the static flag: once true, it stays active.
                                  LevelScreen.ingredientsCompleted = true;
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 18),
                              backgroundColor: const Color.fromARGB(229, 130, 28, 0),
                            ),
                            child: const Text(
                              "Ingredients",
                              style: TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            // Use the static variable to decide if the Oven button should be active.
                            onPressed: LevelScreen.ingredientsCompleted
                                ? () {
                                    Navigator.pushReplacementNamed(context, '/oven');
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 118, vertical: 18),
                              backgroundColor: LevelScreen.ingredientsCompleted
                                  ? const Color.fromARGB(229, 130, 28, 0)
                                  : const Color.fromARGB(255, 76, 76, 76),
                            ),
                            child: Text(
                              "Oven",
                              style: TextStyle(
                                fontSize: 25,
                                color: LevelScreen.ingredientsCompleted
                                    ? Colors.white
                                    : const Color.fromARGB(255, 102, 102, 102),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// IngredientsScreen implements the Ingredients Level.
/// It shows one puzzle at a time with immediate visual feedback for the answer buttons.
/// When all puzzles are solved correctly, a success dialog appears and the screen pops, returning true.


/// Model class for an ingredient puzzle.
class IngredientPuzzle {
  final String ingredient;
  final String cipher;
  final List<String> choices;

  IngredientPuzzle({
    required this.ingredient,
    required this.cipher,
    required this.choices,
  });
}



class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});
  @override
  _IngredientsScreenState createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  int currentIndex = 0;
  int? _selectedChoiceIndex;
  final List<IngredientPuzzle> puzzles = [
    IngredientPuzzle(
      ingredient: 'Dough',
      cipher: ' 4 15 21 7 8 ',
      choices: ['Dough', 'Sauce', 'Cheese', 'Pepperoni'],
    ),
    IngredientPuzzle(
      ingredient: 'Sauce',
      cipher: ' 19 1 21 3 5 ',
      choices: ['Pesto', 'Sauce', 'Dough', 'Olive Oil'],
    ),
    IngredientPuzzle(
      ingredient: 'Cheese',
      cipher: ' 3 8 5 5 19 5 ',
      choices: ['Sauce', 'Cheese', 'Basil', 'Oregano'],
    ),
    IngredientPuzzle(
      ingredient: 'Pepperoni',
      cipher: ' 16 5 16 16 5 18 15 14 9 ',
      choices: ['Chicken', 'Ham', 'Pepperoni', 'Beef'],
    ),
  ];

  Future<void> _handleAnswer(int index) async {
    final currentPuzzle = puzzles[currentIndex];
    bool isCorrect = currentPuzzle.choices[index] == currentPuzzle.ingredient;
    setState(() {
      _selectedChoiceIndex = index;
    });
    await Future.delayed(const Duration(seconds: 1));
    if (isCorrect) {
      if (currentIndex < puzzles.length - 1) {
        setState(() {
          currentIndex++;
          _selectedChoiceIndex = null;
        });
      } else {
        // When the final puzzle is solved, show the win dialog and return true.
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Center(
              child: Text(
                "Awesome!\n What a GENIUS Chef!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 55, 15, 0))
              ),
            ),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "All ingredients decoded correctly!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color.fromARGB(255, 55, 15, 0))
                ),
                SizedBox(height: 20),
                Divider(color: Color.fromARGB(255, 55, 15, 0)),
                SizedBox(height: 0),
              ],
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Dismiss the dialog.
                  Navigator.pop(context, true); // Pop IngredientsScreen, returning true.
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(234, 130, 35, 0),
                ),
                child: const Text(
                  'Cool!',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Center(child: Text("Game Over")),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Wrong answer. \nThink more Smarty Chef!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
              ),
              SizedBox(height: 20),
              Divider(color: Color.fromARGB(255, 55, 15, 0)),
              SizedBox(height: 0),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  currentIndex = 0;
                  _selectedChoiceIndex = null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(234, 130, 35, 0),
              ),
              child: const Text('Restart', style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/level');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(234, 130, 35, 0),
              ),
              child: const Text('Levels', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    }
  }

  void _showInstructions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(child: Text("Instructions", style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)))),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Each number corresponds to a letter in the alphabet (1 = A, 2 = B, etc.).\n\nSolve the cipher by choosing the correct ingredient for the pizza.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
            ),
            SizedBox(height: 30),
            Divider(color: Color.fromARGB(255, 55, 15, 0)),
            SizedBox(height: 10),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(234, 130, 35, 0),
            ),
            child: const Text('Got it!', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPuzzle = puzzles[currentIndex];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image container.
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/ingredients.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Main content overlay.
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Top row with a bigger help icon.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.help_outline,
                            size: 40,
                            color: Color.fromARGB(255, 55, 15, 0),
                          ),
                          onPressed: _showInstructions,
                        )
                      ],
                    ),
                    const SizedBox(height: 90),
                    const SizedBox(height: 70),
                    // Cipher bar for the puzzle.
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                      decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(8),
                        // Optional: Adding a semi-transparent background for better readability.
                        color: const Color.fromARGB(205, 255, 255, 255).withOpacity(0.8),
                      ),
                      child: Text(
                        currentPuzzle.cipher,
                        style: const TextStyle(fontSize: 24, color: Color.fromARGB(255, 141, 39, 2)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Answer choice buttons.
                    ...currentPuzzle.choices.asMap().entries.map((entry) {
                      int index = entry.key;
                      String choice = entry.value;
                      Color? buttonColor;
                      if (_selectedChoiceIndex != null && _selectedChoiceIndex == index) {
                        buttonColor = (choice == currentPuzzle.ingredient) ? Colors.green : Colors.red;
                      }
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor ?? const Color.fromARGB(176, 141, 39, 2),
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                          ),
                          onPressed: () {
                            if (_selectedChoiceIndex == null) {
                              _handleAnswer(index);
                            }
                          },
                          child: Text(
                            choice,
                            style: const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    Text(
                      "${currentIndex + 1}/${puzzles.length}",
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 55, 15, 0)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Define a custom text style to be used in the popup.
const customTextStyle = TextStyle(fontSize: 20, color: Colors.black87);

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _counter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Automatically show instructions when the level starts.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showInstructions();
    });
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() {
      _counter = 0;
    });
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_counter < 200) {
          _counter++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _checkCounter() {
    _timer?.cancel();
    String message;
    bool isWin = false;
    if (_counter == 45) {
      message = 'Amazing!\nPizza is ready to eat!';
      isWin = true;
    } else if (_counter < 45) {
      message = "Oh no! The pizza isn't cooked yet!";
    } else {
      message = "You burned the pizza!!";
    }

    if (isWin) {
      // Win scenario: show a popup with a divider above the button.
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text(
              "You Win!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Divider(color: Color.fromARGB(255, 55, 15, 0)),
              const SizedBox(height: 10),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog.
                Navigator.pushReplacementNamed(context, '/level');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(234, 130, 35, 0),
              ),
              child: const Text(
                "Levels",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    } else {
      // Loss scenario: show a popup with an extra text line, a divider, and two buttons.
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Center(
            child: Text(
              "Game Over",
              style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
              ),
              const SizedBox(height: 20),
              Text(
                "You closed the oven at: $_counter s!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color.fromARGB(255, 55, 15, 0)),
              const SizedBox(height: 10),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog.
                setState(() {
                  _counter = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(234, 130, 35, 0),
              ),
              child: const Text(
                "Restart",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Dismiss the dialog.
                Navigator.pushReplacementNamed(context, '/level');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(234, 130, 35, 0),
              ),
              child: const Text(
                "Levels",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }
  }

  void _showInstructions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(
          child:
              Text("Instructions", style: TextStyle(color: Color.fromARGB(255, 55, 15, 0))),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Turn on the oven to start the timer. When you think the pizza is ready, Turn it off! \nIt need 45s, Timing is crucial!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
            ),
            SizedBox(height: 5),
            Divider(color: Color.fromARGB(255, 55, 15, 0)),
            SizedBox(height: 2),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(234, 130, 35, 0),
            ),
            child: const Text(
              'Count on me!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a Stack so that the background image fills the entire screen.
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Timer.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.help_outline,
                            size: 40,
                            color: Color.fromARGB(255, 55, 15, 0),
                          ),
                          onPressed: _showInstructions,
                        )
                      ],
                    ),
                    const SizedBox(height: 130),
                    /*const Text(
                      "Pizza needs 45 s to finish!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 214, 0, 0)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 80),*/
                    ElevatedButton(
                      onPressed: _startTimer,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                        backgroundColor: const Color.fromARGB(234, 130, 35, 0),
                      ),
                      child: const Text(
                        'Turn on the oven',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 110),
                    Text(
                      '$_counter',
                      style: const TextStyle(fontSize: 140, color: Color.fromARGB(255, 0, 0, 0)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 90),
                    ElevatedButton(
                      onPressed: _checkCounter,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 95, vertical: 16),
                        backgroundColor: const Color.fromARGB(234, 130, 35, 0),
                      ),
                      child: const Text(
                        "Turn off!",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ResultScreen shows the outcome of the Oven Level.
class ResultScreen extends StatelessWidget {
  final int counter;
  final String message;
  final bool isWin;

  const ResultScreen({
    super.key,
    required this.counter,
    required this.message,
    required this.isWin,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Using a Stack to ensure the background image covers the entire screen.
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Timer.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      message,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "You closed the oven at: $counter s!",
                      style: const TextStyle(color: Color.fromARGB(255, 55, 15, 0)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "Home",
                        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 55, 15, 0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}