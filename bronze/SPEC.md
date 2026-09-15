# Bronze — Capa 1

Persiste landing **tal cual**, con tipos relajados. Cero lógica de negocio.

**Tabla:** `alquiler_amba.bronze.properties_raw`  
**Grain:** 1 fila del CSV (`id` de scrape).  
**Origen:** `landing.properties_raw`  
**DDL/ETL:** `ddl_properties_raw.sql` / `etl_properties_raw.sql`

## Contrato

- Mismas 22 columnas + `_rescued_data`, `_ingest_file`, `_ingest_ts`
- `fecha` / `hora` siguen STRING
- Expects **warn**: `id` y `fecha` not null. No dropear filas
- Incremental: stream desde landing. Idempotente si landing no trae files nuevos
- Fuera de esta carpeta: `*_std`, quincena, dims, facts, `sem.*`

## DoD

`COUNT(*)` ≈ filas del CSV. Schema crudo intacto. Re-run sin novedades no duplica.
