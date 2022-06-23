import java.io.*;
import java.math.*;
import java.security.*;
import java.text.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.regex.*;



class Solution {

    /*
     * Complete the 'singleNumber' function below.
     *
     * The function is expected to return an INTEGER.
     */

    public static int singleNumber(int[] nums) {
      HashSet<Integer> set=new HashSet<>();
      for(int i:nums){
        if(set.contains(i)){
          set.remove(i);
        }
        else{
          set.add(i);
        }
      }
      for(int i:set){
        return i;
      }
      return 0;
    }


    private static final Scanner scanner = new Scanner(System.in);
    public static void main(String[] args) throws IOException {
        String allNums = scanner.nextLine().trim();
        String[] splitNums = allNums.split("\\s+");
        int[] nums = new int[splitNums.length];
        for (int i = 0; i < splitNums.length; i++){
            nums[i] = Integer.parseInt(splitNums[i]);
        }
        
        System.out.println(singleNumber(nums));
    }
}
