# Silver — Capa 2

Estandariza y tipa. Conserva todas las operaciones. **No** es star schema.

**Tabla:** `alquiler_amba.silver.properties`  
**Grain:** 1 fila por `id`.  
**Origen:** `bronze.properties_raw`  
**DDL/ETL:** `ddl_properties.sql` / `etl_properties.sql`  
**Estado:** no implementar hasta cerrar Bronze.

## Contrato

- Casts: `id` BIGINT, `fecha` DATE, numéricos
- `tipo_de_operacion_std`, `zona_std`, `estado_std`, `moneda_std`
- `tipo_vendedor_std`: inmobiliaria / dueno_directo / desconocido
- `inmueble_bk = url`
- `quincena_id` (día ≤ 15 → Q1)
- `antiguedad_std` (999 y negativos → null), `cochera_flg`
- Flags: `precio_ok`, `ambientes_ok`, `es_alquiler_analizable`
- Desempate same-day: `url + fecha` → `max(id)` (el fact usa el ganador)
- `MERGE ON id`. Fuera: SK, SCD, facts, vistas

## DoD

Re-run estable. Typos y aliases de zona colapsados. Flags poblados.
