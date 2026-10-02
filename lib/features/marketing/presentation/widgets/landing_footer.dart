import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/l10n/generated/app_localizations.dart';
import '../marketing_tokens.dart';

const _contactEmail = 'info@frshnearby.com';

class LandingFooter extends StatelessWidget {
  const LandingFooter({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final spacing = compact ? 8.0 : 24.0;

    return Container(
      width: double.infinity,
      color: LandingColors.deepGreen,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: compact ? 14 : 48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: LandingColors.paper,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Image.asset(
              'assets/images/logo/frshnearby.png',
              height: compact ? 30 : 42,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: spacing),
          Text(
            l10n.landingFooterTagline,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: LandingColors.paper,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          SizedBox(height: spacing),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _SocialLink(
                label: 'LinkedIn',
                url: String.fromEnvironment(
                  'LINKEDIN_URL',
                  defaultValue:
                      'https://www.linkedin.com/company/frsh-nearby/posts/?feedView=all',
                ),
                icon: Text(
                  'in',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: LandingColors.paper,
                  ),
                ),
              ),
              _SocialLink(
                label: 'Instagram',
                url: const String.fromEnvironment(
                  'INSTAGRAM_URL',
                  defaultValue:
                      'https://www.instagram.com/frshnearby?stkn=MWQwMmx4YWtkNmwxMg==',
                ),
                icon: SvgPicture.string(
                  '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><rect x="3" y="3" width="18" height="18" rx="5" fill="none" stroke="#F7F8F1" stroke-width="2"/><circle cx="12" cy="12" r="4" fill="none" stroke="#F7F8F1" stroke-width="2"/><circle cx="17.5" cy="6.5" r="1" fill="#F7F8F1"/></svg>',
                  width: 24,
                  height: 24,
                ),
              ),
              const _SocialLink(
                label: 'Facebook',
                url: String.fromEnvironment(
                  'FACEBOOK_URL',
                  defaultValue:
                      'https://www.facebook.com/profile.php?id=61591776766599',
                ),
                icon: Icon(
                  Icons.facebook,
                  color: LandingColors.paper,
                  size: 26,
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 0 : spacing),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('mailto:$_contactEmail')),
            style: TextButton.styleFrom(foregroundColor: LandingColors.paper),
            child: const Text(_contactEmail),
          ),
          SizedBox(height: compact ? 4 : spacing),
          Text(
            l10n.landingFooterCopyright,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: LandingColors.paper.withValues(alpha: 0.75),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  const _SocialLink({
    required this.label,
    required this.url,
    required this.icon,
  });

  final String label;
  final String url;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final uri = Uri.tryParse(url);
    final enabled = uri != null && uri.scheme == 'https' && uri.host.isNotEmpty;
    return IconButton(
      tooltip: label,
      onPressed: enabled
          ? () => launchUrl(uri, mode: LaunchMode.externalApplication)
          : null,
      icon: Opacity(opacity: enabled ? 1 : 0.5, child: icon),
    );
  }
}
