import fs from "fs";
import readline from "readline";
import pg from "pg";
import { execSync } from "child_process";
import dotenv from "dotenv";

dotenv.config();

async function main() {
    const client = new pg.Client({
        user: process.env.PG_USER,
        password: process.env.PG_PASSWORD,
        database: process.env.PG_DATABASE,
        host: process.env.PG_HOST || "localhost",
        port: process.env.PG_PORT || 5432,
    });

    await client.connect();

    const sql = fs.readFileSync("schema.sql", "utf8");
    await client.query(sql);
    console.log("Database schema + data loaded.");

    const query = `
        SELECT u.id, u.name, u.unit_code, p.unit_code AS parent
        FROM bundesheer.unit u
        LEFT JOIN bundesheer.unit_relation r ON u.id = r.child_id
        LEFT JOIN bundesheer.unit p ON r.parent_id = p.id;
    `;
    const res = await client.query(query);

    let dot = "digraph Bundesheer { rankdir=TB; node [shape=box];\n";
    for (const row of res.rows) {
        dot += ` "${row.unit_code}" [label="${row.unit_code}\n${row.name}"];\n`;
        if (row.parent) {
            dot += ` "${row.parent}" -> "${row.unit_code}";\n`;
        }
    }
    dot += "}";

    fs.writeFileSync("schema.dot", dot);
    console.log("schema.dot written.");

    try {
        execSync(`dot -Tsvg schema.dot -o schema.svg`);
        execSync(`dot -Tpng schema.dot -o schema.png`);
        console.log("SVG and PNG generated.");
    } catch (e) {
        console.warn("Graphviz not found. Install with: sudo apt install graphviz");
    }

    await client.end();
}

main();
