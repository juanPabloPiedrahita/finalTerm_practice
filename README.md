
# FinalTerm Practice

Repositorio creado para practicar conceptos de bases de datos y despliegue utilizando **PostgreSQL** y contenedores  **Docker** .

Este proyecto incluye:

* Una base de datos PostgreSQL empaquetada en un contenedor Docker.

---

## 🚀 Estructura del proyecto

```
root/
├── database/        # Dockerfile y scripts para la DB

```

---

## 🐘 Cómo correr la base de datos con Docker

Asegúrate de estar ubicado en el  **directorio raíz del proyecto** . Luego ejecuta lo siguiente:

```bash
docker build -t "nombreDeseado" ./database/

docker run -p 5432:5432 "nombreDeseado"
```

Esto levantará un contenedor con PostgreSQL escuchando en el puerto  **5432** .

---

## 🛠️ Conexión a la base de datos

Después de ejecutar el contenedor, puedes conectarte localmente usando:

* **pgAdmin**
* La extensión **PostgreSQL** de Visual Studio Code
* O cualquier cliente SQL de tu preferencia

---

## 🤝 Contribuciones

Metanle backend y frontend ahi melo pues :v

## 📄 Licencia

Este proyecto está bajo la licencia MIT.
