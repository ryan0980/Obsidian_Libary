import java.util.HashMap;

class Main {
    public static void main(String args) {
        int sum = 0;

        if (args.length() == 0) {
            System.out.print(sum);
        }

        for (int count = 0; count < args.length(); count++) {
            if (args.charAt(count) == "M") {
                sum += 1000;
            }
            if (args.charAt(count) == "D") {
                sum += 500;
            }
            if (args.charAt(count) == "C") {
                sum += 100;
            }
            if (args.charAt(count) == "x") {
                sum += 10;
            }
            if (args.charAt(count) == "V") {
                sum += 5;
            }
            if (args.charAt(count) == "I") {
                // count++
                if (args.charAt(count + 1) == "V") {
                    count++;
                    sum += 4;
                }
                if (args.charAt(count + 1) == "X") {
                    count++;
                    sum += 9;
                } else {
                    sum += 1;
                }
            }
        }

    }

}
