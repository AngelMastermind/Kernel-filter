import java.util.Scanner;

public class Main8 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int[][] imagen = {
            {10, 20, 30, 40, 50},
            {60, 70, 80, 90, 100},
            {110, 120, 130, 140, 150},
            {160, 170, 180, 190, 200},
            {210, 220, 230, 240, 250}
        };

        int[][] sharpen = {{0,-1,0},{-1,5,-1},{0,-1,0}};
        int[][] blur = {{1,1,1},{1,1,1},{1,1,1}};

        System.out.println("IMAGEN ORIGINAL:");
        mostrar(imagen);

        System.out.print("\n1. Sharpen  2. Blur  Elige: ");
        int op = sc.nextInt();

        if (op == 1) {
            System.out.println("\nFILTRO SHARPEN:");
            convolucion(imagen, sharpen, 1);
        } else {
            System.out.println("\nFILTRO BLUR:");
            convolucion(imagen, blur, 9);
        }
    }

    public static void mostrar(int[][] m) {
        for (int[] f : m) {
            for (int v : f) System.out.printf("%5d", v);
            System.out.println();
        }
    }

    public static void convolucion(int[][] img, int[][] kernel, int div) {
        int f = img.length;
        int c = img[0].length;
        int[][] res = new int[f-2][c-2];

        for (int i = 1; i < f-1; i++) {
            for (int j = 1; j < c-1; j++) {
                int suma = 0;
                for (int ki = -1; ki <= 1; ki++) {
                    for (int kj = -1; kj <= 1; kj++) {
                        suma += img[i+ki][j+kj] * kernel[ki+1][kj+1];
                    }
                }
                res[i-1][j-1] = suma / div;
            }
        }
        mostrar(res);
    }
}