/*

https://leetcode.com/problems/integer-replacement/

recursion with memoization

*/

class Solution {
    func integerReplacement(_ n: Int) -> Int {
        var dp: [Int: Int] = [0: 0, 1: 0]
        return getNumberOfOperations(n, dp: &dp)
    }
    
    private func getNumberOfOperations(_ n: Int, dp: inout [Int: Int]) -> Int {
        if let movements = dp[n] { return movements }
        if n % 2 == 0 {
            dp[n] = getNumberOfOperations(n/2, dp: &dp) + 1
        } else {
            dp[n] = min(getNumberOfOperations(n-1, dp: &dp), getNumberOfOperations(n+1, dp: &dp)) + 1
        }
        return dp[n]!
    }
}