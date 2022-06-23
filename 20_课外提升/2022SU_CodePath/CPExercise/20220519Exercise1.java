import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.util.regex.*;
import java.util.stream.*;
import static java.util.stream.Collectors.joining;
import static java.util.stream.Collectors.toList;

public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        int arrCount = Integer.parseInt(bufferedReader.readLine().trim());

        List<Integer> arr = IntStream.range(0, arrCount).mapToObj(i -> {
            try {
                return bufferedReader.readLine().replaceAll("\\s+$", "");
            } catch (IOException ex) {
                throw new RuntimeException(ex);
            }
        })
                .map(String::trim)
                .map(Integer::parseInt)
                .collect(toList());

        int[] nums = new int[arr.size()];
        int i = 0;
        for (int num : arr) {
            nums[i] = num;
            i++;
        }
        Result.fizzbuzz(nums);

        bufferedReader.close();
    }
}

class Result {

    /*
     * Complete the 'fizzbuzz' function below.
     */
    public static void fizzbuzz(int[] nums) {
        int List_length = nums.size();
        for (int count = 0; count < List_length; count++) {
            if (nums[count] % 3 == 0) {
                System.out.print("fizz");
            }
            if (nums[count] % 5 == 0) {
                System.out.print("buzz");
            }
            if (nums[count] % 5 != 0 && nums[count] % 3 != 0) {
                System.out.print(nums[count]);
            }
            System.out.print("\n");
        }

    }

}
