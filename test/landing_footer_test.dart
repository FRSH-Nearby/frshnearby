import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freshfarm/core/l10n/generated/app_localizations.dart';
import 'package:freshfarm/features/marketing/presentation/widgets/landing_footer.dart';

void main() {
  for (final width in [360.0, 1200.0]) {
    testWidgets('footer fits a $width pixel viewport', (tester) async {
      tester.view.physicalSize = Size(width, 800);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(body: LandingFooter(compact: true)),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('info@frshnearby.com'), findsOneWidget);
      for (final name in ['LinkedIn', 'Instagram', 'Facebook']) {
        expect(find.byTooltip(name), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });
  }
}
