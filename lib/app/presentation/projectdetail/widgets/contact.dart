import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Head Office',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Handyman Smart Home Headquarter',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Villa Bukit Mas RC-29, Surabaya',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'View phone number',
                  style: TextStyle(
                      fontSize: 14,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..color = Colors.grey
                        ..maskFilter =
                            const MaskFilter.blur(BlurStyle.normal, 3)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'View email',
                  style: TextStyle(
                      fontSize: 14,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..color = Colors.grey
                        ..maskFilter =
                            const MaskFilter.blur(BlurStyle.normal, 3)),
                )
              ],
            ),
          ),
          const Divider(),
          const Text(
            'Branch Office',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Handyman Smart Home Makassar',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                const Text(
                  'Jalan Monginsidi Lama No.102, Makassar',
                  style: TextStyle(fontSize: 14),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'View phone number',
                  style: TextStyle(
                      fontSize: 14,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..color = Colors.grey
                        ..maskFilter =
                            const MaskFilter.blur(BlurStyle.normal, 3)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Icon(
                  Icons.mail,
                  size: 20,
                  color: Theme.of(context).colorScheme.surface,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  'View email',
                  style: TextStyle(
                      fontSize: 14,
                      foreground: Paint()
                        ..style = PaintingStyle.fill
                        ..color = Colors.grey
                        ..maskFilter =
                            const MaskFilter.blur(BlurStyle.normal, 3)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
