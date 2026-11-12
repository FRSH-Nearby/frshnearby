import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../../../settings/presentation/settings_controller.dart';
import '../marketing_tokens.dart';

/// Selects and persists the app-wide language.
class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final selected =
        ref.watch(settingsControllerProvider).locale?.languageCode ??
        Localizations.localeOf(context).languageCode;
    final options = [
      (code: 'en', name: l10n.englishLanguage),
      (code: 'fi', name: l10n.finnishLanguage),
      (code: 'sv', name: l10n.swedishLanguage),
    ]..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return PopupMenuButton<String>(
      initialValue: selected,
      tooltip: l10n.languageLabel,
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: LandingColors.deepGreen.withValues(alpha: 0.14),
      elevation: 6,
      constraints: const BoxConstraints(minWidth: 180, maxWidth: 240),
      menuPadding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: LandingColors.line),
      ),
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(LandingColors.mist),
        foregroundColor: const WidgetStatePropertyAll(LandingColors.green),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused) ||
              states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.pressed)) {
            return LandingColors.green.withValues(alpha: 0.08);
          }
          return null;
        }),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      onSelected: (code) => ref
          .read(settingsControllerProvider.notifier)
          .updateLocale(Locale(code)),
      itemBuilder: (context) => [
        for (final option in options)
          PopupMenuItem<String>(
            value: option.code,
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: option.code == selected ? LandingColors.mist : null,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      option.name,
                      style: TextStyle(
                        color: option.code == selected
                            ? LandingColors.green
                            : LandingColors.ink,
                        fontSize: 14,
                        fontWeight: option.code == selected
                            ? FontWeight.w800
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                  if (option.code == selected)
                    const Icon(
                      Icons.check_rounded,
                      size: 18,
                      color: LandingColors.green,
                    ),
                ],
              ),
            ),
          ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.languageLabel,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: LandingColors.green,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
