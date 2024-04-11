import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news/settings/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  List<Language> languages = [
    Language(name: 'English', code: 'en'),
    Language(name: 'Arabic', code: 'ar')
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark Mode',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    settingsProvider.changeTheme(ThemeMode.light);
                  } else {
                    settingsProvider.changeTheme(ThemeMode.dark);
                  }
                },
                activeTrackColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Language',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: DropdownButton<Language>(
                    value: languages.firstWhere(
                        (lang) => lang.code == settingsProvider.languageCode),
                    items: languages
                        .map(
                          (language) => DropdownMenuItem(
                            value: language,
                            child: Text(
                              language.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (selectedLanguage) {
                      if (selectedLanguage != null) {
                        settingsProvider.changeLanguage(selectedLanguage.code);
                      }
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Language {
  String name;
  String code;
  Language({
    required this.name,
    required this.code,
  });
}
