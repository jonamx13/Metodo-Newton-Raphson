# Método de Newton-Raphson con Visualización Gráfica

Este proyecto implementa el método de **Newton-Raphson** para encontrar raíces de funciones no lineales, utilizando GNU Octave. Incluye visualización detallada del proceso iterativo con gráficos personalizados.

## 📌 Autor
- **Nombre:** Jonathan Meixueiro  
- **Matrícula:** 240694  
- **Asesor:** Claudio Hiram Carmona Jurado

## 📂 Archivos

| Archivo              | Descripción |
|----------------------|-------------|
| `newton_main.m`      | Script principal. Define la función, parámetros, llama al método y grafica el resultado. |
| `newton_raphson.m`   | Función que ejecuta el método de Newton-Raphson paso a paso y retorna la raíz. |
| `graficar_resultado.m` | Función que genera una gráfica con la función, las iteraciones y la raíz final. |

## ⚙️ Requisitos

- [GNU Octave](https://www.gnu.org/software/octave/) (recomendado: versión 7.3 o superior)

- **Alternativa sin instalación**:  
  Puedes ejecutar este proyecto directamente en línea mediante [Octave Online](https://octave-online.net).  
  Solo necesitas:
    1. Crear una cuenta gratuita.
    2. Subir los tres archivos `.m` del repositorio (`newton_main.m`, `newton_raphson.m`, `graficar_resultado.m`).
    3. Ejecutar `newton_main` desde la consola del sitio.

## 🚀 Instrucciones de uso

1. Abre Octave.
2. Coloca los tres archivos `.m` en el mismo directorio.
3. Ejecuta el archivo `newton_main.m`:
   ```octave
   newton_main
   ```
## 📈 Resultado
El programa:

- Calcula la raíz aproximada de la función `f(x) = cos(x) - x³` a partir de una estimación inicial.

- Imprime en consola el número de iteraciones y la raíz encontrada.

- Muestra una gráfica que incluye:

    * La función evaluada.

    * Las iteraciones con líneas guía y etiquetas.

    * La raíz final marcada en rojo.

![1](https://github.com/user-attachments/assets/f033ba69-3cc5-490f-b94c-d5021ff09699)

## 📌 Notas
El color naranja en la gráfica está definido como `RGB [1, 0.5, 0]`, ya que Octave no acepta nombres como `orange`.

El método verifica si la derivada es cercana a cero para evitar divisiones inválidas.

En caso de no converger, se lanza un error indicando que se superó el número máximo de iteraciones.


## 🧾 Créditos
- **Materia:** Métodos Numéricos
- **Asesor:** Claudio Hiram Carmona Jurado
- **Alumno:** Jonathan Eduardo Olivas Meixueiro
- **Matricula:** 240694
- **Fecha de entrega:** 05/Junio/2025
