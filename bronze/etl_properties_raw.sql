-- ETL: landing.properties_raw → bronze.properties_raw
-- Spec: bronze/SPEC.md
-- Sin *_std, sin filtros de negocio.

CREATE FLOW bronze_ingest_properties_raw
AS INSERT INTO alquiler_amba.bronze.properties_raw BY NAME
SELECT
  CAST(id AS DOUBLE) AS id,
  ubicacion,
  CAST(precio AS DOUBLE) AS precio,
  CAST(numero AS DOUBLE) AS numero,
  calle,
  CAST(expensas AS DOUBLE) AS expensas,
  tipo_de_operacion,
  moneda,
  CAST(ambientes AS DOUBLE) AS ambientes,
  CAST(metros_cuadrados_totales AS DOUBLE) AS metros_cuadrados_totales,
  CAST(metros_cuadrados_cubiertos AS DOUBLE) AS metros_cuadrados_cubiertos,
  orientacion_cardinal,
  orientacion_inmueble,
  CAST(piso AS DOUBLE) AS piso,
  CAST(cochera AS DOUBLE) AS cochera,
  CAST(antiguedad AS DOUBLE) AS antiguedad,
  estado,
  tipo_vendedor,
  url,
  zona,
  fecha,
  hora,
  CAST(NULL AS STRING) AS _rescued_data,
  _ingest_file,
  current_timestamp() AS _ingest_ts
FROM STREAM (alquiler_amba.landing.properties_raw);
