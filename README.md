# Alquiler oportunidades (medallion)

Capa en curso: **0–1 Landing + Bronze**. Specs por carpeta.

```text
landing/   SPEC + ddl_properties_raw + etl_properties_raw
bronze/    SPEC + ddl_properties_raw + etl_properties_raw
silver/    SPEC + ddl_properties + etl_properties   (no ejecutar)
gold/      SPEC + ddl_* / etl_* dims y fact         (no ejecutar)
```

Diseño global: [docs/arquitectura.md](docs/arquitectura.md). SQL only, sin DAB.

## Workspace

1. Catálogo `alquiler_amba`, schemas `landing` y `bronze`, volume de landing.
2. Subir CSV (no pisar el path):

```bash
databricks fs cp properties_raw/properties_raw.csv dbfs:/Volumes/alquiler_amba/landing/properties_raw/fecha=backfill_historico/properties_raw.csv --profile <PROFILE>
```

3. Pipeline Lakeflow: agregar `landing/ddl_*.sql`, `landing/etl_*.sql`, `bronze/ddl_*.sql`, `bronze/etl_*.sql` (en ese orden).
4. Correr. DoD Bronze: `COUNT(*)` ≈ 1.246.717; re-run sin files nuevos no duplica.
