import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class DestinationField extends StatelessWidget {
  const DestinationField({super.key});

  @override
  Widget build(BuildContext context) => Container(
        height: 58,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: outlined(radius: 30),
        child: const Row(children: [
          Icon(Icons.location_on_outlined, color: subtleText, size: 21),
          SizedBox(width: 12),
          Expanded(child: Text('Where are you heading?', overflow: TextOverflow.ellipsis, style: TextStyle(color: subtleText, fontWeight: FontWeight.w700, fontSize: 16))),
          RoundIcon(Icons.notifications_none_rounded),
        ]),
      );
}

class SearchSummary extends StatelessWidget {
  const SearchSummary({super.key, required this.narrow});

  final bool narrow;

  @override
  Widget build(BuildContext context) {
    const items = [
      _SearchItem(Icons.calendar_month_outlined, 'CHECK-IN', '29 Sep, Tue'),
      _SearchItem(Icons.calendar_month_outlined, 'CHECK-OUT', '30 Sep, Wed'),
      _SearchItem(Icons.person_outline, 'GUESTS', '2 Guests, 1 Room'),
    ];
    final fields = items.map((item) => SearchItemView(item: item)).toList();
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: outlined(radius: 18, shadow: true),
      child: narrow
          ? Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              ...fields.map((field) => Padding(padding: const EdgeInsets.only(bottom: 11), child: field)),
              const DarkButton(label: 'Search'),
            ])
          : Row(children: [
              Expanded(child: fields[0]),
              const _VLine(),
              Expanded(child: fields[1]),
              const _VLine(),
              Expanded(child: fields[2]),
              const SizedBox(width: 12),
              const DarkButton(label: 'Search'),
            ]),
    );
  }
}

class _SearchItem {
  const _SearchItem(this.icon, this.title, this.value);
  final IconData icon;
  final String title;
  final String value;
}

class SearchItemView extends StatelessWidget {
  const SearchItemView({super.key, required this.item});
  final _SearchItem item;

  @override
  Widget build(BuildContext context) => Row(children: [
        RoundIcon(item.icon, filled: true),
        const SizedBox(width: 11),
        Expanded(child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(item.title, style: const TextStyle(color: subtleText, fontWeight: FontWeight.w800, fontSize: 11, letterSpacing: .6)),
          const SizedBox(height: 2),
          Text(item.value, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
        ])),
      ]);
}

class DarkButton extends StatelessWidget {
  const DarkButton({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) => Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.center,
        decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(14)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.search, color: Colors.white, size: 18),
          const SizedBox(width: 9),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800)),
        ]),
      );
}

class RoundIcon extends StatelessWidget {
  const RoundIcon(this.icon, {super.key, this.filled = false});
  final IconData icon;
  final bool filled;

  @override
  Widget build(BuildContext context) => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: filled ? const Color(0xFFF4F5F7) : const Color(0xFFF7F8FA),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: navy, size: 20),
      );
}

class _VLine extends StatelessWidget {
  const _VLine();
  @override
  Widget build(BuildContext context) => const SizedBox(height: 36, child: VerticalDivider(width: 1, color: Color(0xFFEDF0F4)));
}
