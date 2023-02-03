class Solution:
    def shortestSubarray(self, A: List[int],k:int)->int:
        n =len(A)
        pre_sums=[0]
        for i in range(n):
            pre_sums.append(A[i]+pre_sums[-1])
        inc_q=collections.deque()
        answer=sys.maxsize

        for right,s in enumerate(pre_sums):
            while inc_q and s-pre_sums[inc_q[0]]>=k:
                answer=min(answer,right-inc_q.popleft())
            while inc_q and s<=pre_sums[inc_q[-1]]:
                inc_q.pop()
            inc_q.append(right)
       
    
        return answer if answer < sys.maxsize else -1
