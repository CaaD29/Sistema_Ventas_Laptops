
# 💻 Sistema Integral de Gestión de Ventas y Business Intelligence (Laptops)

[![Mira el video del funcionamiento](https://img.youtube.com/vi/wk6tA3nx7VI/maxresdefault.jpg)](https://www.youtube.com/watch?v=wk6tA3nx7VI)

*Haz clic en la imagen superior para ver la demostración completa de la integración (60 segundos).*

## 📝 Descripción del Proyecto
Este proyecto es una solución integral para la digitalización de procesos de venta y análisis de datos. Desarrollé una aplicación multiplataforma para la gestión de inventario de laptops, conectada a una base de datos en la nube y visualizada a través de un dashboard interactivo de BI.

---

## 🚀 Tecnologías Utilizadas
* **Frontend:** AppSheet (Desarrollo No-Code para captura de datos).
* **Backend:** MySQL alojado en **Aiven** (Base de datos relacional en la nube).
* **Business Intelligence:** Power BI Desktop (Análisis y visualización de datos).
* **Lenguajes:** SQL (Modelado y consultas).

---

## 🏗️ Arquitectura del Sistema
El flujo de datos está diseñado para garantizar la sincronización en tiempo real y la persistencia de la información:

1.  **Captura (AppSheet):** Interfaz móvil/escritorio donde se registran productos, clientes y transacciones.
2.  **Almacenamiento (Aiven/MySQL):** Los datos viajan vía API/Conector directo a una instancia de MySQL en la nube.
3.  **Análisis (Power BI):** Conexión vía *MySQL Connector/NET* para la extracción, transformación (Power Query) y carga de datos para reportes automáticos.

---

## 🧠 Lógica de Negocio y Funcionalidades Clave

### 🛡️ Borrado Lógico (Integridad Referencial)
Uno de los mayores retos técnicos fue manejar la eliminación de productos sin romper el historial de ventas.
* **Problema:** Al intentar eliminar un producto vinculado a una venta antigua, la base de datos arrojaba un error de *Foreign Key Constraint*.
* **Solución:** Implementé una columna `Estado` en la tabla `Productos`. En lugar de eliminar la fila física, la App cambia el estado a `"Eliminado"`.
* **Beneficio:** Los reportes de Power BI mantienen los datos históricos exactos, mientras que el vendedor solo ve los productos con `Estado = "Activo"` en la App.

### ✅ Validaciones Automatizadas
* Reglas en AppSheet para impedir ventas si el stock es insuficiente.
* Slices (Filtros dinámicos) para garantizar que los productos descontinuados no aparezcan en nuevos formularios de venta.

---

## 📊 Dashboard de Power BI
El tablero responde a preguntas críticas de negocio mediante los siguientes KPIs:
* **Tendencia Temporal:** Análisis de ingresos diarios/semanales.
* **Salud del Inventario:** Gráfico de anillo que muestra el % de catálogo activo vs. descontinuado.
* **Top 5 Modelos:** Identificación de las laptops con mayor rotación para optimizar la recompra.

---

## 📂 Estructura del Repositorio
* `📂 database/`: Scripts `.sql` para la creación de tablas y constraints.
* `📂 documentation/`: Documentación técnica detallada del proyecto.
* `📂 reports/`: Archivo `.pbix` con el modelo semántico y visualizaciones.

---

## 🛠️ Instalación y Mantenimiento
1.  **DB:** Ejecutar el script SQL en una instancia de MySQL.
2.  **App:** Vincular la tabla de MySQL como fuente de datos en AppSheet.
3.  **BI:** Abrir el archivo de Power BI y actualizar las credenciales de origen de datos para refrescar los gráficos.

---
**Desarrollado como Proyecto de Prácticas Pre-Profesionales - 2026**
