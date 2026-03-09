import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../l10n/app_localizations.dart';
import '../providers/gateway_provider.dart';
import '../providers/node_provider.dart';
import '../widgets/gateway_controls.dart';
import '../widgets/status_card.dart';
import 'node_screen.dart';
import 'configure_screen.dart';
import 'onboarding_screen.dart';
import 'terminal_screen.dart';
import 'web_dashboard_screen.dart';
import 'logs_screen.dart';
import 'packages_screen.dart';
import 'providers_screen.dart';
import 'settings_screen.dart';
import 'ssh_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GatewayControls(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 4, bottom: 8),
              child: Text(
                l10n.quickActions,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            StatusCard(
              title: l10n.terminal,
              subtitle: l10n.terminalSubtitle,
              icon: Icons.terminal,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const TerminalScreen()),
              ),
            ),
            Consumer<GatewayProvider>(
              builder: (context, provider, _) {
                final url = provider.state.dashboardUrl;
                final token = url != null
                    ? RegExp(r'#token=([0-9a-f]+)').firstMatch(url)?.group(1)
                    : null;
                final subtitle = provider.state.isRunning
                    ? (token != null
                        ? '${l10n.token}: ${token.substring(0, (token.length > 8 ? 8 : token.length))}...'
                        : l10n.webDashboardSubtitle)
                    : l10n.startGatewayFirst;
                return StatusCard(
                  title: l10n.webDashboard,
                  subtitle: subtitle,
                  icon: Icons.dashboard,
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (token != null)
                        IconButton(
                          icon: const Icon(Icons.copy, size: 18),
                          tooltip: l10n.copyDashboardUrl,
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: url!));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.dashboardUrlCopied)),
                            );
                          },
                        ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  onTap: provider.state.isRunning
                      ? () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => WebDashboardScreen(
                                url: url,
                              ),
                            ),
                          )
                      : null,
                );
              },
            ),
            StatusCard(
              title: l10n.onboarding,
              subtitle: l10n.onboardingSubtitle,
              icon: Icons.vpn_key,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
              ),
            ),
            StatusCard(
              title: l10n.configure,
              subtitle: l10n.configureSubtitle,
              icon: Icons.tune,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ConfigureScreen()),
              ),
            ),
            StatusCard(
              title: l10n.aiProviders,
              subtitle: l10n.aiProvidersSubtitle,
              icon: Icons.model_training,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProvidersScreen()),
              ),
            ),
            StatusCard(
              title: l10n.packages,
              subtitle: l10n.packagesSubtitle,
              icon: Icons.extension,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PackagesScreen()),
              ),
            ),
            StatusCard(
              title: l10n.sshAccess,
              subtitle: l10n.sshAccessSubtitle,
              icon: Icons.terminal,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SshScreen()),
              ),
            ),
            StatusCard(
              title: l10n.logs,
              subtitle: l10n.logsSubtitle,
              icon: Icons.article_outlined,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const LogsScreen()),
              ),
            ),
            StatusCard(
              title: l10n.snapshot,
              subtitle: l10n.snapshotSubtitle,
              icon: Icons.backup,
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              ),
            ),
            Consumer<NodeProvider>(
              builder: (context, nodeProvider, _) {
                final nodeState = nodeProvider.state;
                return StatusCard(
                  title: l10n.node,
                  subtitle: nodeState.isPaired
                      ? l10n.nodeConnectedToGateway
                      : nodeState.isDisabled
                          ? l10n.nodeDeviceCapabilities
                          : nodeState.statusText,
                  icon: Icons.devices,
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const NodeScreen()),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                children: [
                  Text(
                    '${l10n.appName} v${AppConstants.version}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.versionBy(AppConstants.authorName, AppConstants.orgName),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
