# Verificacion de los ejercicios del curso. Se carga al principio de cada cuaderno.
#
# Nunca llama a stop(). Un error dentro de un chunk aborta el render completo y el
# alumno se queda sin documento justo cuando se equivoco, que es cuando mas lo necesita.

fallo <- function(mensaje) {
  cat("[ ] ", mensaje, "\n", sep = "")
  invisible(FALSE)
}

# integer y double son clases distintas pero nadie quiere fallar un ejercicio por
# haber escrito 344 en vez de 344L.
tipo <- function(x) {
  if (is.numeric(x)) "numerico" else class(x)[1]
}

chequear <- function(nombre, esperado, tol = 1e-8) {
  if (!exists(nombre, envir = globalenv())) {
    return(fallo(paste0("Todavia no definiste '", nombre, "'.")))
  }
  obtenido <- get(nombre, envir = globalenv())

  # El orden de los chequeos no es arbitrario: va del diagnostico mas util al menos
  # util. Si alguien dejo una columna como texto, decirle "difiere en 0.3" no lo
  # ayuda a encontrar la causa; decirle que es texto, si.
  if (tipo(obtenido) != tipo(esperado)) {
    return(fallo(sprintf("'%s' es de tipo %s y se esperaba %s.",
                         nombre, tipo(obtenido), tipo(esperado))))
  }
  if (length(obtenido) != length(esperado)) {
    return(fallo(sprintf("'%s' tiene %d elemento(s) y se esperaba(n) %d.",
                         nombre, length(obtenido), length(esperado))))
  }
  if (anyNA(obtenido) && !anyNA(esperado)) {
    return(fallo(sprintf("'%s' tiene NA. Fijate si falta na.rm = TRUE.", nombre)))
  }

  # coef(), quantile() y t.test()$parameter devuelven el valor con nombre pegado
  # ("flipper_length_mm", "2.5%", "df"). all.equal() lo trata como diferencia y el
  # alumno falla un ejercicio que tenia bien.
  diferencia <- all.equal(unname(obtenido), unname(esperado), tolerance = tol)
  if (!isTRUE(diferencia)) {
    return(fallo(sprintf("'%s' no da el valor esperado. %s", nombre, diferencia[1])))
  }

  cat("[x] Correcto\n")
  invisible(TRUE)
}
