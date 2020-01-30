/*

https://leetcode.com/problems/count-square-submatrices-with-all-ones/

Recursion with memoization

*/

class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var counter = 0
        var dp: [[Int]] = Array(repeating: Array(repeating: -1, count: matrix[0].count), count: matrix.count)
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count where matrix[i][j] != 0 {
                counter += countNeighborOnes(i, j, matrix, &dp) + 1
            }
        }
        return counter
    }
    
    func countNeighborOnes( _ i: Int, _ j: Int, _ matrix: [[Int]], _ cache: inout [[Int]]) -> Int {
        if cache[i][j] != -1 { return cache[i][j] }
        var right = 0
        var diagonal = 0
        var bottom = 0
        if matrix[i][j] == 1 {
            if i+1 < matrix.count && matrix[i+1][j] == 1 {
                bottom += countNeighborOnes(i+1, j, matrix, &cache) + 1
            }
            if j+1 < matrix[0].count && matrix[i][j+1] == 1 {
                right += countNeighborOnes(i, j+1, matrix, &cache) + 1
            }
            if i+1 < matrix.count && j+1 < matrix[0].count && matrix[i+1][j+1] == 1 {
                diagonal += countNeighborOnes(i+1, j+1, matrix, &cache) + 1
            }
        }
        cache[i][j] = min(bottom, right, diagonal)
        return cache[i][j]
    }
}