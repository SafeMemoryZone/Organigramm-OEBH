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
```

## Ausführen

```bash
node server.js
```

Das Script fragt nach:
- PostgreSQL Benutzername
- PostgreSQL Passwort
- Name der Datenbank (z. B. `bundesheer`)

Danach werden erzeugt:

- schema.dot
- schema.svg
- schema.png
