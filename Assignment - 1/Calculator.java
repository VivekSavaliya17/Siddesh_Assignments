import java.util.Scanner;

class Calculator {

    static int add(int a, int b) {
        return a + b;
    }

    static int subtract(int a, int b) {
        return a - b;
    }

    static int multiply(int a, int b) {
        return a * b;
    }

    static double divide(int a, int b) {
        return (double)a / b;
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter two numbers:");
        int a = sc.nextInt();
        int b = sc.nextInt();

        System.out.println("Addition: " + add(a,b));
        System.out.println("Subtraction: " + subtract(a,b));
        System.out.println("Multiplication: " + multiply(a,b));
        System.out.println("Division: " + divide(a,b));
    }
}
