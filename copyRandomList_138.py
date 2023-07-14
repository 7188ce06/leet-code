# Solution for leetcode.com problem #138
# https://leetcode.com/problems/copy-list-with-random-pointer/

class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random

class Solution:
    def copyRandomList(self, head: 'Optional[Node]') -> 'Optional[Node]':
        newhead = self.copyList(head)

        # Set the random value for each node in the new list.
        oldcurr = head
        newcurr = newhead
        while newcurr != None:
            o = head
            n = newhead
            while o != oldcurr.random:
                o = o.next
                n = n.next
            newcurr.random = n
            oldcurr = oldcurr.next
            newcurr = newcurr.next
        return newhead
            

    def copyList(self, head):
        if head == None:
            return None
        return Node(head.val, self.copyList(head.next))

    def eqValLists(self, list1, list2):
        return self.eqValListsImpl(list1, list1, list2, list2)

    def eqValListsImpl(self, list1head, list1, list2head, list2):
        if list1 == None and list2 == None:
            return True
        elif list1 == None:
            return False
        elif list2 == None:
            return False
        else:
            if list1.val != list2.val:
                return False
            elif list1.random is not None and list2.random is None:
                return False
            elif list1.random is None and list2.random is not None:
                return False
            else:
                if list1.random is not None and list2.random is not None:
                    curr1 = list1head
                    curr2 = list2head
                    found = False
                    while curr1 != None and curr2 != None:
                        if curr1 == list1.random and curr2 == list2.random:
                            found = True
                        curr1 = curr1.next
                        curr2 = curr2.next
                    if found == False:
                        return False
                return self.eqValListsImpl(list1head, list1.next, list2head, list2.next)


s = Solution()
assert s.eqValLists(None, None) == True

l1 = Node(1)
l2 = Node(1)
l3 = Node(1, Node(2))
l4 = Node(1, Node(3))
assert s.eqValLists(None, l1) == False
assert s.eqValLists(l1, None) == False
assert s.eqValLists(l1, l1) == True

assert s.eqValLists(l1, l2) == True
assert s.eqValLists(l2, l1) == True

assert s.eqValLists(l3, l3) == True
assert s.eqValLists(l1, l3) == False
assert s.eqValLists(l3, l1) == False

assert s.eqValLists(l3, l4) == False
assert s.eqValLists(l4, l3) == False

assert s.eqValLists(None, s.copyList(None)) == True
assert s.eqValLists(s.copyList(None), None) == True
assert s.eqValLists(l1, s.copyList(l1)) == True
assert s.eqValLists(s.copyList(l1), l1) == True
assert s.eqValLists(l3, s.copyList(l3)) == True
assert s.eqValLists(s.copyList(l3), l3) == True

a0 = Node(7)
a1 = Node(13)
a2 = Node(11)
a3 = Node(10)
a4 = Node(1)

a0.random = None
a0.next = a1
a1.random = a0
a1.next = a2
a2.random = a4
a2.next = a3
a3.random = a2
a3.next = a4
a4.random = a0
a4.next = None

assert s.eqValLists(a0, s.copyRandomList(a0)) == True

a0 = Node(1)
a1 = Node(2)

a0.random = a1
a0.next = a1
a1.random = a1
a1.next = None

assert s.eqValLists(a0, s.copyRandomList(a0)) == True

a0 = Node(3)
a1 = Node(3)
a2 = Node(3)

a0.random = None
a0.next = a1
a1.random = a0
a1.next = None
a2.random = None
a2.next = None

assert s.eqValLists(a0, s.copyRandomList(a0)) == True
