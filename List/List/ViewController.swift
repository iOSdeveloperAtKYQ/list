//
//  ViewController.swift
//  List
//
//  Created by Mac123 on 2020/4/27.
//  Copyright © 2020 SW. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建链表
        var head: ListNode?
        var currentHead: ListNode?
        let array = [1,2,3,4]
        for value in array {
            let newHead = ListNode.init()
            newHead.value = value
            if head == nil {
                head = newHead
                currentHead = newHead
            }else {
                currentHead?.next = newHead
                currentHead = currentHead?.next
            }
        }
        
        
        //创建链表
        var head2: ListNode?
        var currentHead2: ListNode?
        let array2 = [2,5]
        for value in array2 {
            let newHead = ListNode.init()
            newHead.value = value
            if head2 == nil {
                head2 = newHead
                currentHead2 = newHead
            }else {
                currentHead2?.next = newHead
                currentHead2 = currentHead2?.next
            }
        }
        
        //单链表插入节点
        var newList = ListNode.insertNode(head: head, idx: 100, value: 5)
        printList(head: &newList)
        
        //单链表根据序号删除节点
//        var newList = ListNode.deleteNode(head: head, idx: -1)
        //单链表根据值删除节点
//        var newList = ListNode.deleteNode(head: head, value: 1)
//        printList(head: &newList)
        
        
        //单链表中查找某结点
//        let idx = ListNode.lookupNode(head: head, value: 6)
//        print(idx)
        
        //单链表更新指定节点的数据
//        var newList = ListNode.updateList(head: head, idx: 0, value: 0)
//        printList(head: &newList)
        
        //递归合并两个有序的链表
//        var mergeList = ListNode.mergeList(head1: head, head2: head2)
//        printList(head: &mergeList)
        
        //单链表反转
//        var reverseList = ListNode.reverseList(head: head)
//        printList(head: &reverseList)
    }

    
    func printList(head: inout ListNode?) {
        if head != nil {
            var i = true
            while i == true {
                print(head!.value!)
                if head!.next == nil {
                    i = false
                }else {
                    head = head!.next
                }
            }
        }
    }
    

}

