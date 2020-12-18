Dieses Verzeichnis enthält Skripte, die zum Erstellen des Live-ISOs und des finalen Stick-Images benötigt werden.

⚠️  Es finden weiterhin strukturelle Umbauarbeiten statt 🛠🚧

## Haupt-bau-Skript
.. sind in dieser Reihenfolge auszuführen, um im Bestfall nach ca. einer Stunde ein fertiges Stick-Image gebaut zu haben.

* [build-live-system.sh](build-live-system.sh): Baut eine bootbare Live-Debian-ISO mittels live-build.
* [create-distribution-image.sh](create-distribution-image.sh): Erstellt nach Menüauswahl der ISO ein 10GB Standard-Image für 16GB Sticks
* alternativ:
* [stick-install.sh](stick-install.sh): Installiert die Live-ISO menügesteuert auf einem Stick oder in einem Image.

## Hilfsskripte

* [calc-version-number.sh](calc-version-number.sh): "Berechnung einer einfachen und trotzdem präzisen Versionsnummer"
* [convert-md-links.py](convert-md-links.py): korrigiert relative Pfade when generating die HTML docs
* [functions.bash](functions.bash): in den Skripten verwendete Funktionen (bash)
* [functions.sh](functions.sh): in den Skripten verwendete Funktionen (POSIX kompatibel)
* [stick-install.old.sh](stick-install.old.sh): "Sicherheitskopie" des alten Skripts, zum Nachschlagen
* [write-and-test.py](write-and-test.py): Für die Duplizierung von ganz vielen USB-Sticks (thx @horazont [2016-10-17](https://github.com/fsfw-dresden/usb-live-linux/issues/29#issuecomment-254183176))
