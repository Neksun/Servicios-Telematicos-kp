# Parcial 3 – Servicios Telemáticos  
## Caso CloudNova – Despliegue Seguro, Contenerización y Observabilidad

Este directorio contiene todos los archivos, configuraciones y capturas utilizadas durante el desarrollo del Parcial 3.

---

## 📁 Contenido del directorio

docker-webapp/ → Imagen Flask + Gunicorn
docker-apache-ssl/ → Apache con SSL dentro de Docker
webapp/ → Aplicación Flask original
prometheus/ → prometheus.yml + alerts.yml
grafana/ → dashboards exportados
screenshots/ → Evidencias

---

# 1. Despliegue Seguro con Apache + SSL
- Apache 2 configurado para servir Flask con `mod_wsgi`
- Certificado SSL autofirmado
- Redirección de HTTP → HTTPS  
- Archivos:  
  - `webapp.conf`  
  - `webapp-ssl.conf`  
  - `application.wsgi`

---

# 2. Dockerización de la aplicación

Imágenes creadas:

- `docker-webapp` → Flask + Gunicorn  
- `docker-apache-ssl` → Apache con SSL para contenido estático  

Archivos clave:

- `Dockerfile`  
- `docker-compose.yml`  

---

# 3. Despliegue en AWS EC2
- Instalación de Docker en EC2
- Pull de imágenes desde Docker Hub:
docker pull karol002/docker-webapp-web:v1
docker pull karol002/miniwebapp-apache-ssl:v1
- Exposición de puertos 80/443

---

# 4. Monitoreo con Prometheus + Node Exporter

Archivos incluidos:

- `prometheus.yml`
- `alerts.yml`

Métricas documentadas:
- CPU (`node_cpu_seconds_total`)
- Memoria (`node_memory_MemAvailable_bytes`)
- Disco (`node_filesystem_avail_bytes`)

---

# 5. Visualización con Grafana

Paneles creados:
- CPU y Memoria (Time series)
- Gauge de disco

Panel importado:
- Node Exporter Full (ID 1860)

Exportados dentro de `grafana/`.

---

# 6. Conclusión Técnica

### ✔ ¿Qué aprendí?
Aprendí a integrar despliegues seguros, contenedorización y observabilidad en un pipeline coherente. Docker facilita portabilidad, AWS permite un entorno real y Prometheus/Grafana dan visibilidad completa del rendimiento.

### ✔ ¿Qué fue lo más desafiante?
La integración entre Apache, Flask, Docker y SSL.  
En producción usaría Let’s Encrypt + Nginx reverse proxy y pipelines CI/CD para evitar errores manuales.

### ✔ ¿Por qué la observabilidad es clave en DevOps?
Permite detectar saturación, cuellos de botella y fallos antes de afectar al usuario. Prometheus y Grafana convierten el servidor en un sistema “visible” y medible, habilitando decisiones rápidas y automatización de alertas.

---

# Autor
Karol Lizeth Payares Vizcaíno – Universidad Autónoma de Occidente  
