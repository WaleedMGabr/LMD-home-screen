import 'package:flutter/material.dart';

import '../data/stays.dart';
import '../models/stay.dart';
import '../theme/app_theme.dart';
import '../widgets/search_controls.dart';
import '../widgets/stay_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: LayoutBuilder(builder: (context, page) {
            final showGutters = page.maxWidth >= 1100;
            return Row(children: [
              if (showGutters) const _Gutter(width: 148),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(page.maxWidth < 600 ? 12 : 22),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1520),
                      child: const _HomeContent(),
                    ),
                  ),
                ),
              ),
              if (showGutters) const _Gutter(width: 132),
            ]);
          }),
        ),
      );
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, size) {
        final narrow = size.maxWidth < 680;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const DestinationField(),
          const SizedBox(height: 14),
          SearchSummary(narrow: narrow),
          const SizedBox(height: 24),
          const _Categories(),
          SizedBox(height: narrow ? 28 : 38),
          const _ResultsTitle(),
          const SizedBox(height: 20),
          const _Filters(),
          const SizedBox(height: 18),
          const _SearchStays(),
          const SizedBox(height: 22),
          const _StayGrid(stays: stays),
        ]);
      });
}

class _Gutter extends StatelessWidget {
  const _Gutter({required this.width});
  final double width;
  @override
  Widget build(BuildContext context) => SizedBox(width: width, child: const ColoredBox(color: Color(0xFFF6F7F9)));
}

class _Categories extends StatelessWidget {
  const _Categories();
  @override
  Widget build(BuildContext context) {
    const labels = ['All', 'Hotels', 'Resorts', 'Camping', 'Villas', 'Luxury Villas'];
    return Wrap(spacing: 8, runSpacing: 8, children: [
      for (final label in labels) _Category(label: label, active: label == 'Hotels'),
    ]);
  }
}

class _Category extends StatelessWidget {
  const _Category({required this.label, required this.active});
  final String label;
  final bool active;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? navy : Colors.white,
          border: Border.all(color: active ? navy : line),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(label, style: TextStyle(color: active ? Colors.white : const Color(0xFF182640), fontSize: 14, fontWeight: FontWeight.w600)),
      );
}

class _ResultsTitle extends StatelessWidget {
  const _ResultsTitle();
  @override
  Widget build(BuildContext context) => Row(children: [
        const Expanded(child: Text('20 hotels Available', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(border: Border.all(color: navy), borderRadius: BorderRadius.circular(20)),
          child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.filter_list, size: 17), SizedBox(width: 6), Text('Filters', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700))]),
        ),
      ]);
}

class _Filters extends StatelessWidget {
  const _Filters();
  @override
  Widget build(BuildContext context) => const Wrap(spacing: 8, runSpacing: 8, children: [
        _Filter(icon: Icons.calendar_month_outlined, text: 'Sep 29-30'),
        _Filter(icon: Icons.person_outline, text: '2 Guests'),
        _Filter(icon: Icons.sort, text: 'Recommended', arrow: true),
      ]);
}

class _Filter extends StatelessWidget {
  const _Filter({required this.icon, required this.text, this.arrow = false});
  final IconData icon;
  final String text;
  final bool arrow;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: outlined(radius: 17),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 17, color: subtleText),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
          if (arrow) ...[const SizedBox(width: 8), const Icon(Icons.keyboard_arrow_down, size: 17, color: subtleText)],
        ]),
      );
}

class _SearchStays extends StatelessWidget {
  const _SearchStays();
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: navy, borderRadius: BorderRadius.circular(16)),
        child: const Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.search, color: Colors.white, size: 19),
          SizedBox(width: 10),
          Text('Search Stays', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
        ]),
      );
}

class _StayGrid extends StatelessWidget {
  const _StayGrid({required this.stays});
  final List<Stay> stays;
  @override
  Widget build(BuildContext context) => LayoutBuilder(builder: (context, size) {
        final columns = size.maxWidth >= 1120 ? 3 : size.maxWidth >= 720 ? 2 : 1;
        const gap = 16.0;
        final cardWidth = (size.maxWidth - (columns - 1) * gap) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [for (final stay in stays) SizedBox(width: cardWidth, child: StayCard(stay: stay))],
        );
      });
}
