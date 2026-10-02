import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../marketing_tokens.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LandingSectionIntro(
      title: l10n.landingMissionTitle,
      body: l10n.landingMissionBody,
    );
  }
}

class LandingSectionIntro extends StatelessWidget {
  const LandingSectionIntro({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 34,
              height: 4,
              decoration: BoxDecoration(
                color: LandingColors.green,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: LandingColors.ink,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(
            body,
            style: const TextStyle(
              color: LandingColors.muted,
              fontSize: 16,
              height: 1.65,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
