# 🚀 n8n Freelancer Starter - Plantilla Ultra-Ligera para Railway

> Despliega n8n en Railway por ~$3-5 USD/mes - Perfecto para freelancers, consultores y equipos pequeños

[![Desplegar en Railway](https://railway.app/button.svg)](https://railway.app/template/n8n-freelancer)

## 🎯 ¿Qué es esto?

Un despliegue ultra-ligero de n8n optimizado para:
- **Freelancers y Consultores** iniciando negocios de automatización
- **Equipos Pequeños** (1-10 clientes activos)
- **Operaciones Económicas** (~$3-5 USD/mes)
- **Mercado PYME Mexicano** (localización en español, zona horaria configurada)

## ✨ Características

✅ **Funcionalidad Completa de n8n** - Todas las 400+ integraciones funcionan
✅ **Webhooks HTTPS** - Triggers webhook listos para producción
✅ **Seguro por Defecto** - Autenticación básica activada
✅ **Base de Datos SQLite** - Sin costos de PostgreSQL
✅ **Limpieza Automática** - Retención de 7 días de ejecuciones
✅ **Localización Mexicana** - Zona horaria America/Mexico_City, UI en español
✅ **Optimizado en Recursos** - Uso mínimo de CPU/RAM

## 💰 Desglose de Costos

```
Plan Hobby de Railway: $5 USD/mes (incluye $5 de crédito gratis)
Uso Esperado:          ~$3-5 USD/mes
- Cómputo: ~$2-3 USD/mes (0.1-0.2 vCPU)
- Almacenamiento: ~$1 USD/mes (volumen 1GB)
- Ancho de Banda: Incluido

Total: $3-5 USD/mes para 1-10 workflows
```

## 🚀 Despliegue Rápido

### Opción 1: Despliegue en Un Clic en Railway (Recomendado)

1. Haz clic en el botón "Desplegar en Railway" arriba
2. Conecta tu cuenta de GitHub
3. Configura tus credenciales de autenticación:
   - `N8N_BASIC_AUTH_USER`: Tu nombre de usuario
   - `N8N_BASIC_AUTH_PASSWORD`: Contraseña fuerte
4. Espera 2-3 minutos para el despliegue
5. Accede a tu instancia de n8n en la URL generada por Railway

### Opción 2: Despliegue Manual

#### Prerequisitos
- Cuenta de Railway ([registrarse gratis](https://railway.app))
- Railway CLI instalado: `npm i -g @railway/cli`
- Git instalado

#### Pasos

```bash
# 1. Clonar este repositorio
git clone https://github.com/tripl3tr3s/n8n-freelancer-starter.git
cd n8n-freelancer-starter

# 2. Iniciar sesión en Railway
railway login

# 3. Crear nuevo proyecto
railway init

# 4. El volumen persistente está configurado en railway.toml
# El volumen se monta automáticamente en /home/node/.n8n para la base de datos SQLite y workflows

# 5. Configurar variables de entorno
railway variables set N8N_BASIC_AUTH_ACTIVE=true
railway variables set N8N_BASIC_AUTH_USER=admin
railway variables set N8N_BASIC_AUTH_PASSWORD=tu-contraseña-segura
railway variables set DB_TYPE=sqlite
railway variables set EXECUTIONS_DATA_PRUNE=true
railway variables set EXECUTIONS_DATA_MAX_AGE=168
railway variables set GENERIC_TIMEZONE=America/Mexico_City
railway variables set N8N_METRICS=false
railway variables set N8N_DIAGNOSTICS_ENABLED=false

# 6. Desplegar
railway up

# 7. Generar dominio público
railway domain
```

## 🔧 Configuración

### Variables de Entorno Requeridas

| Variable | Valor | Descripción |
|----------|-------|-------------|
| `N8N_BASIC_AUTH_ACTIVE` | `true` | Activar protección por contraseña |
| `N8N_BASIC_AUTH_USER` | Tu elección | Nombre de usuario administrador |
| `N8N_BASIC_AUTH_PASSWORD` | Tu elección | Contraseña administrador (¡usa una contraseña fuerte!) |
| `DB_TYPE` | `sqlite` | Usar SQLite para optimización de costos |
| `EXECUTIONS_DATA_PRUNE` | `true` | Auto-eliminar ejecuciones antiguas |
| `EXECUTIONS_DATA_MAX_AGE` | `168` | Mantener 7 días de historial |

### Variables de Entorno Recomendadas

| Variable | Valor | Descripción |
|----------|-------|-------------|
| `GENERIC_TIMEZONE` | `America/Mexico_City` | Configura tu zona horaria |
| `N8N_DEFAULT_LOCALE` | `es` | UI en español |
| `N8N_METRICS` | `false` | Desactivar métricas (ahorra recursos) |
| `N8N_DIAGNOSTICS_ENABLED` | `false` | Desactivar diagnósticos |
| `N8N_LOG_LEVEL` | `warn` | Reducir sobrecarga de logs |

Ver `environment.example` para opciones de configuración completas.

## 📊 Qué Puedes Hacer Con Esta Configuración

### Capacidad
- **Workflows**: 1-10 workflows activos
- **Ejecuciones**: <1000/día
- **Almacenamiento**: 1GB (base de datos SQLite + datos de ejecución)
- **Clientes**: 5-10 clientes concurrentes

### Perfecto Para
- Aprender automatización con n8n
- Construir workflows de demostración
- Primeros 5-10 despliegues de clientes
- Probar viabilidad del negocio
- Proyectos de cursos

### No Adecuado Para
- Producción de alto volumen (>1000 ejecuciones/día)
- Equipos grandes (>10 usuarios concurrentes)
- Configuraciones complejas multi-worker
- Confiabilidad de nivel empresarial

## 🔒 Mejores Prácticas de Seguridad

1. **Contraseñas Fuertes**: Usa contraseñas de 16+ caracteres
2. **Actualizaciones Regulares**: n8n se actualiza automáticamente en Railway
3. **Seguridad de Webhooks**: Usa autenticación de webhook para triggers sensibles
4. **Encriptación de Credenciales**: n8n encripta credenciales almacenadas por defecto
5. **Solo HTTPS**: Railway proporciona SSL automático

## 📈 Ruta de Actualización

Cuando superes esta configuración:

### Actualizar a PostgreSQL (~$10-15 USD/mes)
```bash
# Agregar plugin PostgreSQL de Railway
railway add postgresql

# Actualizar variables de entorno
railway variables set DB_TYPE=postgresdb
railway variables set DB_POSTGRESDB_HOST=${{RAILWAY_POSTGRES_HOST}}
railway variables set DB_POSTGRESDB_PORT=${{RAILWAY_POSTGRES_PORT}}
railway variables set DB_POSTGRESDB_DATABASE=${{RAILWAY_POSTGRES_DATABASE}}
railway variables set DB_POSTGRESDB_USER=${{RAILWAY_POSTGRES_USER}}
railway variables set DB_POSTGRESDB_PASSWORD=${{RAILWAY_POSTGRES_PASSWORD}}

# Re-desplegar
railway up
```

### Agregar Workers (~$20-30 USD/mes)
- Activar `EXECUTIONS_PROCESS=own` para modo main + worker
- Agregar Redis para gestión de colas
- Escalar horizontalmente con múltiples workers

Ver `docs/UPGRADE_PATH.md` para guías de migración detalladas.

## 🐛 Solución de Problemas

### Los Datos No Persisten Entre Despliegues
1. Verificar que el volumen esté configurado en `railway.toml`:
   ```toml
   [[deploy.volumes]]
   mountPath = "/home/node/.n8n"
   ```
2. Verificar que el volumen esté montado: `railway run sh -c "ls -la /home/node/.n8n"`
3. Verificar que exista la base de datos SQLite: `railway run sh -c "ls -la /home/node/.n8n/database.sqlite"`

### No Puedo Acceder a la UI de n8n
1. Revisar logs de Railway: `railway logs`
2. Verificar que el dominio esté activo: `railway domain`
3. Esperar 2-3 minutos después del despliegue

### "Autenticación Fallida"
1. Verificar credenciales en el dashboard de Railway
2. Revisar variables de entorno: `railway variables`
3. Intentar resetear la contraseña

### Los Workflows No Se Ejecutan
1. Revisar historial de ejecuciones en la UI de n8n
2. Revisar logs de Railway para errores
3. Verificar que las URLs de webhook sean HTTPS

### Costos Altos
1. Revisar el dashboard de uso de Railway
2. Reducir frecuencia de ejecuciones
3. Activar poda de ejecuciones
4. Desactivar workflows no usados

Ver `docs/TROUBLESHOOTING.md` para guía completa.

## 🌟 Casos de Uso para PYMEs Mexicanas

Esta plantilla está optimizada para automatización del mercado mexicano:

## 📄 Licencia

Licencia MIT - Ver archivo LICENSE para detalles

## 🙏 Agradecimientos

- Construido con [n8n](https://n8n.io) - Plataforma de automatización fair-code
- Desplegado en [Railway](https://railway.app) - Plataforma de infraestructura
- Optimizado para el mercado PYME mexicano

---

**Construido con ❤️ para la comunidad de automatización mexicana**

*Despliega una vez, automatiza todo.* 🚀