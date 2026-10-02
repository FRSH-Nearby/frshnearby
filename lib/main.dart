import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'app.dart';
import 'core/network/api_client.dart';
import 'core/providers/app_providers.dart';
import 'core/storage/local_storage_service.dart';
import 'features/auth/data/auth_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  GoRouter.optionURLReflectsImperativeAPIs = true;

  final localStorageService = LocalStorageService();
  await localStorageService.init();

  final apiClient = ApiClient();
  final authRepository = BackendAuthRepository(
    localStorageService: localStorageService,
    apiClient: apiClient,
  );

  runApp(
    ProviderScope(
      overrides: [
        localStorageServiceProvider.overrideWithValue(localStorageService),
        apiClientProvider.overrideWithValue(apiClient),
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
      child: const FreshFarmApp(),
    ),
  );
}
