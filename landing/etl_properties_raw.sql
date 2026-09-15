-- ETL: Volume CSV → landing.properties_raw
-- Spec: landing/SPEC.md
-- No pisar el mismo path. includeExistingFiles = backfill inicial.

CREATE FLOW landing_ingest_properties_raw
AS INSERT INTO alquiler_amba.landing.properties_raw BY NAME
SELECT
  id,
  ubicacion,
  precio,
  numero,
  calle,
  expensas,
  tipo_de_operacion,
  moneda,
  ambientes,
  metros_cuadrados_totales,
  metros_cuadrados_cubiertos,
  orientacion_cardinal,
  orientacion_inmueble,
  piso,
  cochera,
  antiguedad,
  estado,
  tipo_vendedor,
  url,
  zona,
  fecha,
  hora,
  _metadata.file_path AS _ingest_file,
  current_timestamp() AS _ingest_ts
FROM STREAM read_files(
  '/Volumes/alquiler_amba/landing/properties_raw',
  format => 'csv',
  header => true,
  inferColumnTypes => false,
  includeExistingFiles => true,
  schemaEvolutionMode => 'addNewColumns'
);
