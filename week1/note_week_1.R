ls()
rm(list=ls()) 

# 创建vector向量
vector_1 <- c(1, 2, 4, 3)
vector_2 <- c("Manchester", "London")
vector_3 <- seq(1:5)  # 生成从1到5
vector_3_b <- seq(5)
vector_3[c(2, 4)]  # 获取不止一个值
vector_3[2:4]  # 获取不止一个值
mode(vector_2)


# 创建matrix矩阵
matrix_1 <- matrix(seq(10), 2, 5)  # 1~10, 形状(2, 5)
matrix_1[2, 2]  # 获取[2, 2]位置的数值
matrix_1[, 4]  # 获取第四列的所有数值

matrix_1[2,]  # 普通提取出来的就不是矩阵了 是向量
is.vector(matrix_1[2,])  # 查看之后的数据形状是否是vector

matrix_1[2,, drop = FALSE]  # 特殊提取 是矩阵
is.vector(matrix_1[2,, drop = FALSE])  # FALSE
is.matrix(matrix_1[2,, drop = FALSE])  # TRUE


# 创建list列表
list_1 <- list("Bristol", 1, FALSE)
list_1[[1]]  # 获取列表第一个元素
second_list <- list(t_value = TRUE, num_value = 3, city = "Manchester")
second_list$t_value


# 创建 data frames
city_name <- c("London", "Bristol", "Manchester")
population <- c(0.5, 0.5, 9)
dataframe_1 <- data.frame(city_name=city_name, population=population)


2^3  # 指数计算


# 向量计算
vector_a <- c(1, 2, 4, 6)
vector_a + vector_a  
vector_a * vector_a


# 矩阵计算
matrix_a <- matrix(seq(10), 2, 5)
matrix_a + matrix_a
matrix_a * matrix_a
matrix_a %*% t(matrix_a)  # 线性代数

# (2, 3)的随机矩阵, 纯数长度6, 允许放回抽样
a <- matrix(sample(1:10, 6, replace = T), 2, 3)
b <- matrix(sample(1:10, 6, replace = T), 2, 3)

# 预习矩阵计算
a <- matrix(data=c(1,2,3,4), nrow=1, ncol=4)
b <- matrix(data=c(5,6,7,8), nrow=4, ncol=1)
a %*% b

product <- a[1]*b[1] + a[2]*b[2] + a[3]*b[3] + a[4]*b[4]
product

A <- rbind(a, a+1, a+2) # 合并rows
A  # A (3, 4); b(4, 1)

A %*% b

rbind(a%*%b, (a+1)%*%b, (a+2)%*%b)  # 分别进行操作
# A乘b 相当于将A的每一行与b相乘 然后组合
# 得到的矩阵的行数应该等于A中的行数

B <- cbind(b, b+10) 
A %*% B
# A (3, 4); B (4, 2)
cbind(A%*%b, A%*%(b+10))
# A乘B 等于A乘B的每一列 然后组合 
# 得到的矩阵的行数应该等于A中的行数


product <- matrix(0, 3, 2)  # 填充零 (3, 2)
for (i in 1:nrow(A)) {
    for (j in 1:ncol(B)) {
        product[i, j] <- A[i,] %*% B[,j]
    }
}
product


function_1 <- function(x) {
    x[1] <- 100
    return (x)
}
function_1(c(1, 2, 3))

x_not_to_be_change <- c(1,2,3)
function_1(x_not_to_be_change)
x_not_to_be_change  # 原地址上的元素 不变

# Example 1
z <- 2  # 原地址上的元素 不变
func3 <- function(x = z) {
    z <- 5
    x
}
func3()  # 返回5 用的是函数里面的z<-5

# Example 2
z <- 2
func4 <- function(x = z) {
    x
}
func4()  # 返回2

# Example 3
func5 <- function(x){
    x
}
func5()  # 报错 无参数

# Example 4
if (TRUE || I_am_not_defined) {
    print('TRUE')
}
I_am_not_defined <- TRUE
if (TRUE && I_am_not_defined) {
    print('TRUE')
}


is_prime <- function(num) {
    # 用于在某些条件不满足时抛出错误
    # is.numeric(num) 检查输入是否是一个数字类型
    # num%%1==0 检查输入除以1的余数是不是等于0, 如果等于0说明输入的是整数
    # num >= 0 检查输入是不是非负数
    stopifnot(is.numeric(num), num%%1==0, num >= 0)
    t_val <- TRUE
    if (num < 2) {
        t_val <- FALSE
    } else if (num > 2) {
        for (i in 2:sqrt(num)) {
            if (num%%i == 0) {
                t_val <- FALSE
                break
            }
        }
    }
    return (t_val)
}

is_prime(39)


subtraction_function <- function(num_to_sub) {
    output_function <- function(x) {
        return(x - num_to_sub)
        }
    return(output_function)
}


a <- 1
f1 <- subtraction_function(a)
print(f1(2))

a <- 2
print(f1(2))  # 还是1 没有变, R语言独有的惰性

# 但是
b <- 1  # 初始 b
f2 <- subtraction_function(b)  # 创建一个函数 f2 使用当前的 b
b <- 2  # 改变 b 的值
print(f2(2))  # 调用 f2(2) 并输出结果  是0! 因为运行f2(2)的时候 系统才去找变量 b

library(usethis)
use_git_config(user.name = "Zihao Chen", user.email = "https://github.com/ZihaoChen123")













