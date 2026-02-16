public class NumberPattern {
    public static void main(String[] args) {

        int n = 5;

        for(int i = n; i >= 1; i--) {

            // Left side numbers
            for(int j = 1; j <= i; j++) {
                System.out.print(j);
            }

            // Spaces
            for(int space = 1; space <= 2*(n-i); space++) {
                System.out.print(" ");
            }

            // Right side numbers
            for(int j = i; j >= 1; j--) {
                System.out.print(j);
            }

            System.out.println();
        }
    }
}
