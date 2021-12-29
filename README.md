
**Ejecutar App en desarrollo con docker compose:**

```
docker-compose -f docker-compose-dev.yml up
```
* En desarrollo la app se ejecuta en: <http://localhost:3003/>

**Crea imagen para produccion**

```
docker build -t <image-name> .
```