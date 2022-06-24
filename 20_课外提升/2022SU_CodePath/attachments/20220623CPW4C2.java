/**
 * Given a node, return the length of the linked list
 *
 * Input: 1 ; Return: 1
 * Input 1->2->3 ; Return 3
 */

public class Main {
    public static void main(String[] args) {
        ListNode n0 = new ListNode(0);
        System.out.println(getLength(n0));
        ListNode n1 = new ListNode(1);
        ListNode n2 = new ListNode(2);
        n1.next = n2;
        System.out.println(getLength(n1));
    }

    public static int getLength(ListNode node) {
        int length = 0; // keep track
        while (node != null) {
            length++;
            System.out.println(length);// added to see the current length
            if (node.next != nullptr) {
                node = node.next;
            } else {
                return length;
            }
        }
        return length;
    }

    public static class ListNode {
        int data;
        ListNode next;

        ListNode(int data) {
            this.data = data;
        }
    }
}