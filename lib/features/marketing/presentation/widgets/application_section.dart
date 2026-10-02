import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../marketing_tokens.dart';
import 'consumers_section.dart';
import 'mission_section.dart';
import 'producers_section.dart';

class ApplicationSection extends StatefulWidget {
  const ApplicationSection({super.key});

  @override
  State<ApplicationSection> createState() => _ApplicationSectionState();
}

class _ApplicationSectionState extends State<ApplicationSection> {
  bool _showProducers = true;

  void _selectTab(bool producers) {
    if (_showProducers == producers) return;
    setState(() => _showProducers = producers);
  }

  Widget _tab(String label, bool producers) {
    final selected = _showProducers == producers;
    return MouseRegion(
      onEnter: (_) => _selectTab(producers),
      child: Semantics(
        selected: selected,
        child: TextButton(
          onPressed: () => _selectTab(producers),
          style: TextButton.styleFrom(
            foregroundColor: selected ? LandingColors.ink : LandingColors.muted,
            backgroundColor: selected ? LandingColors.mist : Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: selected ? LandingColors.green : Colors.transparent,
              ),
            ),
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LandingSectionIntro(
          title: l10n.landingApplicationTitle,
          body: l10n.landingApplicationBody,
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _tab(l10n.landingProducersTitle, true),
            _tab(l10n.landingConsumersTitle, false),
          ],
        ),
        const SizedBox(height: 24),
        if (_showProducers)
          const ProducersSection(showHeading: false)
        else
          const ConsumersSection(showHeading: false),
      ],
    );
  }
}
