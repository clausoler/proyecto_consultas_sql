# DataProject: Lógica. Consultas SQL

## 📃 Descripción del proyecto

Este proyecto tiene como objetivo aplicar y consolidar los conocimientos adquiridos durante el módulo de SQL mediante la resolución de consultas sobre una base de datos relacional de una tienda de películas ficticia.

A lo largo del proyecto se trabajó con una base de datos inspirada en el modelo Sakila/DVD Rental, compuesta por múltiples tablas relacionadas entre sí, permitiendo realizar consultas simples y avanzadas orientadas al análisis y explotación de datos.

Durante el desarrollo del proyecto se utilizaron distintas técnicas y estructuras SQL con el fin de reforzar el manejo de bases de datos relacionales y las buenas prácticas de programación en SQL. Entre los principales conceptos trabajados se incluyen:

* consultas sobre una única tabla,
* relaciones entre tablas mediante JOIN,
* subconsultas,
* Common Table Expressions (CTEs),
* vistas,
* estructuras de datos temporales,
* consultas de agregación,
* agrupaciones y ordenaciones,
* aplicación de buenas prácticas SQL.

El proyecto fue desarrollado utilizando PostgreSQL como sistema gestor de bases de datos y DBeaver como herramienta gráfica para la gestión y ejecución de consultas.

---

## 🗂️ Estructura del proyecto

```text
├── BBDD/
│
│     ├── base_datos/
│        └── BBDD_Proyecto_shakila_sinuser.sql
│
│     ├── esquema_database/
│         └── peliculas_database.png
│
├── consultas_resueltas/
│   └── consultas.sql
│
├── Enunciado_proyecto/
│   └── EnunciadoDataProject_SQL.Lógica.pdf
│
└── README.md
```

---

## 📁 Descripción de las carpetas

### `base_datos/`

Contiene el script SQL utilizado para generar e importar la base de datos del proyecto en PostgreSQL.

### `esquema_database/`

Incluye el diagrama relacional de la base de datos, mostrando las tablas, claves primarias y relaciones existentes entre ellas.

### `consultas_resueltas/`

Contiene el archivo SQL con todas las consultas desarrolladas durante el proyecto.

### `Enunciado_proyecto/`

Incluye el documento original con los ejercicios y requisitos planteados para el desarrollo del proyecto.

### `README.md`

Documento principal del proyecto donde se describe la estructura, objetivos, herramientas utilizadas y principales conclusiones.

---

## 👩‍💻 Instalación y requisitos

Este proyecto ha sido desarrollado utilizando las siguientes herramientas:

* PostgreSQL
* DBeaver

Para ejecutar el proyecto:

1. Crear una base de datos en PostgreSQL.
2. Importar el archivo:

```text
BBDD_Proyecto_shakila_sinuser.sql
```

3. Abrir el proyecto en DBeaver.
4. Ejecutar las consultas incluidas en:

```text
consultas.sql
```

---

## 🧠 Contenidos trabajados

Durante el proyecto se han aplicado los siguientes conocimientos SQL:

* Manejo de consultas básicas.
* Relaciones entre tablas mediante INNER JOIN, LEFT JOIN y CROSS JOIN.
* Consultas de agregación (COUNT, AVG, SUM, etc.).
* Agrupaciones y ordenaciones (GROUP BY, ORDER BY, HAVING).
* Uso de subconsultas.
* Uso de CTEs (WITH).
* Creación de vistas.
* Uso de estructuras temporales.
* Aplicación de buenas prácticas SQL y legibilidad del código.

---

## 🗺️ Esquema de la base de datos

El proyecto incluye un diagrama relacional de la base de datos utilizado para comprender la estructura de tablas y relaciones.

```text
BBDD/esquema_database/peliculas_database.png
```

---

## 🤓 Resultados y conclusiones

El desarrollo de este proyecto ha permitido aplicar de forma práctica distintos conceptos fundamentales del lenguaje SQL sobre una base de datos relacional compleja y estructurada.

La base de datos utilizada presenta múltiples relaciones entre tablas y diferentes tipos de entidades relacionadas con películas, actores, clientes, alquileres, categorías y tiendas, lo que ha permitido trabajar con consultas de distinta dificultad y complejidad.

A lo largo del proyecto se realizaron consultas orientadas a:

* extracción de información,
* filtrado de datos,
* agregaciones,
* análisis de alquileres,
* relaciones entre entidades,
* subconsultas y estructuras avanzadas de SQL.

Además, el proyecto ha servido para reforzar el razonamiento lógico aplicado a bases de datos relacionales, así como el manejo de buenas prácticas en la escritura y organización de consultas SQL.

En conjunto, este proyecto constituye una base sólida para el aprendizaje y práctica de SQL, ya que permite trabajar con una gran variedad de escenarios relacionados con el análisis y explotación de datos en entornos relacionales.

---

## 🚀 Próximos pasos

Aunque el proyecto ha permitido consolidar numerosos conocimientos relacionados con SQL y bases de datos relacionales, existen distintas líneas de mejora y ampliación para continuar desarrollando competencias más avanzadas.

Entre los posibles próximos pasos destacan:

* Trabajar con bases de datos de mayor tamaño y complejidad.
* Incorporar procedimientos almacenados y funciones.
* Profundizar en técnicas avanzadas de optimización de consultas.
* Implementar triggers y automatizaciones.
* Diseñar modelos de datos más complejos orientados a entornos empresariales reales.
* Integrar SQL con herramientas de análisis y visualización de datos como Power BI o Python.

---

## ✍️ Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar el proyecto, puedes abrir una issue o realizar un pull request.

---

## 🗯️ Autor

**Claudia Soler**
[@clausoler](https://github.com/clausoler/proyecto_consultas_sql)

