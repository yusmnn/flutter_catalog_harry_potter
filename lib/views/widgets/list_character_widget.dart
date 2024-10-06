import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import '../utils/sizes.dart';
import '../utils/spaces.dart';
import 'house_chip_widget.dart';

class ListCharacterWidget extends StatelessWidget {
  final String? name;
  final String? house;
  final String? actor;
  final String? image;
  final VoidCallback onTap;

  const ListCharacterWidget({
    super.key,
    required this.name,
    required this.house,
    required this.actor,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    late Size size = Sizes(context).screenSize;
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: FancyShimmerImage(
                      height: size.height * 0.12,
                      width: size.width * 0.28,
                      boxFit: BoxFit.cover,
                      imageUrl: image ?? "",
                      errorWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.error,
                              color: Colors.white, size: 32),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Image Error",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceWidth(8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HouseChipWidget(house: house),
                      const SpaceHeight(8),
                      Text(
                        name ?? "No Name",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SpaceHeight(8),
                      Text(
                        actor ?? "No Name",
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
