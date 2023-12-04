# demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Localization : 
Pubspec.yaml ma changes chhe
Setting>plugins>intl plugins add karavanu
tools>flutter Intl>Initializa for this project
main.dart ma : localizationsDelegates & supportedLocales add karvanu
[intl_en.arb](lib -> l10n -> intl_en.arb) ma string add karvani
use : s.of(context).keyName

[localization_provider.dart] (lib->controller->localization_provider.dart)
[localization_screen](lib->screen->localization_screen)