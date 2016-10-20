# Software-Optimierung für Ubuntu

### Absprachen im Voraus:
- Migration
  - Eigene Dateien
  - Software, evtl. Lizenzen
- Sicherung
- Sicherheit
  - Passwörter auf vorhandenem System erfragen
  - Verschlüsselung der Festplatten
  - Beratung zum Speichern von Passwörtern
  - Beratung zum Thema Privatsphäre: Browser Footprint, VPN, Crypto

### Erstellung einer Datensicherung als RAW-Diskimage

### Prüfung Funktionalität der Treiber
- Netzwerk: WLAN und Ethernet
- USB-Slots
- Kartenleser
- Webcam
- Touchpad
- CD-Laufwerk
- Funktionstasten


### Software Säuberung

- Pakete automatisch aufräumen
- Alte Kernel in Boot-Partition säubern
- Installiere FSlint
- In der Dash-Suche, deaktiviere Ergebnisse aus dem Internet
- Pneumatisch entstauben und feucht reinigen
- Überflüssige Programme manuell deinstallieren


### Software Update

- Update aller installierten Anwendungen
- Installiere/Aktualisiere:
  - Adobe Flash Player
  - Java
  - Shutter für Screenshots intallieren
  - Teamviewer
  - Firefox
- Konfiguriere Shutter für automatisches Speichern von Screentshots
http://shutter-project.org/faq-help/set-shutter-as-the-default-screenshot-tool/#gnom
- Installiere Firefox Add-Ons
  - Werbeblocker uBlock,
  - Anti-Tracker PrivacyBadger & Ghostery
- Firefox: überflüssige Add-Ons entfernen, wie z.B. Ubuntu-spezifische Add-ons
- Einstellung setzen: Beim start leere Seite anzeigen, Startpage oder Ecosia als Suchmaschine anpassen und als Startseite setzen, Immer den privaten Modus verwenden, Cookies von Drittanbietern nie akzeptieren, keinerelei Passwörter speichern, (Erweitert → Datenübermittlung) Keine Daten senden
- Install Clipboard Manager "CopyQ"
- Teste Adobe Flash Player
- Configure automatic updates


### Optimierung der Einstellungen
- Benutzerkonten-Check
- Auflösung des Monitors anpassen
- Energieoptionen optimieren
- Netzwerkeinstellungen prüfen
- Druckereinstellungen prüfen
- Visuelle Effekte anpassen: sudo apt-get install compizconfig-settings-manager
- Suche nach „Grid“, unter dem Tab „Corners/Edges“ die Ecken aktivieren
- Optional Geschwindigkeit erhöhen: Suche nach „Animations“ und diese deaktivieren
Ggf. Sprachsymbol aus Menüleiste entfernen
- Bluethooth deaktivieren (/etc/bluetooth/main.conf, RememberPowered und InitiallyPowered →  false)
- Keine Fehlerberichte an Canonical senden: Privacy → Diagnose
- Ggf. Defragmentierung: „sudo e4defrag -c /“, wenn nötig, dann run „sudo e4defrag /“
http://wiki.ubuntuusers.de/Defragmentierung
- Deaktiviere Erstellen von Fehlerberichten für Canonical (Setze Parameter auf '0' in /etc/default/apport)
- Amazon Lens deinstallieren

### Abschließende Prüfung

- Autostartobjekte prüfen
- Verknüpfungen im Anwendungsmenü auf relevante Software reduzieren
- Infobereich prüfen
- Neustarten, dabei BIOS-Einstellungen prüfen
- Sicherung durchführen und prüfen
- Gerät in Stand-by versetzen
