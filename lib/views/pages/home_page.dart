import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/character_controller.dart';
import '../../models/get_all_character_response_model.dart';
import '../theme/colors_theme.dart';
import '../utils/const.dart';
import '../widgets/list_character_widget.dart';
import '../widgets/search_widget.dart';
import 'detail_character_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CharacterController controller = Get.put(CharacterController());
  final TextEditingController searchController = TextEditingController();
  final TextEditingController filterController = TextEditingController();
  var searchCharacter = <GetAllCharacterResponseModel>[].obs;

  @override
  void initState() {
    super.initState();
    controller.getAllCharacter().then((_) {
      searchCharacter.value = controller.characters;
    });
  }

  void _searchCharacters(String query) {
    final results = controller.characters
        .where((character) =>
            character.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    searchCharacter.value = results;
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text(
            'Filter by House',
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                _filterByHouse(House.gryffindor);
              },
              child: const Text(House.gryffindor),
            ),
            SimpleDialogOption(
              onPressed: () {
                _filterByHouse(House.hufflepuff);
              },
              child: const Text(House.hufflepuff),
            ),
            SimpleDialogOption(
              onPressed: () {
                _filterByHouse(House.ravenclaw);
              },
              child: const Text(House.ravenclaw),
            ),
            SimpleDialogOption(
              onPressed: () {
                _filterByHouse(House.slytherin);
              },
              child: const Text(House.slytherin),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text('Cancel'),
              ),
            ),
          ],
        );
      },
    );
  }

  void _filterByHouse(String house) {
    Navigator.pop(context);
    controller.getCharacterByHouse(house: house).then((_) {
      searchCharacter.value = controller.characterByHouse.map((character) {
        return GetAllCharacterResponseModel(
          id: character.id,
          name: character.name,
          house: character.house,
          actor: character.actor,
          image: character.image,
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Catalog Harry Potter'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchWidget(
                controller: searchController,
                hintText: 'Search Character',
                obscureText: false,
                showLabel: true,
                prefixIcon: const Icon(Icons.search, color: ColorsTheme.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list, color: ColorsTheme.white),
                  onPressed: () {
                    _showFilterDialog();
                  },
                ),
                onChanged: (value) {
                  _searchCharacters(value);
                },
              ),
            ),
          ),
        ),
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (searchCharacter.isEmpty) {
              return const Center(
                child: Text("No characters found"),
              );
            }

            return ListView.builder(
              itemCount: searchCharacter.length,
              itemBuilder: (context, index) {
                final character = searchCharacter[index];
                return ListCharacterWidget(
                  name: character.name,
                  house: character.house,
                  actor: character.actor,
                  image: character.image,
                  onTap: () {
                    Get.to(
                      () => const DetailCharacterPage(),
                      arguments: {
                        'id': character.id,
                        'house': character.house,
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
