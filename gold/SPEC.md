# Gold — Capas 3 y 4

Star schema. Un fact. Dims con SCD. **Sin** tablas de oportunidad ni agg+self-join.

**Origen:** `silver.properties`  
**Estado:** no implementar dims hasta cerrar Silver; no implementar fact hasta cerrar dims.

## Dims (Capa 3)

| Tabla | SCD | BK | Archivos |
|---|---|---|---|
| `dim_tiempo` | T0 | `fecha` | `ddl_dim_tiempo` / `etl_dim_tiempo` |
| `dim_zona` | SCD1 | `zona_std` | `ddl_dim_zona` / `etl_dim_zona` |
| `dim_estado` | SCD1 | `estado_std` | `ddl_dim_estado` / `etl_dim_estado` |
| `dim_operacion_moneda` | SCD1 | `(operacion, moneda)` | `ddl_dim_operacion_moneda` / `etl_dim_operacion_moneda` |
| `dim_propiedad` | SCD2 | `url` | `ddl_dim_propiedad` / `etl_dim_propiedad` |

No crear: `dim_moneda`, `dim_operacion`, `dim_vendedor`.  
SCD2: trackear attrs, **no** precio/expensas. Join as-of: `fecha` en `[__START_AT, __END_AT)`.

## Fact (Capa 4)

**Tabla:** `fact_publicacion` — `ddl_fact_publicacion` / `etl_fact_publicacion`  
**Grain:** `id` ganador de `url+fecha`.  
FKs: tiempo, zona, estado, operacion_moneda, propiedad.  
Degeneradas: `id`, `url`, `tipo_vendedor_std`, `ambientes`.  
Prohibido: `agg_segmento_*`, `fact_oportunidad_*`.

Oportunidad = **vistas** (capa semántica, no esta carpeta) con windows sobre este fact.
