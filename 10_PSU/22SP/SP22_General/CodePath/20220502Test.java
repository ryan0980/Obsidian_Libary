import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;

class Result {

    /*
     * Complete the 'merge' function below.
     *
     * The function is expected to return an List<Integer>.
     * The function accepts following parameters:
     * 1. List<Integer> nums1
     * 2. List<Integer> nums2
     */

    public static List<Integer> merge(List<Integer> nums1, List<Integer> nums2) {
        if (nums1.size() + nums2.size() == 0) {// check if both list is empty input;
            System.out.print("incurrect input");
            return nums2;
        }
        if (nums1.size() == 0) {// check if list1 is empty
            return nums2;
        }
        if (nums2.size() == 0) {// check if list2 is empty
            return nums1;
        }

        int a = 0;
        int b = 0;
        int k = 0;
        int length1 = nums1.size();
        int length2 = nums2.size();
        List<Integer> ans = new ArrayList<Integer>(length1 + length2);
        // while(a<length1&&b<length2){
        // if(nums1.get(a)>nums2.get(b)){
        // ans.add(nums1.get(a));
        // a++;}
        // else{
        // ans.add(nums1.get(b));
        // b++;
        // }

        // }
        while (a < length1 && b < length2) {
            if (nums1.get(a) > nums2.get(b)) {
                ans.set(k, nums1.get(a));
                a++;
                k++;
            } else {
                ans.set(k, nums1.get(b));
                b++;
                k++;
            }
        }
        return ans;

    }

}

public class Solution {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        int nums1Count = Integer.parseInt(bufferedReader.readLine().trim());

        List<Integer> nums1 = new ArrayList<>();

        for (int i = 0; i < nums1Count; i++) {
            int nums1Item = Integer.parseInt(bufferedReader.readLine().trim());
            nums1.add(nums1Item);
        }

        int nums2Count = Integer.parseInt(bufferedReader.readLine().trim());

        List<Integer> nums2 = new ArrayList<>();

        for (int i = 0; i < nums2Count; i++) {
            int nums2Item = Integer.parseInt(bufferedReader.readLine().trim());
            nums2.add(nums2Item);
        }

        List<Integer> result = Result.merge(nums1, nums2);

        for (int i = 0; i < result.size(); i++) {
            bufferedWriter.write(String.valueOf(result.get(i)));

            if (i != result.size() - 1) {
                bufferedWriter.write("\n");
            }
        }

        bufferedWriter.newLine();

        bufferedReader.close();
        bufferedWriter.close();
    }
}
