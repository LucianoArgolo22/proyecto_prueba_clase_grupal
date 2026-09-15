-- DDL: alquiler_amba.landing.properties_raw
-- Spec: landing/SPEC.md
-- Todas las columnas STRING. Sin casts de negocio.

CREATE SCHEMA IF NOT EXISTS alquiler_amba.landing;

CREATE OR REFRESH STREAMING TABLE alquiler_amba.landing.properties_raw (
  id STRING,
  ubicacion STRING,
  precio STRING,
  numero STRING,
  calle STRING,
  expensas STRING,
  tipo_de_operacion STRING,
  moneda STRING,
  ambientes STRING,
  metros_cuadrados_totales STRING,
  metros_cuadrados_cubiertos STRING,
  orientacion_cardinal STRING,
  orientacion_inmueble STRING,
  piso STRING,
  cochera STRING,
  antiguedad STRING,
  estado STRING,
  tipo_vendedor STRING,
  url STRING,
  zona STRING,
  fecha STRING,
  hora STRING,
  _ingest_file STRING,
  _ingest_ts TIMESTAMP
)
CLUSTER BY AUTO
COMMENT 'Landing 1:1 del CSV. Todo STRING. Grain = fila del archivo.';
