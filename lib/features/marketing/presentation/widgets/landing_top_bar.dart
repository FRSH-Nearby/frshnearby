import 'package:flutter/material.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../marketing_tokens.dart';
import 'language_picker.dart';

/// Landing top bar: green wordmark, section links, and language menu.
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

    if (!showLinks) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onHome,
            child: _Wordmark(compact: width < 460),
          ),
          MenuAnchor(
            alignmentOffset: const Offset(0, 8),
            style: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              surfaceTintColor: const WidgetStatePropertyAll(
                Colors.transparent,
              ),
              shadowColor: WidgetStatePropertyAll(
                LandingColors.deepGreen.withValues(alpha: 0.14),
              ),
              elevation: const WidgetStatePropertyAll(6),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
              alignment: Alignment.bottomRight,
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: const BorderSide(color: LandingColors.line),
                ),
              ),
            ),
            menuChildren: [
              for (final link in [
                (label: l10n.landingMissionTitle, action: onMission),
                (label: l10n.landingApplicationTitle, action: onApplication),
                (label: l10n.landingNavAbout, action: onAbout),
                (label: l10n.landingNavInterested, action: onInterested),
                (label: l10n.landingNavSupport, action: onSupport),
              ])
                MenuItemButton(
                  onPressed: link.action,
                  style: MenuItemButton.styleFrom(
                    foregroundColor: LandingColors.ink,
                    overlayColor: LandingColors.mist,
                    minimumSize: const Size(220, 48),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(link.label),
                ),
              const Divider(color: LandingColors.line, height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: LanguagePicker(),
              ),
            ],
            builder: (context, controller, child) => IconButton(
              tooltip: MaterialLocalizations.of(context).showMenuTooltip,
              onPressed: () =>
                  controller.isOpen ? controller.close() : controller.open(),
              style: IconButton.styleFrom(
                backgroundColor: LandingColors.mist,
                foregroundColor: LandingColors.green,
                minimumSize: const Size(48, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.menu_rounded),
            ),
          ),
        ],
      );
    }

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
            Row(mainAxisSize: MainAxisSize.min, children: links),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: const LanguagePicker(),
              ),
            ),
          ],
        ),
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
