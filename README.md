# Medical Appointment Frontend

Eine Flutter-Anwendung für die Verwaltung medizinischer Termine.

## Entwicklungsumgebung

Dieses Projekt verwendet einen Devcontainer für eine konsistente Entwicklungsumgebung in:

- GitHub Codespaces
- VS Code Dev Containers

## Voraussetzungen für lokale Devcontainer-Nutzung

Für die Nutzung des Devcontainers lokal wird benötigt:

- VS Code
- Dev Containers Extension
- Docker Desktop oder Podman

Ohne Docker oder Podman kann der Devcontainer lokal nicht gestartet werden.

## Devcontainer verwenden

1. Projekt in VS Code öffnen.
2. Sicherstellen, dass die Erweiterung `Dev Containers` installiert ist.
3. Command Palette öffnen (`Ctrl+Shift+P`).
4. `Dev Containers: Reopen in Container` auswählen.

## Enthaltene Entwicklungsumgebung

Der Devcontainer enthält:

- Flutter SDK (stable)
- Dart- und Flutter-Erweiterungen für VS Code
- Automatische Installation der Abhängigkeiten (`flutter pub get`)
- Automatischen Start der Flutter-Webanwendung auf Port `3000`

## Anwendung starten

Die Anwendung wird im Devcontainer automatisch gestartet.

Falls nötig, kann sie manuell gestartet werden:

```bash
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000
```

## Anwendung stoppen

```bash
Ctrl + C
```

## Lokale Entwicklung ohne Devcontainer

1. Flutter SDK installieren
2. Abhängigkeiten installieren:

```bash
flutter pub get
```

3. Anwendung starten:

```bash
flutter run -d chrome
```