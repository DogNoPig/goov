package com.goov.test.LeetCode;

class Node {
    public int val;
    public Node next;
    public Node random;

    public Node() {}

    public Node(int _val,Node _next,Node _random) {
        val = _val;
        next = _next;
        random = _random;
    }
}

/**
 * 复制带随机指针的链表
 * @
 */
public class C138 {
    public Node copyRandomList(Node head) {
        if(head == null){
            return null;
        }
        Node l = head;
        while(l != null){  //每个原链表节点复制一个在后面
            Node node = new Node(l.val,null,null);
            node.next = l.next;
            l.next = node;
            l = node.next;
        }
        l = head;
        while(l != null && l.next != null){   //设置新链表的random节点,注意特殊情况：1.random为null,跳过该节点 2.next为null,跳出循环
            if(l.random != null)
                l.next.random = l.random.next;
            l = l.next.next;
        }
        l = head;
        Node newHead = l.next;
        while(l != null){   //注意要把原链表和新的链表拆开，不要只拆新的链表
            Node next = l.next;
            if(next != null)
                l.next = next.next;
            l = next;
        }
        return newHead;
    }
}
