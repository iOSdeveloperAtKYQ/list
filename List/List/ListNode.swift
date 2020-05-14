//
//  ListNode.swift
//  ListNode
//
//  Created by Mac123 on 2020/5/13.
//  Copyright © 2020 SW. All rights reserved.
//

import UIKit

class ListNode: NSObject {
    var value: Int?
    var next: ListNode?
    
    //MARK: - 单链表插入节点
    /// - Parameter head: 单链表
    /// - Parameter idx: 插入的位置
    /// - Parameter value: 插入的值
    class func insertNode(head: ListNode?, idx: Int, value: Int) -> ListNode? {
        if head == nil || idx < 1 {
            return head
        }else {
            //下一个节点
            var newList = head
            //上一个节点
            var prevNode = head
            for _ in 1 ... idx {
                prevNode = newList
                newList = newList?.next
                if prevNode == nil {
                    //超出了链表长度，返回原链表
                    return head
                }
            }
            //创建新节点
            let newNode = ListNode.init()
            newNode.value = value
            
            //用新的节点保存后面的节点，以防丢失
            newNode.next = newList
            //指向新的节点
            prevNode?.next = newNode
            
            return head
        }
    }
    
    //MARK: - 单链表根据值删除节点
    /// - Parameter head: 单链表
    /// - Parameter value: 值
    class func deleteNode(head: ListNode?, value: Int) -> ListNode? {
        if head == nil {
            return head
        }else {
            var b = true
            
            var delList = head
            //上一个节点
            var prevNode = head
            
            while b {
                if delList?.value == value {
                    b = false
                    if prevNode == head {
                        //删除的是第一个节点
                        return head?.next
                    }else {
                        //把上一个节点指向删除节点的下一个节点
                        prevNode?.next = delList?.next
                    }
                }else {
                    prevNode = delList
                    delList = delList?.next
                    if delList == nil {
                        b = false
                    }
                }
            }
            return head
        }
    }
    
    //MARK: - 单链表根据序号删除节点
    /// - Parameter head: 单链表
    /// - Parameter idx: 序号
    class func deleteNode(head: ListNode?, idx: Int) -> ListNode? {
        if head == nil || idx < 1{
            return head
        }else {
            if idx == 1 {
                return head?.next
            }else {
                var newHead = head
                for _ in 1 ..< idx - 1 {
                    //获取删除节点的前一个节点
                    newHead = newHead?.next
                }
                //保存删除节点后面的节点，以防丢失
                let laterNode = newHead?.next?.next
                //把删除节点的前一个节点指向后面的节点
                newHead?.next = laterNode
                return head
            }
        }
    }
    
    //MARK: - 单链表中查找某结点
    /// - Parameter head: 单链表
    /// - Parameter value: 节点的值
    class func lookupNode(head: ListNode?, value: Int) -> Int {
        var b = true
        var idx = 1
        var newList = head
        while b {
            if newList?.value == value {
                return idx
            }
            newList = newList?.next
            idx += 1
            if newList == nil {
                b = false
            }
        }
        return -1
    }
    
    //MARK: - 单链表更新指定节点的数据
    /// - Parameter head: 需要更新的单链表
    /// - Parameter idx: 节点的位置
    /// - Parameter value: 更新的值
    class func updateList(head: ListNode?, idx: Int, value: Int) -> ListNode? {
        if head == nil || idx < 1 {
            return head
        }else {
            var newList = head
            for _ in 1 ..< idx {
                newList = newList?.next
            }
            newList?.value = value
            return head
        }
    }
    
    
    //MARK: - 单链表反转
    /// - Parameter head: 需要反转的链表
    class func reverseList(head: ListNode?) -> ListNode? {
        if head == nil {
            return head
        }else {
            var i: ListNode?
            var j: ListNode?
            var k: ListNode?
            
            i = head
            j = head?.next
            head?.next = nil
            while j != nil {
                k = j?.next
                j?.next = i
                i = j
                j = k
            }
            return i
        }
    }
    
    
    //MARK: - 递归合并两个有序的链表
    /// - Parameter head1: 列表1，需要从小到大顺序排列
    /// - Parameter head2: 列表2，需要从小到大顺序排列
    class func mergeList(head1: ListNode?, head2: ListNode?) -> ListNode? {
        if head1 == nil {
            return head2
        }else if head2 == nil {
            return head1
        }
        
        var mergeList = ListNode.init()
        if head1!.value! < head2!.value! {
            mergeList = head1!
            mergeList.next = self.mergeList(head1: head1?.next, head2: head2)
        }else {
            mergeList = head2!
            mergeList.next = self.mergeList(head1: head1, head2: head2?.next)
        }
        
        return mergeList
    }
    
}
