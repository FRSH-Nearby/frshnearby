import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../marketing_tokens.dart';
import 'language_picker.dart';

/// Landing top bar: green wordmark, section links, and language menu.
///
/// Uses a text wordmark instead of the logo asset — the logo (and its colors)
/// is being replaced, so the brand here leans on the green theme only.
class LandingTopBar extends StatelessWidget {
  const LandingTopBar({
    super.key,
    this.onHome,
    required this.onMission,
    required this.onApplication,
    required this.onAbout,
    required this.onInterested,
    required this.onSupport,
  });

  final VoidCallback? onHome;
  final VoidCallback onMission;
  final VoidCallback onApplication;
  final VoidCallback onAbout;
  final VoidCallback onInterested;
  final VoidCallback onSupport;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final showLinks = width >= 1080;

    final links = <Widget>[
      _NavLink(label: l10n.landingMissionTitle, onTap: onMission),
      _NavLink(label: l10n.landingApplicationTitle, onTap: onApplication),
      _NavLink(label: l10n.landingNavAbout, onTap: onAbout),
      _NavLink(label: l10n.landingNavInterested, onTap: onInterested),
      _NavLink(label: l10n.landingNavSupport, onTap: onSupport),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: onHome,
                  child: _Wordmark(compact: width < 460),
                ),
              ),
            ),
            if (showLinks) Row(mainAxisSize: MainAxisSize.min, children: links),
            if (showLinks)
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: const LanguagePicker(),
                ),
              )
            else
              const LanguagePicker(),
          ],
        ),
        if (!showLinks) Wrap(alignment: WrapAlignment.center, children: links),
      ],
    );
  }
}

class _Wordmark extends StatelessWidget {
  const _Wordmark({this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo/frshnearby.png',
      height: compact ? 30 : 38,
      fit: BoxFit.contain,
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: LandingColors.ink,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      ),
      child: Text(label),
    );
  }
}
