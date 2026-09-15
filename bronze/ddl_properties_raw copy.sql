-- DDL: alquiler_amba.bronze.properties_raw
-- Spec: bronze/SPEC.md
-- Tipos relajados. fecha/hora STRING. Expects warn, no drop.

CREATE SCHEMA IF NOT EXISTS alquiler_amba.bronze;

CREATE OR REFRESH STREAMING TABLE alquiler_amba.bronze.properties_raw (
  id DOUBLE,
  ubicacion STRING,
  precio DOUBLE,
  numero DOUBLE,
  calle STRING,
  expensas DOUBLE,
  tipo_de_operacion STRING,
  moneda STRING,
  ambientes DOUBLE,
  metros_cuadrados_totales DOUBLE,
  metros_cuadrados_cubiertos DOUBLE,
  orientacion_cardinal STRING,
  orientacion_inmueble STRING,
  piso DOUBLE,
  cochera DOUBLE,
  antiguedad DOUBLE,
  estado STRING,
  tipo_vendedor STRING,
  url STRING,
  zona STRING,
  fecha STRING,
  hora STRING,
  _rescued_data STRING,
  _ingest_file STRING,
  _ingest_ts TIMESTAMP,
  CONSTRAINT id_not_null EXPECT (id IS NOT NULL),
  CONSTRAINT fecha_not_null EXPECT (fecha IS NOT NULL)
)
CLUSTER BY AUTO
COMMENT 'Bronze as-is desde landing. Grain = fila del CSV.';
