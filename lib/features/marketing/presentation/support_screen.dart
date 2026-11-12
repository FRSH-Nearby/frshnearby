import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/l10n/generated/app_localizations.dart';
import '../../../core/router/app_routes.dart';
import 'marketing_tokens.dart';
import 'widgets/landing_footer.dart';
import 'widgets/language_picker.dart';
import 'widgets/mission_section.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: LandingColors.paper,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 24,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1124),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!kIsWeb) ...[
                          const Align(
                            alignment: Alignment.centerRight,
                            child: LanguagePicker(),
                          ),
                          const SizedBox(height: 32),
                        ],
                        LandingSectionIntro(
                          title: l10n.supportTitle,
                          body: l10n.supportIntro,
                        ),
                        const SizedBox(height: 32),
                        _SupportCard(
                          icon: Icons.build_circle_outlined,
                          title: l10n.supportTroubleshootTitle,
                          body: l10n.supportTroubleshootBody,
                        ),
                        const SizedBox(height: 16),
                        _SupportCard(
                          icon: Icons.bug_report_outlined,
                          title: l10n.supportReportTitle,
                          body: l10n.supportReportBody,
                        ),
                        const SizedBox(height: 16),
                        _SupportCard(
                          icon: Icons.support_agent_rounded,
                          title: l10n.supportContactTitle,
                          body: l10n.supportContactBody,
                          action: FilledButton.icon(
                            onPressed: () => launchUrl(
                              Uri.parse(
                                'mailto:info@frshnearby.com?subject=${Uri.encodeComponent(l10n.supportEmailSubject)}',
                              ),
                            ),
                            style: FilledButton.styleFrom(
                              backgroundColor: LandingColors.green,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.mail_outline_rounded),
                            label: Text(l10n.supportEmailAction),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _SupportCard(
                          icon: Icons.privacy_tip_outlined,
                          title: l10n.supportPrivacyTitle,
                          body: l10n.supportPrivacyBody,
                          action: FilledButton.icon(
                            onPressed: () =>
                                context.push(AppRoutes.privacyPolicy),
                            style: FilledButton.styleFrom(
                              backgroundColor: LandingColors.green,
                              foregroundColor: Colors.white,
                            ),
                            icon: const Icon(Icons.open_in_new_rounded),
                            label: Text(l10n.supportPrivacyTitle),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _SupportCard(
                          icon: Icons.description_outlined,
                          title: l10n.supportTermsTitle,
                          body: l10n.supportTermsComingSoon,
                        ),
                        const SizedBox(height: 48),
                        if (!kIsWeb) const LandingFooter(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (kIsWeb)
              const SliverToBoxAdapter(child: LandingFooter(compact: true)),
          ],
        ),
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard({
    required this.icon,
    required this.title,
    required this.body,
    this.action,
  });

  final IconData icon;
  final String title;
  final String body;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: LandingColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: LandingColors.mist,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: LandingColors.green),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: const TextStyle(
              color: LandingColors.ink,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: const TextStyle(
              color: LandingColors.muted,
              fontSize: 16,
              height: 1.65,
            ),
          ),
          if (action != null) ...[const SizedBox(height: 20), action!],
        ],
      ),
    );
  }
}
