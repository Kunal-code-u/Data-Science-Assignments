#1. Create an array A with elements (12, 13, 14, 15, 16) and display them.
A <- array(c(12, 13, 14, 15, 16), dim = c(5))
print(A)

#2. Find the sum of all the elements of A.
sum_of_all <- sum(A)
print(sum_of_all)

#3. Find the product of all the element of A.
prod_all_of <- prod(A)
print(prod_all_of)

#4. Find the maximum and minimum element of A.
max_element <- max(A)
print(max_element)

min_element <- min(A)
print(min_element)

#5. Find the range of array A.
range_of_A = range(A)
print(range_of_A)
range_diff <- diff(range_of_A)
print(range_diff)

#6. Find the mean, variance, standard deviation and median of value of A.
mean_of_A <- mean(A)
print(mean_of_A)

variance_of_A = var(A)
print(variance_of_A)

sd_of_A <- sd(A)
print(sd_of_A)

median_of_A = median(A)
print(median_of_A)

#7. Sort the element of A both in increasing and decreasing order and store them in B and C
B <- sort(A)
print(B)

C <- sort(A, decreasing = TRUE)
print(C)

#8. Create a matrix of 3x4 to have the set of natural numbers
numbers <- 1 : 12
matrix(numbers, nrow = 3, ncol = 4)

#9. Create MxN matrix by combining A, B and C row-wise (RW) and column-wise(CW).
RW_matrix <- rbind(A, B, C)
CW_matrix <- cbind(A, B, C)

#10. Find the 2 and 3 row element of RW.
row_2 <- RW_matrix[2, ]
print(row_2)
row_3 <- RW_matrix[3, ]
print(row_3)

#11. Find the 1 and 4 column of CW
CW_matrix[, 1]
CW_matrix[, 3]

#12. Using both RW and CW find sub-matrices having elements [2, 3] and [2, 4].
submatrix_RW <- RW_matrix[2 : 3, ]
print(submatrix_RW)

submatrix_CW <- CW_matrix[2 : 4, ]
print(submatrix_CW)
