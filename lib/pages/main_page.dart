import 'package:flutter/material.dart';
import 'package:frontend/model/pokemon_model.dart';
import 'package:frontend/pages/home_page.dart';
import 'package:frontend/pages/login_page.dart';
import 'package:frontend/pages/pokedex_page.dart';

class MainPage extends StatefulWidget {
  final String username;
  final List<Pokemon> pokemonList;
  const MainPage(
      {super.key, required this.username, required this.pokemonList});

  @override
  State<MainPage> createState() => _MainPageState();
}

final ThemeData _lightTheme = ThemeData.light();
final ThemeData _darkTheme = ThemeData.dark();

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  ThemeData _currentTheme = _lightTheme;

  void _toggleTheme(String value) {
    switch (value) {
      case "Light":
        setState(() {
          _currentTheme = _lightTheme;
        });
        break;
      case "Dark":
        setState(() {
          _currentTheme = _darkTheme;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _currentTheme,
      themeMode: ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 50,
            width: 200,
            child: Image.asset("lib/assets/Logo.png"),
          ),
          actions: [
            PopupMenuButton(onSelected: (value) {
              setState(() {
                _toggleTheme(value);
              });
            }, itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "Light",
                  child: Text("Light Mode"),
                ),
                const PopupMenuItem(
                  value: "Dark",
                  child: Text("Dark Mode"),
                ),
              ];
            })
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text("Hi, ${widget.username}"),
              ),
              ListTile(
                title: const Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(pokemonList: widget.pokemonList),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: _pageSelected(currentPageIndex),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
              ),
              selectedIcon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.catching_pokemon,
                size: 30.0,
              ),
              label: "PokeDex",
              tooltip: "View List of Pokemons",
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageSelected(int index) {
    switch (index) {
      case 0:
        return HomePage(pokemonList: widget.pokemonList);
      case 1:
        return PokedexPage(username: widget.username, pokemonList: widget.pokemonList);
      default:
        return Container(
          alignment: Alignment.center,
          child: const Text("Page Not Found!"),
        );
    }
  }
}
