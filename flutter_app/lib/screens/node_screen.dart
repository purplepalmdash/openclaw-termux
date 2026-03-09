import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app.dart';
import '../l10n/app_localizations.dart';
import '../providers/node_provider.dart';
import '../services/preferences_service.dart';
import '../widgets/node_controls.dart';

class NodeScreen extends StatefulWidget {
  const NodeScreen({super.key});

  @override
  State<NodeScreen> createState() => _NodeScreenState();
}

class _NodeScreenState extends State<NodeScreen> {
  final _hostController = TextEditingController();
  final _portController = TextEditingController();
  final _tokenController = TextEditingController();
  bool _isLocal = true;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = PreferencesService();
    await prefs.init();
    final host = prefs.nodeGatewayHost ?? '127.0.0.1';
    final port = prefs.nodeGatewayPort ?? 18789;
    final token = prefs.nodeGatewayToken ?? '';
    setState(() {
      _isLocal = host == '127.0.0.1' || host == 'localhost';
      _hostController.text = _isLocal ? '' : host;
      _portController.text = _isLocal ? '' : '$port';
      _tokenController.text = _isLocal ? '' : token;
      _loading = false;
    });
  }

  @override
  void dispose() {
    _hostController.dispose();
    _portController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.nodeConfiguration)),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Consumer<NodeProvider>(
              builder: (context, provider, _) {
                final state = provider.state;

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    const NodeControls(),
                    const SizedBox(height: 16),

                    // Gateway Connection
                    _sectionHeader(theme, l10n.gatewayConnection),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RadioListTile<bool>(
                              title: Text(l10n.localGateway),
                              subtitle: Text(l10n.localGatewayDesc),
                              value: true,
                              groupValue: _isLocal,
                              onChanged: (value) {
                                setState(() => _isLocal = value!);
                              },
                            ),
                            RadioListTile<bool>(
                              title: Text(l10n.remoteGateway),
                              subtitle: Text(l10n.remoteGatewayDesc),
                              value: false,
                              groupValue: _isLocal,
                              onChanged: (value) {
                                setState(() => _isLocal = value!);
                              },
                            ),
                            if (!_isLocal) ...[
                              const SizedBox(height: 12),
                              TextField(
                                controller: _hostController,
                                decoration: InputDecoration(
                                  labelText: l10n.gatewayHost,
                                  hintText: '192.168.1.100',
                                ),
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: _portController,
                                decoration: InputDecoration(
                                  labelText: l10n.gatewayPort,
                                  hintText: '18789',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 12),
                              TextField(
                                controller: _tokenController,
                                decoration: InputDecoration(
                                  labelText: l10n.gatewayToken,
                                  hintText: l10n.gatewayTokenHint,
                                  helperText: l10n.gatewayTokenHelper,
                                  prefixIcon: const Icon(Icons.key),
                                ),
                                obscureText: true,
                              ),
                              const SizedBox(height: 12),
                              FilledButton.icon(
                                onPressed: () {
                                  final host = _hostController.text.trim();
                                  final port = int.tryParse(_portController.text.trim()) ?? 18789;
                                  final token = _tokenController.text.trim();
                                  if (host.isNotEmpty) {
                                    provider.connectRemote(host, port,
                                        token: token.isNotEmpty ? token : null);
                                  }
                                },
                                icon: const Icon(Icons.link),
                                label: Text(l10n.connect),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Pairing Status
                    if (state.pairingCode != null) ...[
                      _sectionHeader(theme, l10n.pairing),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Icon(Icons.qr_code, size: 48),
                              const SizedBox(height: 8),
                              Text(
                                l10n.approveCodeOnGateway,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              SelectableText(
                                state.pairingCode!,
                                style: theme.textTheme.headlineMedium?.copyWith(
                                  fontFamily: 'monospace',
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Capabilities
                    _sectionHeader(theme, l10n.capabilities),
                    _capabilityTile(
                      theme,
                      l10n.camera,
                      l10n.cameraDesc,
                      Icons.camera_alt,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.canvas,
                      l10n.canvasDesc,
                      Icons.web,
                      available: false,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.location,
                      l10n.locationDesc,
                      Icons.location_on,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.screenRecording,
                      l10n.screenRecordingDesc,
                      Icons.screen_share,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.flashlight,
                      l10n.flashlightDesc,
                      Icons.flashlight_on,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.vibration,
                      l10n.vibrationDesc,
                      Icons.vibration,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.sensors,
                      l10n.sensorsDesc,
                      Icons.sensors,
                    ),
                    _capabilityTile(
                      theme,
                      l10n.serial,
                      l10n.serialDesc,
                      Icons.usb,
                    ),
                    const SizedBox(height: 16),

                    // Device Info
                    if (state.deviceId != null) ...[
                      _sectionHeader(theme, l10n.deviceInfo),
                      ListTile(
                        title: Text(l10n.deviceId),
                        subtitle: SelectableText(
                          state.deviceId!,
                          style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
                        ),
                        leading: const Icon(Icons.fingerprint),
                      ),
                    ],
                    const SizedBox(height: 16),

                    // Logs
                    _sectionHeader(theme, l10n.nodeLogs),
                    Card(
                      child: Container(
                        height: 200,
                        padding: const EdgeInsets.all(12),
                        child: state.logs.isEmpty
                            ? Center(
                                child: Text(
                                  l10n.noLogsYet,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              )
                            : ListView.builder(
                                reverse: true,
                                itemCount: state.logs.length,
                                itemBuilder: (context, index) {
                                  final log = state.logs[state.logs.length - 1 - index];
                                  return Text(
                                    log,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      fontSize: 11,
                                    ),
                                  );
                                },
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }

  Widget _sectionHeader(ThemeData theme, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Text(
        title,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _capabilityTile(
      ThemeData theme, String title, String subtitle, IconData icon,
      {bool available = true}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: available
            ? const Icon(
                Icons.check_circle,
                color: AppColors.statusGreen,
                size: 20,
              )
            : const Icon(
                Icons.block,
                color: AppColors.statusAmber,
                size: 20,
              ),
      ),
    );
  }
}