# AutoExec

**AutoExec** es un script que automatiza la creación de archivos `.desktop` para ejecutables en Linux, permitiendo ejecutar aplicaciones desde el entorno gráfico sin tener que lanzarlas desde la consola.

## Características

- Crea automáticamente un archivo `.desktop` en la carpeta `~/.local/share/applications`.
- Permite especificar el nombre, la ruta del ejecutable y el icono de la aplicación.
- No es necesario lanzar las aplicaciones desde la consola.

## Requisitos

- Linux con entorno de escritorio compatible con archivos `.desktop`.
- Permisos de administrador para ejecutar el script.
  
## Uso

1. Clona este repositorio o descarga el archivo `autoexec.sh`.
2. Dale permisos de ejecución al script:
   
   ```bash
   chmod +x autoexec.sh
   ```
