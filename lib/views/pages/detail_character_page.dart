import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/character_controller.dart';
import '../theme/colors_theme.dart';
import '../utils/sizes.dart';
import '../utils/spaces.dart';
import '../widgets/house_chip_widget.dart';

class DetailCharacterPage extends StatefulWidget {
  const DetailCharacterPage({super.key});

  @override
  State<DetailCharacterPage> createState() => _DetailCharacterPageState();
}

class _DetailCharacterPageState extends State<DetailCharacterPage> {
  final CharacterController controller = Get.find();

  @override
  void initState() {
    super.initState();
    // Ambil ID karakter dari arguments
    final String? characterId = Get.arguments['id'];
    final String? characterHouse = Get.arguments['house'];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCharacterById(id: characterId!);
      controller.getCharacterByHouse(house: characterHouse!);
    });
  }

  @override
  Widget build(BuildContext context) {
    late Size size = Sizes(context).screenSize;
    return Scaffold(
      backgroundColor: ColorsTheme.blue,
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.characters.isEmpty) {
            return const Center(
              child: Text("Character not found"),
            );
          }

          final character = controller.searchCharacter.value;

          final sameHouseCharacters = controller.characterByHouse;
          return ListView(
            children: [
              Stack(
                children: [
                  FancyShimmerImage(
                    height: size.height * 1 / 3,
                    width: size.width,
                    boxFit: BoxFit.cover,
                    imageUrl: character?.image ?? "",
                    errorWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.white, size: 32),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Image Error",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.black38,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpaceHeight(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          character?.name ?? '',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        HouseChipWidget(
                          house: character?.house,
                        ),
                      ],
                    ),
                    const SpaceHeight(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_3_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SpaceWidth(8),
                        Text(
                          character?.actor ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(16),
                    Divider(
                      color: ColorsTheme.grey.withOpacity(0.5),
                      thickness: 0.5,
                    ),
                    const SpaceHeight(16),
                    if (character?.alternateNames?.isEmpty ?? true)
                      const SizedBox.shrink()
                    else ...[
                      Text(
                        'Alternate Names',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SpaceHeight(8),
                      SizedBox(
                        width: size.width,
                        child: Wrap(
                          spacing: 4,
                          children: character!.alternateNames!
                              .map((alternateName) => Chip(
                                    label: Text(
                                      character.alternateNames!.isEmpty
                                          ? "No Alternate Name"
                                          : alternateName,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: ColorsTheme.darkBlue,
                                    side: const BorderSide(color: Colors.grey),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                    const SpaceHeight(16),
                    Text(
                      'Personal Information',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SpaceHeight(12),
                    Row(
                      children: [
                        const Icon(
                          Icons.cake_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SpaceWidth(8),
                        Text(
                          character?.dateOfBirth ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8),
                    Row(
                      children: [
                        Icon(
                          character!.gender == "male"
                              ? Icons.male_rounded
                              : Icons.female_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SpaceWidth(8),
                        Text(
                          character.gender ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SpaceHeight(8),
                    Row(
                      children: [
                        const Icon(
                          Icons.accessibility_rounded,
                          size: 24,
                          color: Colors.white,
                        ),
                        const SpaceWidth(8),
                        Text(
                          '${character.species ?? ''} - ${character.eyeColour ?? ''} eyes - ${character.hairColour ?? ''} hair',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SpaceHeight(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Other Character',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SpaceHeight(12),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sameHouseCharacters.length,
                  itemBuilder: (context, index) {
                    final char = sameHouseCharacters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: ColorsTheme.darkBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: FancyShimmerImage(
                                height: size.height * 0.16,
                                width: size.width,
                                boxFit: BoxFit.cover,
                                imageUrl: char.image ?? "",
                                errorWidget: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error,
                                        color: Colors.white, size: 32),
                                    Text(
                                      "Image Error",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SpaceHeight(8),
                            Text(
                              char.name ?? "No Name",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white, fontSize: 14),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            const SpaceHeight(2),
                            Text(
                              char.actor ?? "Unknown Actor",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(color: Colors.grey[400]),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
