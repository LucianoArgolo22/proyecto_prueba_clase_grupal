-- DDL: alquiler_amba.silver.properties
-- Spec: silver/SPEC.md
-- NO EJECUTAR hasta Capa 2.

CREATE SCHEMA IF NOT EXISTS alquiler_amba.silver;

-- CREATE OR REFRESH STREAMING TABLE / MATERIALIZED VIEW alquiler_amba.silver.properties (
--   id BIGINT,
--   inmueble_bk STRING,
--   fecha DATE,
--   tipo_de_operacion_std STRING,
--   zona_std STRING,
--   estado_std STRING,
--   moneda_std STRING,
--   tipo_vendedor_std STRING,
--   quincena_id STRING,
--   ambientes DOUBLE,
--   precio DOUBLE,
--   precio_ok BOOLEAN,
--   ambientes_ok BOOLEAN,
--   es_alquiler_analizable BOOLEAN
--   -- resto según silver/SPEC.md
-- );
