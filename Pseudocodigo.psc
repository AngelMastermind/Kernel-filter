Algoritmo FiltrosConvolucion
	
    Definir i, j, ki, kj, suma, divisor Como Entero
    Definir opcion Como Entero
    Dimension imagen[5,5], kernel[3,3], resultado[3,3]
	
    // Imagen de ejemplo 5x5
    imagen[1,1] <- 10;  imagen[1,2] <- 20;  imagen[1,3] <- 30;  imagen[1,4] <- 40;  imagen[1,5] <- 50
    imagen[2,1] <- 60;  imagen[2,2] <- 70;  imagen[2,3] <- 80;  imagen[2,4] <- 90;  imagen[2,5] <- 100
    imagen[3,1] <- 110; imagen[3,2] <- 120; imagen[3,3] <- 130; imagen[3,4] <- 140; imagen[3,5] <- 150
    imagen[4,1] <- 160; imagen[4,2] <- 170; imagen[4,3] <- 180; imagen[4,4] <- 190; imagen[4,5] <- 200
    imagen[5,1] <- 210; imagen[5,2] <- 220; imagen[5,3] <- 230; imagen[5,4] <- 240; imagen[5,5] <- 250
	
    Escribir "=== APLICADOR DE FILTROS ==="
    Escribir "IMAGEN ORIGINAL:"
    Para i <- 1 Hasta 5 Hacer
        Para j <- 1 Hasta 5 Hacer
            Escribir Sin Saltar imagen[i,j], " "
        FinPara
        Escribir ""
    FinPara
	
    Escribir ""
    Escribir "1. Filtro Sharpen"
    Escribir "2. Filtro Blur"
    Escribir Sin Saltar "Elige: "
    Leer opcion
	
    // Definir kernel según opción
    Si opcion = 1 Entonces
        // Sharpen
        kernel[1,1] <- 0;   kernel[1,2] <- -1;  kernel[1,3] <- 0
        kernel[2,1] <- -1;  kernel[2,2] <- 5;   kernel[2,3] <- -1
        kernel[3,1] <- 0;   kernel[3,2] <- -1;  kernel[3,3] <- 0
        divisor <- 1
        Escribir "APLICANDO FILTRO SHARPEN"
    Sino
        // Blur
        Para i <- 1 Hasta 3 Hacer
            Para j <- 1 Hasta 3 Hacer
                kernel[i,j] <- 1
            FinPara
        FinPara
        divisor <- 9
        Escribir "APLICANDO FILTRO BLUR"
    FinSi
	
    // Aplicar convolución 3x3
    Para i <- 2 Hasta 4 Hacer
        Para j <- 2 Hasta 4 Hacer
            suma <- 0
            Para ki <- 1 Hasta 3 Hacer
                Para kj <- 1 Hasta 3 Hacer
                    suma <- suma + imagen[i+ki-2,j+kj-2] * kernel[ki,kj]
                FinPara
            FinPara
            resultado[i-1,j-1] <- suma / divisor
        FinPara
    FinPara
	
    Escribir ""
    Escribir "RESULTADO:"
    Para i <- 1 Hasta 3 Hacer
        Para j <- 1 Hasta 3 Hacer
            Escribir Sin Saltar resultado[i,j], " "
        FinPara
        Escribir ""
    FinPara
	
FinAlgoritmo