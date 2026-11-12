import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_routes.dart';
import 'marketing_tokens.dart';
import 'widgets/landing_footer.dart';
import 'widgets/landing_top_bar.dart';

/// Keeps website navigation outside each route's scrollable content.
class WebsiteShell extends StatelessWidget {
  const WebsiteShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    void openSection(String section) {
      context.go('${AppRoutes.home}?section=$section');
    }

    return Scaffold(
      backgroundColor: LandingColors.paper,
      body: SafeArea(
        child: Column(
          children: [
            _bar(
              child: LandingTopBar(
                onHome: () => context.go(AppRoutes.home),
                onMission: () => openSection('mission'),
                onApplication: () => openSection('application'),
                onAbout: () => openSection('about'),
                onInterested: () => openSection('interested'),
                onSupport: () => context.go(AppRoutes.support),
              ),
            ),
            const Divider(height: 1, color: LandingColors.line),
            Expanded(
              child:
                  [
                    AppRoutes.home,
                    AppRoutes.support,
                    AppRoutes.privacyPolicy,
                  ].contains(GoRouterState.of(context).uri.path)
                  ? child
                  : LayoutBuilder(
                      builder: (context, constraints) => SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: constraints.maxHeight,
                              child: child,
                            ),
                            const LandingFooter(compact: true),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bar({required Widget child}) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1160),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: child,
        ),
      ),
    );
  }
}
