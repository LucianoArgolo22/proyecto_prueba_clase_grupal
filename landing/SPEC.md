# Landing — Capa 0

Carga 1:1 del CSV. Sin casts de negocio, sin filtros, sin `*_std`.

**Tabla:** `alquiler_amba.landing.properties_raw`  
**Grain:** 1 fila del archivo.  
**DDL/ETL:** `ddl_properties_raw.sql` / `etl_properties_raw.sql`

## Contrato

- 22 columnas del source, todas **STRING**
- Metadata: `_ingest_file`, `_ingest_ts`
- Path de files: `/Volumes/alquiler_amba/landing/properties_raw/fecha=.../` (no pisar el mismo path)
- Incremental: Auto Loader (`STREAM read_files`). Mismo path no se relee
- Fuera de esta carpeta: tipos DOUBLE, expects de negocio, Silver/Gold

## DoD

El CSV está en el Volume y la tabla refleja el archivo. Re-run sin files nuevos no duplica.
