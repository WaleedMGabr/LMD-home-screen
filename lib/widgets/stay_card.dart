import 'package:flutter/material.dart';

import '../models/stay.dart';
import '../theme/app_theme.dart';

class StayCard extends StatelessWidget {
  const StayCard({super.key, required this.stay});

  final Stay stay;

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        padding: const EdgeInsets.all(12),
        decoration: outlined(radius: 18, shadow: true),
        child: Row(children: [
          Container(
            width: 112,
            height: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: stay.color,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Stack(children: [
              const Positioned(left: 8, top: 8, child: _DealBadge()),
              Center(child: Icon(stay.icon, color: navy, size: 32)),
            ]),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stay.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    height: 1.12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Color(0xFF9AA6B7),
                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      stay.place,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF58677C),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  _Rating(stay.rating, stay.reviews),
                ]),
                const Spacer(),
                Text(
                  stay.price,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ]),
      );
}

class _DealBadge extends StatelessWidget {
  const _DealBadge();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: const Color(0xFFFF4444),
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Text(
          'Live Deal',
          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800),
        ),
      );
}

class _Rating extends StatelessWidget {
  const _Rating(this.rating, this.reviews);

  final String rating;
  final String reviews;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          '★ $rating ($reviews)',
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
      );
}
