# Curso de R

Material del curso. Gratis, asincrónico, sin fecha de entrega.

Para quien ya sabe estadística y nunca programó.

## Dos formas de usarlo

### En el navegador, sin instalar nada

Entrá al proyecto del curso en Posit Cloud y hacé tu propia copia. Tiene todo esto ya
cargado y los paquetes instalados.

Es la forma recomendada para empezar.

### En tu computadora

Necesitás R y RStudio instalados. Está explicado en `guia-instalacion.pdf`, con la lista
de qué suele fallar y cómo se arregla.

Con eso listo, abrí RStudio y pegá estas dos líneas en la consola:

```r
install.packages("usethis")
usethis::use_course("rhogner/curso-r")
```

Baja todo, lo descomprime en tu escritorio y lo abre. No hace falta saber git ni tener
cuenta de GitHub.

Después, una vez:

```r
source("instalar-paquetes.R")
```

## Qué hay acá

| Archivo | Qué es |
|---|---|
| `clase-01-ejercicios.qmd` y siguientes | Los ejercicios de cada clase |
| `datos/` | Los archivos que usan los ejercicios |
| `chequear.R` | Lo que corrige tus respuestas. No hace falta abrirlo |
| `guia-instalacion.pdf` | Instalar R, y qué hacer cuando falla |
| `instalar-paquetes.R` | Instala todo lo que el curso necesita |

## Cómo se usan los cuadernos

Cada ejercicio tiene dos bloques de código.

En el primero escribís tu respuesta. En el segundo no tocás nada: lo corrés y te dice si
diste en el clavo.

```
[x] Correcto
```

o, si algo no cierra:

```
[ ] 'peso_medio' tiene NA. Fijate si falta na.rm = TRUE.
```

Nadie del otro lado mira esto. Es para vos.

## Las soluciones

Se publican acá el **11 de noviembre**, con el porqué de cada ejercicio y no solo la
línea de código.

## Si algo se rompe

El primer bloque de cada cuaderno carga los paquetes. Si lo salteaste, todo lo demás
falla con `could not find function`. Corrélo y volvé a intentar.

Para empezar de cero: en RStudio, menú Session, Restart R.
