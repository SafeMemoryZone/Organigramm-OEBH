# ÖBH Organigram

Dieses Projekt erstellt ein Organigramm des Österreichischen Bundesheeres mithilfe von PostgreSQL, Node.js und Graphviz.

## Voraussetzungen

1. Linux oder macOS
2. PostgreSQL installiert und laufend
3. Graphviz installiert (`dot` Befehl)
4. Node.js installiert
5. Node-Abhängigkeit: `pg` (wird automatisch installiert)

## Installation

```bash
cd <projektordner>
npm install
```

## Datenbank vorbereiten

```bash
createdb bundesheer
psql -U yourUser -d yourDB -h yourHost -p port -f schema.sql
```

## Ausführen

```bash
node generate.js
```

Das Script liest `.env` und benutzt die Zugangsdaten

Danach werden erzeugt:

- schema.dot
- schema.svg
- schema.png
