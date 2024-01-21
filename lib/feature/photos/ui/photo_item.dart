import 'package:flutter/material.dart';
import 'package:image_gallery/feature/details/ui/photo_details_screen.dart';
import 'package:image_gallery/feature/photos/data/model/photo.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.photo});
  final Photo photo;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PhotoDetails(
                photo: photo,
              ),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              photo.urlSmall,
              fit: BoxFit.fill,
              height: 100,
              width: 100,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        photo.auhtor,
                        style: textTheme.labelMedium,
                      ),
                    ),
                  ),
                  Text(
                    photo.name,
                    style: textTheme.titleMedium,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
