# Diplomado-NorthWind
Proyecto Northwind

# Proyecto: Data Warehouse Northwind
**Diplomado en Ciencia de Datos**

## 📌 Descripción del Proyecto
Este proyecto demuestra la implementación de un ecosistema de datos completo, transformando una base de datos transaccional (OLTP) compleja en un modelo analítico (Data Warehouse) optimizado para la toma de decisiones. El objetivo principal es analizar el comportamiento de ventas de la empresa Northwind.

## 🏗️ Arquitectura de Datos

### 1. Modelo Transaccional Original (OLTP)
Se partió de la base de datos Northwind, la cual presenta una estructura normalizada en Tercera Forma Normal (3FN), ideal para operaciones rápidas de escritura pero compleja para consultas analíticas masivas.

<img width="804" height="565" alt="oltp_model" src="https://github.com/user-attachments/assets/526bde78-0632-490b-9858-c68d58c32860" />

### 2. Modelo Analítico (Data Warehouse - Estrellas)
Se diseñó un **Modelo en Estrella** que simplifica la estructura original para acelerar la velocidad de consulta y facilitar la creación de tableros de control.

*   **Tabla de Hechos (`Fact_Sales`):** Contiene las métricas de negocio (cantidad, precio, descuento) y el cálculo automático del monto neto.
*   **Dimensiones:**
    *   `Dim_Product`: Incluye la denormalización de categorías y proveedores.
    *   `Dim_Customer`: Datos consolidados de los clientes.
    *   `Dim_Time`: Dimensión granular que permite análisis por año, trimestre, mes y día de la semana.

<img width="762" height="587" alt="analytics_scope" src="https://github.com/user-attachments/assets/f72aaf8e-a677-4072-8c09-f4f5d909d444" />

## 🚀 Implementación Técnica

### ETL (Extracción, Transformación y Carga)
Se desarrollaron scripts de T-SQL para automatizar el proceso de limpieza y migración de datos. Durante este proceso, se logró:
- Consolidar información de múltiples tablas en dimensiones únicas.
- Validar la integridad referencial.
- **Resultado final:** Carga exitosa de **2,155 registros** transaccionales.

<img width="675" height="649" alt="Resultados" src="https://github.com/user-attachments/assets/5d14199c-ff51-453e-8938-2af1a166a938" />

### Artefactos del Proyecto
- **Scripts SQL:** Localizados en la carpeta `/scripts`, incluyen la creación del esquema y el proceso ETL.
- **DACPAC:** Se incluye un archivo de despliegue de base de datos generado en Visual Studio para facilitar la portabilidad del modelo.

## 🛠️ Tecnologías Utilizadas
- **Motor de Base de Datos:** SQL Server 2022
- **Herramientas de Desarrollo:** SQL Server Management Studio (SSMS), Visual Studio (SSDT)
- **Lenguaje:** T-SQL (Transact-SQL)

## 📁 Estructura del Repositorio
- `/DACPAC`: Archivo para despliegue automático del esquema.
- `/Scripts_SQL`: Código fuente para la creación y población del DW.
- `/Images`: Documentación visual del modelo y validaciones.

---
**Autor:** Ivan Sergio Rivera Vidaurre
*Diplomado en Ciencia de Datos*
