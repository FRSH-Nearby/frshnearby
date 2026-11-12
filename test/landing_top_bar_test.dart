import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshfarm/core/l10n/generated/app_localizations.dart';
import 'package:freshfarm/core/providers/app_providers.dart';
import 'package:freshfarm/core/storage/local_storage_service.dart';
import 'package:freshfarm/features/marketing/presentation/widgets/landing_top_bar.dart';
import 'package:freshfarm/features/marketing/presentation/widgets/language_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  for (final locale in ['en', 'fi', 'sv']) {
    testWidgets('mobile menu contains navigation and language in $locale', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(360, 740);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      SharedPreferences.setMockInitialValues({});
      final storage = LocalStorageService();
      await storage.init();
      var missionSelected = false;
      await tester.pumpWidget(
        ProviderScope(
          overrides: [localStorageServiceProvider.overrideWithValue(storage)],
          child: MaterialApp(
            locale: Locale(locale),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: LandingTopBar(
                    onMission: () => missionSelected = true,
                    onApplication: () {},
                    onAbout: () {},
                    onInterested: () {},
                    onSupport: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      final l10n = AppLocalizations.of(
        tester.element(find.byType(LandingTopBar)),
      );
      expect(find.text(l10n.landingMissionTitle), findsNothing);
      expect(find.byType(LanguagePicker), findsNothing);
      await tester.tap(find.byIcon(Icons.menu_rounded));
      await tester.pumpAndSettle();
      for (final label in [
        l10n.landingMissionTitle,
        l10n.landingApplicationTitle,
        l10n.landingNavAbout,
        l10n.landingNavInterested,
        l10n.landingNavSupport,
        l10n.languageLabel,
      ]) {
        expect(find.text(label), findsOneWidget);
      }
      await tester.tap(find.text(l10n.languageLabel));
      await tester.pumpAndSettle();
      expect(find.text(l10n.englishLanguage), findsOneWidget);
      expect(find.text(l10n.finnishLanguage), findsOneWidget);
      expect(find.text(l10n.swedishLanguage), findsOneWidget);
      await tester.tapAt(const Offset(5, 700));
      await tester.pumpAndSettle();
      await tester.tap(find.text(l10n.landingMissionTitle));
      await tester.pumpAndSettle();
      expect(missionSelected, isTrue);
      expect(find.text(l10n.landingMissionTitle), findsNothing);
      expect(tester.takeException(), isNull);
    });
  }
}
