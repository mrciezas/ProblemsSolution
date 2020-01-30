/*

https://leetcode.com/problems/divisor-game/

DP

*/

class Solution {
    
    func divisorGame(_ n: Int) -> Bool {
        if n == 1 { return false }
        var dp = Array(repeating: false, count: n+1)
        for i in 2...n {
            for j in 1..<i {
                if(i % j == 0){
                    if(dp[i-j] == false){
                        dp[i] = true
                        break
                    }
                }
            }
        }
        return dp[n]
    }
    
}