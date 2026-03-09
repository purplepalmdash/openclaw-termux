import 'package:flutter/material.dart';
import '../app.dart';
import '../l10n/app_localizations.dart';
import '../models/ai_provider.dart';
import '../services/provider_config_service.dart';

/// Form screen to configure API key and model for a single AI provider.
class ProviderDetailScreen extends StatefulWidget {
  final AiProvider provider;
  final String? existingApiKey;
  final String? existingModel;

  const ProviderDetailScreen({
    super.key,
    required this.provider,
    this.existingApiKey,
    this.existingModel,
  });

  @override
  State<ProviderDetailScreen> createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  static const _customModelSentinel = '__custom__';

  late final TextEditingController _apiKeyController;
  late final TextEditingController _customModelController;
  late String _selectedModel;
  bool _isCustomModel = false;
  bool _obscureKey = true;
  bool _saving = false;
  bool _removing = false;

  bool get _isConfigured => widget.existingApiKey != null && widget.existingApiKey!.isNotEmpty;

  /// Returns the effective model name to save.
  String get _effectiveModel =>
      _isCustomModel ? _customModelController.text.trim() : _selectedModel;

  @override
  void initState() {
    super.initState();
    _apiKeyController = TextEditingController(text: widget.existingApiKey ?? '');
    _customModelController = TextEditingController();

    final existing = widget.existingModel ?? widget.provider.defaultModels.first;
    if (widget.provider.defaultModels.contains(existing)) {
      _selectedModel = existing;
    } else {
      // Existing model is not in the predefined list — treat as custom
      _selectedModel = _customModelSentinel;
      _isCustomModel = true;
      _customModelController.text = existing;
    }
  }

  @override
  void dispose() {
    _apiKeyController.dispose();
    _customModelController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    final apiKey = _apiKeyController.text.trim();
    if (apiKey.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.apiKeyCannotBeEmpty)),
      );
      return;
    }
    final model = _effectiveModel;
    if (model.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.modelNameCannotBeEmpty)),
      );
      return;
    }

    setState(() => _saving = true);
    try {
      await ProviderConfigService.saveProviderConfig(
        provider: widget.provider,
        apiKey: apiKey,
        model: model,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.providerConfiguredAndActivated(widget.provider.name))),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.failedToSave(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  Future<void> _remove() async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.removeProviderTitle(widget.provider.name)),
        content: Text(l10n.removeProviderDesc),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.remove),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _removing = true);
    try {
      await ProviderConfigService.removeProviderConfig(provider: widget.provider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.providerRemoved(widget.provider.name))),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.failedToRemove(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _removing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final iconBg = isDark ? AppColors.darkSurfaceAlt : const Color(0xFFF3F4F6);

    return Scaffold(
      appBar: AppBar(title: Text(widget.provider.name)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Provider header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.provider.icon, color: widget.provider.color),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.provider.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.provider.description,
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
          ),
          const SizedBox(height: 24),

          // API Key
          Text(
            l10n.apiKey,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _apiKeyController,
            obscureText: _obscureKey,
            decoration: InputDecoration(
              hintText: widget.provider.apiKeyHint,
              suffixIcon: IconButton(
                icon: Icon(_obscureKey ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscureKey = !_obscureKey),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Model selection
          Text(
            l10n.model,
            style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: _selectedModel,
            isExpanded: true,
            decoration: const InputDecoration(),
            items: [
              ...widget.provider.defaultModels
                  .map((m) => DropdownMenuItem(value: m, child: Text(m))),
              DropdownMenuItem(
                value: _customModelSentinel,
                child: Text(l10n.customModel),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedModel = value;
                  _isCustomModel = value == _customModelSentinel;
                });
              }
            },
          ),
          if (_isCustomModel) ...[
            const SizedBox(height: 12),
            TextField(
              controller: _customModelController,
              decoration: InputDecoration(
                hintText: l10n.customModelHint,
                labelText: l10n.customModelName,
              ),
            ),
          ],
          const SizedBox(height: 32),

          // Actions
          FilledButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                  )
                : Text(l10n.saveAndActivate),
          ),
          if (_isConfigured) ...[
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: _removing ? null : _remove,
              child: _removing
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.removeConfiguration),
            ),
          ],
        ],
      ),
    );
  }
}