# Julia

`doc`:  https://docs.juliacn.com/latest/ & https://juliacn.gitlab.io/JuliaZH.jl/index.html

`video`:  https://www.bilibili.com/video/BV1yt411c7Gm?p=1

## 变量

与其他动态语言相似，`Julia`也可以无需声明变量类型直接赋值

`\`+`符号名称`+`tab`以输入Unicode数学符号

命名规范

> 变量名称尽可能小写
>
> 类型和模块名首字母大写，单词之间使用驼峰式分隔
>
> 不鼓励使用下划线`_`
>
> 函数名与宏名使用小写字母，不适用下划线
>
> 修改参数的函数结尾使用`!`，此类函数被称为`mutating functions`或`in-place function`



复数开方

```julia
sqrt(-1 + 0im)
```

分数

```julia
1//2
```



使用`‘ ’`表示字符

`Int()`可以输出字符的ASCII值

使用`" "`表示字符串

使用`[]`表示字符串索引 注意索引从`1`开始而非`0`

Julia完整支持`Unicode`字符与字符串 使用`\u`与`\U`进行转义

非`ASCII`字符使用`UTF-8`编码

字符串拼接

```julia
string("Hello",',',"World")

"Hello" * ',' * "World"
```

插值操作符

```julia
x = "Hello"

y = "World"

string("$x , $y")
```

跨越多行的字符串使用`""" """`表示



正则表达式`r`+`""`

```julia
occursin(r"","")
```

```julia
julia> match(r"[0-9]","aaa1bbb2")
RegexMatch("1")

julia> match(r"[0-9]","aaa1bbb2",4)
RegexMatch("1")
```



Tuple

`()`表示元组 且不可更改 索引由`[]`表示 从1开始而非0

`length()`可查询元组中变量数量

可以不同类型混合定义

亦可定义为类似字典的形式

```julia
julia> ex = (a = 1, b = 2)
(a = 1, b = 2)

julia> ex.a
1

julia> typeof(ex)
NamedTuple{(:a, :b),Tuple{Int64,Int64}}
```



字典

```julia
julia> dic = Dict('a' => 1, 'b' => 2)
Dict{Char,Int64} with 2 entries:
  'a' => 1
  'b' => 2

julia> typeof(dic)
Dict{Char,Int64}

julia> dic['a']
1
```

```julia
julia> dic.count
2

julia> dic.keys
16-element Array{Char,1}:
 '\xa6\x80\x9a\xd0': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\x00\x00\x7f\x84': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\xa6\x80\xa5\x50': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\x00\x00\x7f\x84': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\xa6\x80\x9b\x10': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\x00\x00\x7f\x84': Malformed UTF-8 (category Ma: Malformed, bad data)
 '\xa6\x7e\xb9\xb0': Malformed UTF-8 (category Ma: Malformed, bad data)
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
 '\0': ASCII/Unicode U+0000 (category Cc: Other, control)

julia> dic.vals
16-element Array{Int64,1}:
 1
 0
 0
 0
 3
 1
 0
 1
 1
 0
 0
 0
 0
 0
 2
 1
```



可以将数组类直接转换为字典类

```julia
julia> ary = ['a' => 1, 'b' => 2]
2-element Array{Pair{Char,Int64},1}:
 'a' => 1
 'b' => 2

julia> Dict(ary)
Dict{Char,Int64} with 2 entries:
  'a' => 1
  'b' => 2
```

可也将数组中的元组转换为字典

```julia
julia> arytpl = [('a',1), ('b',2)]
2-element Array{Tuple{Char,Int64},1}:
 ('a', 1)
 ('b', 2)

julia> Dict(arytpl)
Dict{Char,Int64} with 2 entries:
  'a' => 1
  'b' => 2
```



双数组组合为字典

```julia
julia> keys = ['a', 'b']
2-element Array{Char,1}:
 'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
 'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)

julia> vals = [1, 2]
2-element Array{Int64,1}:
 1
 2

julia> Dict(zip(keys,vals))
Dict{Char,Int64} with 2 entries:
  'a' => 1
  'b' => 2
```



创建空字典并添加新元素

```julia
julia> emptydic = Dict()
Dict{Any,Any}()

julia> emptydic['a'] = 1
1
```

创建空字典时也可先行指定其类型

```julia
emptydic = Dict{Char,Int64}()
```



遍历字典

```julia
julia> for (k,v) in dic
           println(k)
           println(v)
       end
a
1
b
2
```



字典其他用法

```julia
julia> get(dic, 'b', false)
2

julia> get(dic, 'c', false)
false
```

`get`在字典中查找第二参数，若无则返回第三参数

`delete!`方法删除元素

```julia
julia> delete!(dic, 'b')
Dict{Char,Int64} with 1 entry:
  'a' => 1
```



```julia
julia> fieldnames(Dict)
(:slots, :keys, :vals, :ndel, :count, :age, :idxfloor, :maxprobe)
```



Set

为无序且不重复的元素集合

不是`Set`也可进行交/并操作 区别只在返回结果类型



## 数学运算



## 矩阵运算

使用`[]`定义矩阵

```julia
julia> a = (1, 2, 3)
(1, 2, 3)

julia> b = [1, 2, 3]
3-element Array{Int64,1}:
 1
 2
 3

julia> typeof(a)
Tuple{Int64,Int64,Int64}

julia> typeof(b)
Array{Int64,1}
```

可在定义之初指定其类型



步进向量

```julia
julia> ex = (1:3:10)
1:3:10

julia> ex.start
1

julia> ex.step
3

julia> ex.stop
10

julia> typeof(ex)
StepRange{Int64,Int64}
```



可将`Tuple`转换为`Array`

```julia
julia> a = (1, 2, 3)
(1, 2, 3)

julia> b = collect(a)
3-element Array{Int64,1}:
 1
 2
 3
```



单使用`[]`有时效果不好

`[1:3]`只包含一个元素 且为`UnitRange{Int64}`类型 因此需要`collect`方法转换



使用`[:]`表示拷贝

`ex1`为`ex`的别名 `ex2`为`ex`的拷贝

```julia
julia> ex = collect(1:3)
3-element Array{Int64,1}:
 1
 2
 3

julia> ex1 = ex
3-element Array{Int64,1}:
 1
 2
 3

julia> ex2 = ex[:]
3-element Array{Int64,1}:
 1
 2
 3

julia> ex[1] = 0
0

julia> ex1
3-element Array{Int64,1}:
 0
 2
 3

julia> ex2
3-element Array{Int64,1}:
 1
 2
 3
```



分号`;`与空格` `定义矩阵存在区别

`a`为向量 维度为1 `b`为矩阵 维度为2

```julia
julia> a = [1;2;3;4]
4-element Array{Int64,1}:
 1
 2
 3
 4

julia> b = [1 2 3 4]
1×4 Array{Int64,2}:
 1  2  3  4
```



使用逗号`,`分号`;`空格` `拼接矩阵

`,`变为数组

` `横向拼接

`;`纵向拼接

```julia
julia> x = zeros(2,3)
2×3 Array{Float64,2}:
 0.0  0.0  0.0
 0.0  0.0  0.0

julia> y = ones(2,3)
2×3 Array{Float64,2}:
 1.0  1.0  1.0
 1.0  1.0  1.0

julia> [x,y]
2-element Array{Array{Float64,2},1}:
 [0.0 0.0 0.0; 0.0 0.0 0.0]
 [1.0 1.0 1.0; 1.0 1.0 1.0]

julia> [x y]
2×6 Array{Float64,2}:
 0.0  0.0  0.0  1.0  1.0  1.0
 0.0  0.0  0.0  1.0  1.0  1.0

julia> [x;y]
4×3 Array{Float64,2}:
 0.0  0.0  0.0
 0.0  0.0  0.0
 1.0  1.0  1.0
 1.0  1.0  1.0

```

也可将`[x,y]`转换为没有嵌套的矩阵

```julia
julia> hcat([x,y]...)
2×6 Array{Float64,2}:
 0.0  0.0  0.0  1.0  1.0  1.0
 0.0  0.0  0.0  1.0  1.0  1.0

julia> vcat([x,y]...)
4×3 Array{Float64,2}:
 0.0  0.0  0.0
 0.0  0.0  0.0
 1.0  1.0  1.0
 1.0  1.0  1.0
```



对矩阵进行运算操作或函数运算时 要加`.`

```julia
julia> x * y
ERROR: DimensionMismatch("A has dimensions (2,3) but B has dimensions (2,3)")
Stacktrace:
 [1] gemm_wrapper!(::Array{Float64,2}, ::Char, ::Char, ::Array{Float64,2}, ::Array{Float64,2}, ::LinearAlgebra.MulAddMul{true,true,Bool,Bool}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.5/LinearAlgebra/src/matmul.jl:569
 [2] mul! at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.5/LinearAlgebra/src/matmul.jl:169 [inlined]
 [3] mul! at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.5/LinearAlgebra/src/matmul.jl:208 [inlined]
 [4] *(::Array{Float64,2}, ::Array{Float64,2}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.5/LinearAlgebra/src/matmul.jl:160
 [5] top-level scope at REPL[47]:1

julia> x .* y
2×3 Array{Float64,2}:
 0.0  0.0  0.0
 0.0  0.0  0.0

julia> a = [1,2,3]
3-element Array{Int64,1}:
 1
 2
 3

julia> sin.(a)
3-element Array{Float64,1}:
 0.8414709848078965
 0.9092974268256817
 0.1411200080598672
```



## 函数

不需`return`

`return`一般用于函数中间返回

由于`Julia`代码都为表达式 返回值只能是结果或`nothing` 因此函数的最后一行默认为返回值

若函数不需返回值 只需在最后一行加入`nothing`即可



可指定函数返回值类型 `function f()::Int64`



符号亦可作为函数使用

```julia
julia> +(1,2,3)
6
```

符号作为特殊的函数 函数可以使用的地方 符号亦可使用



可在函数定义前为其添加说明

查看说明

```julia
@doc function
```

`REPL`中定义的函数可进入`help`模式查询其说明



匿名函数

无函数名 仅存在其操作



多返回值函数

在函数末 返回值用`,`隔开即可

返回类型为`Tuple`



可变参数

> It is often convenient to be able to write functions taking an arbitrary number of arguments. Such functions are traditionally known as "varargs" functions, which is short for "variable number of arguments". You can define a varargs function by following the last positional argument with an ellipsis:

```julia
julia> function f(x...)
           l = length(x)
       end
f (generic function with 1 method)

julia> f(1,2,3)
3
```



默认参数

默认参数只能放在参数列表最后



关键字参数

`使用命名（关键字）而非位置来指定函数中的参数`

> [某些函数需要大量参数，或者具有大量行为。记住如何调用这样的函数可能很困难。关键字参数允许通过名称而不是仅通过位置来识别参数，使得这些复杂接口易于使用和扩展。](https://juliacn.gitlab.io/JuliaZH.jl/manual/functions.html)
>
> 例如，考虑绘制一条线的函数 `plot`。这个函数可能有很多选项，用来控制线条的样式、宽度、颜色等。如果它接受关键字参数，一个可行的调用可能看起来像 `plot(x, y, width=2)`，这里我们仅指定线的宽度。请注意，这样做有两个目的。调用更可读，因为我们能以其意义标记参数。也使得大量参数的任意子集都能以任意次序传递。
>
> 具有关键字参数的函数在签名中使用分号定义：
>
> ```julia
> function plot(x, y; style="solid", width=1, color="black")
>     ###
> end
> ```
>
> 在函数调用时，分号是可选的：可以调用 `plot(x, y, width=2)` 或 `plot(x, y; width=2)`，但前者的风格更为常见。显式的分号只有在传递可变参数或下文中描述的需计算的关键字时是必要的。
>
> 如果一个关键字参数在方法定义中未指定默认值，那么它就是*必需的*：如果调用者没有为其赋值，那么将会抛出一个 [`UndefKeywordError`](https://juliacn.gitlab.io/JuliaZH.jl/base/base.html#Core.UndefKeywordError) 异常。

`;`前的参数不能使用关键字



`julia`函数定义时可指定其参数类型

调用时也须指定其参数类型



map

```julia
julia> function funcAbs(x)
           x >= 0 ? x : -x
       end
funcAbs (generic function with 1 method)

julia> map(funcAbs,-3:3)
7-element Array{Int64,1}:
 3
 2
 1
 0
 1
 2
 3
```



reduce

```julia
julia> reduce(+,1:10)
55
```



`|>`操作符

```julia
julia> "abc" |> uppercase
"ABC"
```



单行函数定义 可以省略`function`关键字

```julia
julia> add(x::Int64,y::Int64) = x + y
add (generic function with 1 method)

julia> add(1,2)
3
```



方法

> 函数与方法的区别
>
> 类外的`function`都是函数 不是方法 方法与类有关
>
> 有执行对象的函数为方法

同一函数 实现方法不同 `julia`会选择更加专用的方法

```julia
julia> +
+ (generic function with 184 methods)

julia> methods(+)
# 184 methods for generic function "+":
[1] +(z::Complex{Bool}, x::Bool) in Base at complex.jl:287
[2] +(z::Complex{Bool}, x::Real) in Base at complex.jl:301
[3] +(a::Float16, b::Float16) in Base at float.jl:398
[4] +(a::BigFloat, b::BigFloat, c::BigFloat, d::BigFloat, e::BigFloat) in Base.MPFR at mpfr.jl:548
[5] +(a::BigFloat, b::BigFloat, c::BigFloat, d::BigFloat) in Base.MPFR at mpfr.jl:541
[6] +(a::BigFloat, b::BigFloat, c::BigFloat) in Base.MPFR at mpfr.jl:535
[7] +(x::BigFloat, c::BigInt) in Base.MPFR at mpfr.jl:394
[8] +(x::BigFloat, y::BigFloat) in Base.MPFR at mpfr.jl:363
[9] +(x::BigFloat, c::Union{UInt16, UInt32, UInt64, UInt8}) in Base.MPFR at mpfr.jl:370
[10] +(x::BigFloat, c::Union{Int16, Int32, Int64, Int8}) in Base.MPFR at mpfr.jl:378
[11] +(x::BigFloat, c::Union{Float16, Float32, Float64}) in Base.MPFR at mpfr.jl:386
[12] +(x::Dates.CompoundPeriod, y::Dates.CompoundPeriod) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:347
[13] +(x::Dates.CompoundPeriod, y::Dates.Period) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:345
[14] +(x::Dates.CompoundPeriod, y::Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:375
[15] +(x::Dates.Date, y::Dates.Day) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:74
[16] +(x::Dates.Date, y::Dates.Week) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:72
[17] +(dt::Dates.Date, z::Dates.Month) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:54
[18] +(dt::Dates.Date, y::Dates.Year) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:27
[19] +(dt::Dates.Date, t::Dates.Time) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:19
[20] +(x::Float32, y::Float32) in Base at float.jl:400
[21] +(a::Pkg.Resolve.VersionWeight, b::Pkg.Resolve.VersionWeight) in Pkg.Resolve at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Pkg/src/Resolve/versionweights.jl:22
[22] +(x::Bool, z::Complex{Bool}) in Base at complex.jl:286
[23] +(x::Bool, y::Bool) in Base at bool.jl:96
[24] +(x::Bool) in Base at bool.jl:93
[25] +(x::Bool, y::T) where T<:AbstractFloat in Base at bool.jl:103
[26] +(x::Bool, z::Complex) in Base at complex.jl:293
[27] +(::Missing, ::Missing) in Base at missing.jl:114
[28] +(::Missing) in Base at missing.jl:100
[29] +(::Missing, ::Number) in Base at missing.jl:115
[30] +(t::Dates.Time, dt::Dates.Date) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:20
[31] +(x::Dates.Time, y::Dates.TimePeriod) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:78
[32] +(c::BigInt, x::BigFloat) in Base.MPFR at mpfr.jl:399
[33] +(a::BigInt, b::BigInt, c::BigInt, d::BigInt, e::BigInt) in Base.GMP at gmp.jl:518
[34] +(a::BigInt, b::BigInt, c::BigInt, d::BigInt) in Base.GMP at gmp.jl:517
[35] +(a::BigInt, b::BigInt, c::BigInt) in Base.GMP at gmp.jl:516
[36] +(x::BigInt, y::BigInt) in Base.GMP at gmp.jl:476
[37] +(x::BigInt, c::Union{UInt16, UInt32, UInt64, UInt8}) in Base.GMP at gmp.jl:524
[38] +(x::BigInt, c::Union{Int16, Int32, Int64, Int8}) in Base.GMP at gmp.jl:530
[39] +(B::BitArray{2}, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:117
[40] +(a::Pkg.Resolve.FieldValue, b::Pkg.Resolve.FieldValue) in Pkg.Resolve at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Pkg/src/Resolve/fieldvalues.jl:43
[41] +(dt::Dates.DateTime, z::Dates.Month) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:47
[42] +(dt::Dates.DateTime, y::Dates.Year) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:23
[43] +(x::Dates.DateTime, y::Dates.Period) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:76
[44] +(level::Base.CoreLogging.LogLevel, inc::Integer) in Base.CoreLogging at logging.jl:116
[45] +(x::Float64, y::Float64) in Base at float.jl:401
[46] +(y::AbstractFloat, x::Bool) in Base at bool.jl:106
[47] +(x::T, y::T) where T<:Union{Int128, Int16, Int32, Int64, Int8, UInt128, UInt16, UInt32, UInt64, UInt8} in Base at int.jl:86
[48] +(c::Union{UInt16, UInt32, UInt64, UInt8}, x::BigInt) in Base.GMP at gmp.jl:525
[49] +(c::Union{Int16, Int32, Int64, Int8}, x::BigInt) in Base.GMP at gmp.jl:531
[50] +(a::Integer, b::Integer) in Base at int.jl:918
[51] +(x::Integer, y::Ptr) in Base at pointer.jl:161
[52] +(z::Complex) in Base at complex.jl:273
[53] +(z::Complex, w::Complex) in Base at complex.jl:275
[54] +(z::Complex, x::Bool) in Base at complex.jl:294
[55] +(x::Rational) in Base at rational.jl:266
[56] +(x::Real, z::Complex{Bool}) in Base at complex.jl:300
[57] +(x::Real, z::Complex) in Base at complex.jl:312
[58] +(z::Complex, x::Real) in Base at complex.jl:313
[59] +(x::Rational, y::Rational) in Base at rational.jl:282
[60] +(x::Rational, y::Integer) in Base at rational.jl:287
[61] +(y::Integer, x::Rational) in Base at rational.jl:294
[62] +(x::Integer, y::AbstractChar) in Base at char.jl:224
[63] +(c::Union{UInt16, UInt32, UInt64, UInt8}, x::BigFloat) in Base.MPFR at mpfr.jl:375
[64] +(c::Union{Int16, Int32, Int64, Int8}, x::BigFloat) in Base.MPFR at mpfr.jl:383
[65] +(c::Union{Float16, Float32, Float64}, x::BigFloat) in Base.MPFR at mpfr.jl:391
[66] +(x::AbstractIrrational, y::AbstractIrrational) in Base at irrationals.jl:156
[67] +(x::Number) in Base at operators.jl:513
[68] +(x::T, y::T) where T<:Number in Base at promotion.jl:384
[69] +(x::Number, y::Number) in Base at promotion.jl:311
[70] +(r1::OrdinalRange, r2::OrdinalRange) in Base at range.jl:1055
[71] +(r1::LinRange{T}, r2::LinRange{T}) where T in Base at range.jl:1062
[72] +(r1::StepRangeLen{T,R,S} where S, r2::StepRangeLen{T,R,S} where S) where {R<:Base.TwicePrecision, T} in Base at twiceprecision.jl:577
[73] +(r1::StepRangeLen{T,S,S1} where S1, r2::StepRangeLen{T,S,S1} where S1) where {T, S} in Base at range.jl:1078
[74] +(r1::Union{LinRange, OrdinalRange, StepRangeLen}, r2::Union{LinRange, OrdinalRange, StepRangeLen}) in Base at range.jl:1071
[75] +(x::Ptr, y::Integer) in Base at pointer.jl:159
[76] +(x::Base.TwicePrecision, y::Number) in Base at twiceprecision.jl:267
[77] +(x::Number, y::Base.TwicePrecision) in Base at twiceprecision.jl:271
[78] +(x::Base.TwicePrecision{T}, y::Base.TwicePrecision{T}) where T in Base at twiceprecision.jl:273
[79] +(x::Base.TwicePrecision, y::Base.TwicePrecision) in Base at twiceprecision.jl:278
[80] +(A::Array, Bs::Array...) in Base at arraymath.jl:43
[81] +(A::BitArray, B::BitArray) in Base at bitarray.jl:1110
[82] +(r::AbstractRange{var"#s826"} where var"#s826"<:Dates.TimeType, x::Dates.Period) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/ranges.jl:59
[83] +(A::Array, B::SparseArrays.AbstractSparseMatrixCSC) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/sparsematrix.jl:1683
[84] +(x::StridedArray{var"#s826", N} where N where var"#s826"<:Union{Dates.CompoundPeriod, Dates.Period}) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:55
[85] +(x::StridedArray{var"#s826", N} where N where var"#s826"<:Union{Dates.CompoundPeriod, Dates.Period}, y::Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:10
[86] +(X::StridedArray{var"#s826", N} where N where var"#s826"<:Union{Dates.CompoundPeriod, Dates.Period}, Y::StridedArray{var"#s825", N} where N where var"#s825"<:Union{Dates.CompoundPeriod, Dates.Period}) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:62
[87] +(A::LinearAlgebra.SymTridiagonal, B::LinearAlgebra.SymTridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/tridiag.jl:205
[88] +(A::LinearAlgebra.Tridiagonal, B::LinearAlgebra.Tridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/tridiag.jl:732
[89] +(A::LinearAlgebra.UpperTriangular, B::LinearAlgebra.UpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:659
[90] +(A::LinearAlgebra.LowerTriangular, B::LinearAlgebra.LowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:660
[91] +(A::LinearAlgebra.UpperTriangular, B::LinearAlgebra.UnitUpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:661
[92] +(A::LinearAlgebra.LowerTriangular, B::LinearAlgebra.UnitLowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:662
[93] +(A::LinearAlgebra.UnitUpperTriangular, B::LinearAlgebra.UpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:663
[94] +(A::LinearAlgebra.UnitLowerTriangular, B::LinearAlgebra.LowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:664
[95] +(A::LinearAlgebra.UnitUpperTriangular, B::LinearAlgebra.UnitUpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:665
[96] +(A::LinearAlgebra.UnitLowerTriangular, B::LinearAlgebra.UnitLowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:666
[97] +(A::LinearAlgebra.AbstractTriangular, B::LinearAlgebra.AbstractTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/triangular.jl:667
[98] +(A::LinearAlgebra.Hermitian, B::LinearAlgebra.Hermitian) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/symmetric.jl:466
[99] +(A::LinearAlgebra.Symmetric, B::LinearAlgebra.Symmetric) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/symmetric.jl:466
[100] +(A::LinearAlgebra.Hermitian{var"#s814",var"#s813"} where var"#s813"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s814", B::LinearAlgebra.Symmetric{var"#s812",var"#s811"} where var"#s811"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s812"<:Real) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:24
[101] +(A::LinearAlgebra.Hermitian, B::LinearAlgebra.Symmetric{var"#s826",S} where S<:(AbstractArray{var"#s8261",2} where var"#s8261"<:var"#s826") where var"#s826"<:Real) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/symmetric.jl:480
[102] +(A::LinearAlgebra.Symmetric{var"#s818",var"#s817"} where var"#s817"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s818"<:Real, B::LinearAlgebra.Hermitian{var"#s816",var"#s815"} where var"#s815"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s816") in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:23
[103] +(A::LinearAlgebra.Symmetric{var"#s825",S} where S<:(AbstractArray{var"#s826",2} where var"#s826"<:var"#s825") where var"#s825"<:Real, B::LinearAlgebra.Hermitian) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/symmetric.jl:481
[104] +(Da::LinearAlgebra.Diagonal, Db::LinearAlgebra.Diagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/diagonal.jl:156
[105] +(D::LinearAlgebra.Diagonal, S::LinearAlgebra.Symmetric) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/diagonal.jl:160
[106] +(S::LinearAlgebra.Symmetric, D::LinearAlgebra.Diagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/diagonal.jl:163
[107] +(D::LinearAlgebra.Diagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Real, H::LinearAlgebra.Hermitian) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/diagonal.jl:166
[108] +(H::LinearAlgebra.Hermitian, D::LinearAlgebra.Diagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Real) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/diagonal.jl:169
[109] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/bidiag.jl:347
[110] +(UL::LinearAlgebra.UnitUpperTriangular, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:147
[111] +(UL::LinearAlgebra.UnitLowerTriangular, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:147
[112] +(A::LinearAlgebra.Hermitian, J::LinearAlgebra.UniformScaling{var"#s826"} where var"#s826"<:Complex) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:161
[113] +(H::LinearAlgebra.UpperHessenberg, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/hessenberg.jl:106
[114] +(A::LinearAlgebra.Tridiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number, B::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:226
[115] +(A::LinearAlgebra.SymTridiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number, B::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:231
[116] +(A::LinearAlgebra.Bidiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number, B::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:236
[117] +(A::LinearAlgebra.Diagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number, B::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:241
[118] +(A::SparseArrays.AbstractSparseMatrixCSC, J::LinearAlgebra.UniformScaling) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/sparsematrix.jl:3641
[119] +(A::AbstractArray{T,2} where T, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:180
[120] +(A::LinearAlgebra.UpperHessenberg, B::LinearAlgebra.UpperHessenberg) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/hessenberg.jl:101
[121] +(A::LinearAlgebra.UpperTriangular, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:86
[122] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.UpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:94
[123] +(A::LinearAlgebra.UnitUpperTriangular, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:86
[124] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.UnitUpperTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:94
[125] +(A::LinearAlgebra.LowerTriangular, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:86
[126] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.LowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:94
[127] +(A::LinearAlgebra.UnitLowerTriangular, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:86
[128] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.UnitLowerTriangular) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:94
[129] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.Diagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:115
[130] +(A::LinearAlgebra.Diagonal, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:125
[131] +(A::LinearAlgebra.Diagonal, B::LinearAlgebra.SymTridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:135
[132] +(A::LinearAlgebra.SymTridiagonal, B::LinearAlgebra.Diagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:145
[133] +(A::LinearAlgebra.Tridiagonal, B::LinearAlgebra.SymTridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:157
[134] +(A::LinearAlgebra.SymTridiagonal, B::LinearAlgebra.Tridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:159
[135] +(A::LinearAlgebra.Diagonal, B::LinearAlgebra.Tridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:163
[136] +(A::LinearAlgebra.Tridiagonal, B::LinearAlgebra.Diagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:173
[137] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.Tridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:183
[138] +(A::LinearAlgebra.Tridiagonal, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:193
[139] +(A::LinearAlgebra.Bidiagonal, B::LinearAlgebra.SymTridiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:203
[140] +(A::LinearAlgebra.SymTridiagonal, B::LinearAlgebra.Bidiagonal) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:213
[141] +(A::SparseArrays.AbstractSparseMatrixCSC, B::SparseArrays.AbstractSparseMatrixCSC) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/sparsematrix.jl:1679
[142] +(A::SparseArrays.AbstractSparseMatrixCSC, B::Array) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/sparsematrix.jl:1682
[143] +(x::SparseArrays.AbstractSparseArray{Tv,Ti,1} where Ti where Tv, y::SparseArrays.AbstractSparseArray{Tv,Ti,1} where Ti where Tv) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/sparsevector.jl:1302
[144] +(A::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv, B::LinearAlgebra.Hermitian{var"#s826",var"#s825"} where var"#s825"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s826") in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:12
[145] +(A::LinearAlgebra.Hermitian{var"#s824",var"#s823"} where var"#s823"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s824", B::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:13
[146] +(A::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv, B::LinearAlgebra.Hermitian) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:15
[147] +(A::LinearAlgebra.Hermitian, B::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:16
[148] +(A::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv, B::LinearAlgebra.Symmetric{var"#s826",var"#s825"} where var"#s825"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s826") in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:12
[149] +(A::LinearAlgebra.Symmetric{var"#s824",var"#s823"} where var"#s823"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s824", B::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:13
[150] +(A::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv, B::LinearAlgebra.Symmetric) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:15
[151] +(A::LinearAlgebra.Symmetric, B::SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:16
[152] +(A::LinearAlgebra.Symmetric{var"#s826",var"#s825"} where var"#s825"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s826", B::LinearAlgebra.Hermitian{var"#s824",var"#s823"} where var"#s823"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s824") in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:21
[153] +(A::LinearAlgebra.Hermitian{var"#s822",var"#s821"} where var"#s821"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s822", B::LinearAlgebra.Symmetric{var"#s820",var"#s819"} where var"#s819"<:(SparseArrays.AbstractSparseArray{Tv,Ti,2} where Ti where Tv) where var"#s820") in SparseArrays at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/SparseArrays/src/linalg.jl:22
[154] +(x::AbstractArray{var"#s91",N} where N where var"#s91"<:Number) in Base at abstractarraymath.jl:97
[155] +(A::AbstractArray, B::AbstractArray) in Base at arraymath.jl:37
[156] +(x::T, y::Integer) where T<:AbstractChar in Base at char.jl:223
[157] +(index1::CartesianIndex{N}, index2::CartesianIndex{N}) where N in Base.IteratorsMD at multidimensional.jl:113
[158] +(::Number, ::Missing) in Base at missing.jl:116
[159] +(x::P, y::P) where P<:Dates.Period in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:78
[160] +(x::Dates.Period, y::Dates.Period) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:344
[161] +(y::Dates.Period, x::Dates.CompoundPeriod) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:346
[162] +(x::Union{Dates.CompoundPeriod, Dates.Period}) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:355
[163] +(x::Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:8
[164] +(a::Dates.TimeType, b::Dates.Period, c::Dates.Period) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:366
[165] +(a::Dates.TimeType, b::Dates.Period, c::Dates.Period, d::Dates.Period...) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:367
[166] +(x::Dates.TimeType, y::Dates.CompoundPeriod) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/periods.jl:369
[167] +(x::Dates.Instant) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:4
[168] +(y::Dates.Period, x::Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/arithmetic.jl:80
[169] +(x::Dates.Period, r::AbstractRange{var"#s826"} where var"#s826"<:Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/ranges.jl:58
[170] +(x::AbstractArray{var"#s826",N} where N where var"#s826"<:Dates.TimeType, y::Union{Dates.CompoundPeriod, Dates.Period}) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:6
[171] +(y::Union{Dates.CompoundPeriod, Dates.Period}, x::AbstractArray{var"#s826",N} where N where var"#s826"<:Dates.TimeType) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:14
[172] +(y::Dates.TimeType, x::StridedArray{var"#s826", N} where N where var"#s826"<:Union{Dates.CompoundPeriod, Dates.Period}) in Dates at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/Dates/src/deprecated.jl:18
[173] +(J::LinearAlgebra.UniformScaling, x::Number) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:111
[174] +(x::Number, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:112
[175] +(J1::LinearAlgebra.UniformScaling, J2::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:116
[176] +(J::LinearAlgebra.UniformScaling, B::BitArray{2}) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:118
[177] +(A::LinearAlgebra.UniformScaling, B::LinearAlgebra.Tridiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:245
[178] +(A::LinearAlgebra.UniformScaling, B::LinearAlgebra.SymTridiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:250
[179] +(A::LinearAlgebra.UniformScaling, B::LinearAlgebra.Bidiagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:255
[180] +(A::LinearAlgebra.UniformScaling, B::LinearAlgebra.Diagonal{var"#s826",V} where V<:AbstractArray{var"#s826",1} where var"#s826"<:Number) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/special.jl:260
[181] +(J::LinearAlgebra.UniformScaling, A::AbstractArray{T,2} where T) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/uniformscaling.jl:119
[182] +(F::LinearAlgebra.Hessenberg, J::LinearAlgebra.UniformScaling) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/hessenberg.jl:559
[183] +(J::LinearAlgebra.UniformScaling, F::LinearAlgebra.Hessenberg) in LinearAlgebra at /home/reoh/packages/julias/julia-1.5/share/julia/stdlib/v1.5/LinearAlgebra/src/hessenberg.jl:560
[184] +(a, b, c, xs...) in Base at operators.jl:538
```

若没有专用方法 程序执行则会出现错误 此时应针对其定义专用方法



## 多重分派

分派指根据变量的类型选择相应的方法

单分派指根据第一个变量的类型选择方法

根据所有参数决定调用哪一方法为多重分派

> 当一个函数被应用时执行方法的选择被称为 **分派**。Julia 允许分派过程基于给定的参数个数和所有参数的类型来选择调用函数的哪个方法。这与传统的面对对象的语言不一样，面对对象语言的分派只基于第一参数，经常有特殊的参数语法，并且有时是暗含而非显式写成一个参数。 [[1\]](https://docs.juliacn.com/latest/manual/methods/#footnote-1) 使用函数的所有参数，而非只用第一个，来决定调用哪个方法被称为[多重分派](https://en.wikipedia.org/wiki/Multiple_dispatch)。多重分派对于数学代码来说特别有用，人工地将运算视为对于其中一个参数的属于程度比其他所有的参数都强的这个概念对于数学代码是几乎没有意义的：`x + y` 中的加法运算对 `x` 的属于程度比对 `y` 更强？一个数学运算符的实现普遍基于它所有的参数的类型。即使跳出数学运算，多重分派是对于结构和组织程序来说也是一个强大而方便的范式。



## 控制

复合表达式

块

```julia
begin
end
```

链式

```julia
(#;#;#)
```



条件求值

```julia
if
elseif
else
end
```

注：判断条件必须为`ture`或`false`

`while`循环

`for`循环 `for`亦可遍历任意容器

可以使用`for`方法定义矩阵

变量作用域：`for`循环中的变量默认为`local` 不受外部同名变量影响



短路求值



重复求值



异常处理

```julia
try
catch
end
```

对于必须执行的语句使用`finally`

```julia
try
catch
finally
end
```



[任务（协程）](#tasks)

被称为对称协程、轻量级线程、协同多任务等 并非是线程

> Task 是一种允许计算以更灵活的方式被中断或者恢复的流程控制特性。这个特性有时被叫做其它名字，例如，对称协程（symmetric coroutines），轻量级线程（lightweight threads），合作多任务处理（cooperative multitasking），或者单次续延（one-shot continuations）。

任务可被其他任务中断 恢复后会从任务中断处继续工作 类似函数调用

不同：任务切换无需空间 因此无需考虑堆栈问题 且可以按照任意顺序进行

适用于`生产者-消费者`模式

> Julia 提供了 [`Channel`](http://cn.julialang.org/JuliaZH.jl/v1.2/base/parallel/#Base.Channel) 机制来解决这个问题。一个 [`Channel`](http://cn.julialang.org/JuliaZH.jl/v1.2/base/parallel/#Base.Channel) 是一个先进先出的队列，允许多个 `Task` 对它可以进行读和写。

`Channel` 其实质为FIFO队列 使用`put!`与`take!`函数实现

也可使用`for`循环方式

在两次调用`put!()`方法之间 生产者的执行被挂起 此时由消费者接管控制

随着任务结束 `Channel`对象会自动关闭 无需人为干预



## 类型

`julia`中没有class 亦无子类型的继承关系 只有抽象类型可以作为超类型

`julia`中的继承是继承行为而非继承结构（无变量间的继承 只继承其类行）



声明变量的类型 亦可用于断言变量类型是否正确

类型声明常用于指定函数的参数类型与返回类型



抽象类型不能被实例化 也无法被直接使用

```julia
abstract type «name» end
abstract type «name» <: «supertype» end
```

`<:`表示新声明的抽象类型为后类型的子类型 若未指定 则默认为`Any`



原始类型

原始类型为具体类型 可以被实例化为对象

```julia
primitive type «name» «bits» end
primitive type «name» <: «supertype» «bits» end
```

标准的原始类型在语言中已被定义好



> 抽象类型的一个重要用途是为具体类型提供默认实现。
>
> 抽象类型允许程序员编写泛型函数，之后可以通过许多具体类型的组合将其用作默认方法。多亏了多重分派，程序员可以完全控制是使用默认方法还是更具体的方法。



类型转换

```julia
Int8(10)
convert(Int8,10)
```

此种转换仅限于数字之间 且不能越界

> 一些语言考虑将解析字符串为数字或格式化数字为字符串来进行转换（许多动态语言甚至会自动执行转换），但 Julia 不会：尽管某些字符串可以解析为数字，但大多数字符串都不是有效的数字表示形式，只有非常有限的子集才是。因此，在 Julia 中，必须使用专用的 [`parse`](https://docs.juliacn.com/latest/base/numbers/#Base.parse) 函数来执行此操作，这使其更加明确。

`parse`方法

```julia
julia> parse(Int, "10101", base = 2)
21

julia> parse(Int, "a", base = 16)
10
```



类型提升

`promote`



复合类型

即自定义类型

```julia
julia> struct Foo
           bar
           baz::Int
           qux::Float64
       end
```

`struct`为不可变类型 对象在创建之后 不可更改

> 可以使用 [`fieldnames`](https://docs.juliacn.com/latest/base/base/#Base.fieldnames) 函数找到字段名称列表。



可变复合类型

```julia
julia> mutable struct Bar
           baz
           qux::Float64
       end
```

可变复合类型是建立于堆上的 且具有稳定的内存地址



DataType

> `DataType` 可以是抽象的或具体的。它如果是具体的，就具有指定的大小、存储布局和字段名称（可选）。因此，原始类型是具有非零大小的 `DataType`，但没有字段名称。复合类型是具有字段名称或者为空（大小为零）的 `DataType`。
>
> 每一个具体的值在系统里都是某个 `DataType` 的实例。



Type Union



参数类型

`julia`类型支持参数化

> 类型参数在类型名称后引入，用大括号扩起来：
>
> ```julia
> julia> struct Point{T}
>            x::T
>            y::T
>        end
> ```
>
> `Point` 不同 `T` 值所声明的具体类型之间，不能互相作为子类型：
>
> ```julia
> julia> Point{Float64} <: Point{Int64}
> false
>
> julia> Point{Float64} <: Point{Real}
> false
> ```

复合参数类型也支持多个参数类型

抽象参数类型

> 参数抽象类型声明以非常相似的方式声明了一族抽象类型：
>
> ```julia
> julia> abstract type Pointy{T} end
> ```



变参元组类型

> 元组类型的最后一个参数可以是特殊类型 [`Vararg`](https://docs.juliacn.com/latest/base/base/#Core.Vararg)，它表示任意数量的尾随参数：
>
> ```julia
> julia> mytupletype = Tuple{AbstractString,Vararg{Int}}
> Tuple{AbstractString,Vararg{Int64,N} where N}
> ```
>
> 类型 `Vararg{T,N}` 对应于正好 `N` 个类型为 `T` 的元素。`NTuple{N,T}` 是 `Tuple{Vararg{T,N}}` 的别名，即包含正好 `N` 个类型为 `T` 元素的元组类型。



单态类型

> 对于每个类型 `T`，「单态类型」`Type{T}` 是个抽象类型且唯一的实例就是对象 `T`。
>
> ```julia
> julia> isa(Float64, Type{Float64})
> true
> ```

当且仅当 A 与 B 是同一对象且该对象是一个类型时 `isa(A,Type{B})` 为真。



UnionAll类型

> 命名此类型有一种方便的语法，类似于函数定义语法的简短形式：
>
> ```julia
> Vector{T} = Array{T,1}
> ```
>
> 这等价于 `const Vector = Array{T,1} where T`。编写 `Vector{Float64}` 等价于编写 `Array{Float64,1}`，总类型 `Vector` 具有所有 `Array` 对象的实例，其中 `Array` 对象的第二个参数——数组维数——是 1，而不考虑元素类型是什么。在参数类型必须总被完整指定的语言中，这不是特别有用，但在 Julia 中，这允许只编写 `Vector` 来表示包含任何元素类型的所有一维密集数组的抽象类型。



## 绘图

Plots



## IO操作



## 模块

```julia
moudle
end
```



## 元编程

```julia
julia> ex = :(a + *(b,c) + 1)
:(a + b * c + 1)

julia> dump(ex)
Expr
  head: Symbol call
  args: Array{Any}((4,))
    1: Symbol +
    2: Symbol a
    3: Expr
      head: Symbol call
      args: Array{Any}((3,))
        1: Symbol *
        2: Symbol b
        3: Symbol c
    4: Int64 1
```

> ```julia
> julia>      :(a + b*c + 1)       ==
>        Meta.parse("a + b*c + 1") ==
>        Expr(:call, :+, :a, Expr(:call, :*, :b, :c), 1)
> true
> ```
>
> 解析器提供的表达式通常只有符号、其它表达式和字面量值作为其参数，而由 Julia 代码构造的表达式能以非字面量形式的任意运行期值作为其参数。在此特例中，`+` 和 `a` 都是符号，`*(b,c)` 是子表达式，而 `1` 是 64 位带符号整数字面量。



```julia
julia> ex = quote
                  x = 1
                  y = 2
                  x + y
              end
quote
    #= REPL[6]:2 =#
    x = 1
    #= REPL[6]:3 =#
    y = 2
    #= REPL[6]:4 =#
    x + y
end

julia> dump(ex)
Expr
  head: Symbol block
  args: Array{Any}((6,))
    1: LineNumberNode
      line: Int64 2
      file: Symbol REPL[6]
    2: Expr
      head: Symbol =
      args: Array{Any}((2,))
        1: Symbol x
        2: Int64 1
    3: LineNumberNode
      line: Int64 3
      file: Symbol REPL[6]
    4: Expr
      head: Symbol =
      args: Array{Any}((2,))
        1: Symbol y
        2: Int64 2
    5: LineNumberNode
      line: Int64 4
      file: Symbol REPL[6]
    6: Expr
      head: Symbol call
      args: Array{Any}((3,))
        1: Symbol +
        2: Symbol x
        3: Symbol y
```



```julia
julia> dump(:((1,2,3)))
Expr
  head: Symbol tuple
  args: Array{Any}((3,))
    1: Int64 1
    2: Int64 2
    3: Int64 3

julia> dump(:(1,2,3))
Expr
  head: Symbol tuple
  args: Array{Any}((3,))
    1: Int64 1
    2: Int64 2
    3: Int64 3
```



```julia
julia> x = :(1 + 2)
:(1 + 2)

julia> eval(:x)
:(1 + 2)

julia> eval(eval(:x))
3
```



> 使用值参数直接构造 [`Expr`](https://docs.juliacn.com/latest/base/base/#Core.Expr) 对象虽然很强大，但与「通常的」 Julia 语法相比，`Expr` 构造函数可能让人觉得乏味。作为替代方法，Julia 允许将字面量或表达式插入到被引用的表达式中。表达式插值由前缀 `$` 表示。



> 每个[模块](https://docs.juliacn.com/latest/manual/modules/#modules)有自己的 [`eval`](https://docs.juliacn.com/latest/base/base/#Base.MainInclude.eval) 函数，该函数在其全局作用域内对表达式求值。传给 [`eval`](https://docs.juliacn.com/latest/base/base/#Base.MainInclude.eval) 的表达式不止可以返回值——它们还能具有改变封闭模块的环境状态的副作用：
>
> ```julia-repl
> julia> ex = :(x = 1)
> :(x = 1)
>
> julia> x
> ERROR: UndefVarError: x not defined
>
> julia> eval(ex)
> 1
>
> julia> x
> 1
> ```
>
> 这里，表达式对象的求值导致一个值被赋值给全局变量 `x`。



> 由于表达式只是 `Expr` 对象，而其可以通过编程方式构造然后对它求值，因此可以动态地生成任意代码，然后使用 [`eval`](https://docs.juliacn.com/latest/base/base/#Base.MainInclude.eval) 运行所生成的代码。这是个简单的例子：
>
> ```julia-repl
> julia> a = 1;
>
> julia> ex = Expr(:call, :+, a, :b)
> :(1 + b)
>
> julia> a = 0; b = 2;
>
> julia> eval(ex)
> 3
> ```
>
> `a` 的值被用于构造表达式 `ex`，该表达式将函数 `+` 作用于值 1 和变量 `b`。请注意 `a` 和 `b` 使用方式间的重要区别：
>
> - *变量* `a` 在表达式构造时的值在表达式中用作立即值。因此，在对表达式求值时，`a` 的值就无关紧要了：表达式中的值已经是 `1`，与 `a` 的值无关。
> - 另一方面，因为在表达式构造时用的是符号 `:b`，所以变量 `b` 的值无关紧要——`:b` 只是一个符号，变量 `b` 甚至无需被定义。然而，在表达式求值时，符号 `:b` 的值通过寻找变量 `b` 的值来解析。



> [`parse`](https://docs.juliacn.com/latest/base/numbers/#Base.parse) 函数，它接受字符串形式的 Julia 代码并返回相应的 `Expr`。
>
> 函数也可以接受一个或多个 `Expr` 对象作为参数，并返回另一个 `Expr`。



## Macros 宏

亦称为语法替换

在预编译时进行 在运行时无类似函数的调用时间

```julia
julia> macro hi()
           return :(println("hello world"))
       end
@hi (macro with 1 method)

julia> @hi
hello world
```

> 当 `@hi` 在REPL中被输入时，解释器立即执行，因此我们只会看到计算后的结果。

```julia
julia> :( println("Hello, world!") )
:(println("Hello, world!"))

julia> dump(:( println("Hello, world!") ))
Expr
  head: Symbol call
  args: Array{Any}((2,))
    1: Symbol println
    2: String "Hello, world!"

julia> eval(:( println("Hello, world!") ))
Hello, world!
```



```julia
julia> macro hi(str)
           return :(println("hello,", $str))
       end
@hi (macro with 2 methods)

julia> @hi("world")
hello,world
```

> ```julia-repl
> julia> macro sayhello(name)
>  return :( println("Hello, ", $name) )
>  end
> @sayhello (macro with 1 method)
> ```
>
> 这个宏接受一个参数`name`。当遇到`@sayhello`时，quoted 表达式会被*展开*并将参数中的值插入到最终的表达式中：
>
> ```julia-repl
> julia> @sayhello("human")
> Hello, human
> ```

> ### [插值](https://juliacn.gitlab.io/JuliaZH.jl/manual/metaprogramming.html#man-expression-interpolation)
>
> 使用值参数直接构造 [`Expr`](https://juliacn.gitlab.io/JuliaZH.jl/base/base.html#Core.Expr) 对象虽然很强大，但与「通常的」 Julia 语法相比，`Expr` 构造函数可能让人觉得乏味。作为替代方法，Julia 允许将字面量或表达式插入到被引用的表达式中。表达式插值由前缀 `$` 表示。
>
> 在此示例中，插入了变量 `a` 的值：
>
> ```julia-repl
> julia> a = 1;
>
> julia> ex = :($a + b)
> :(1 + b)
> ```
>
> 对未被引用的表达式进行插值是不支持的，这会导致编译期错误：
>
> ```julia-repl
> julia> $a + b
> ERROR: syntax: "$" expression outside quote
> ```
>
> 在此示例中，元组 `(1,2,3)` 作为表达式插入到条件测试中：
>
> ```julia-repl
> julia> ex = :(a in $:((1,2,3)) )
> :(a in (1, 2, 3))
> ```
>
> 在表达式插值中使用 `$` 是有意让人联想到[字符串插值](https://juliacn.gitlab.io/JuliaZH.jl/manual/strings.html#string-interpolation)和[命令插值](https://juliacn.gitlab.io/JuliaZH.jl/manual/running-external-programs.html#command-interpolation)。表达式插值使得复杂 Julia 表达式的程序化构造变得方便和易读。

```julia
julia> macro hi(str)
           println("hello,", str)
       end
@hi (macro with 1 method)

julia> @hi("julia")
hello,julia
```



宏调用



宏也支持多重派发



常用的宏

`@time`用于计算程序的运行时间

`@which`可以显示从何处调用当前语句

`@show`可将执行内容与其结果都打印出来



## 并行计算

协程

<a name = "tasks"></a>

协程为轻量级的线程 可以通过`Channel`实现多个任务间的通信

一端可读 一端可写

不同的task可以通过`put!`向同一channel中并发写入

不同的task也可通过`take!`从同一channel中并发读取

```
c1 = Channel(3)
c2 = Channel{Int64}(3)
```

`close`关闭channel 且关闭后不可再写入

`take!`读取数据后会将其删除 `fetch`仅能读取第一个数据但不会将其删除



若channel为空 则`take!`操作会被阻塞 直到有新的数据准备好

若channel为满 则`put!`操作亦会被阻塞 直到出现空余



channel可以使用`for`循环 直到channel取空或关闭

> 考虑这样一个用 channel 做 task 之间通信的例子。首先，起 4 个 task 来处理一个 `jobs` channel 中的数据。`jobs` 中的每个任务通过 `job_id` 来表示，然后每个 task 模拟读取一个 `job_id`，然后随机等待一会儿，然后往一个 results channel 中写入一个元组，它分别包含 `job_id` 和执行的时间，最后将结果打印出来：
>
> ```julia-repl
> julia> const jobs = Channel{Int}(32);
>
> julia> const results = Channel{Tuple}(32);
>
> julia> function do_work()
>            for job_id in jobs
>                exec_time = rand()
>                sleep(exec_time)                # 模拟执行实际外部工作所需的时间
>                put!(results, (job_id, exec_time))
>            end
>        end;
>
> julia> function make_jobs(n)
>            for i in 1:n
>                put!(jobs, i)
>            end
>        end;
>
> julia> n = 12;
>
> julia> @async make_jobs(n); # 用 "n" 个 jobs 填充 jobs channel
>
> julia> for i in 1:4 # 启动 4 个 tasks 来并行的处理请求
>            @async do_work()
>        end
>
> julia> @elapsed while n > 0 # 打印结果
>            job_id, exec_time = take!(results)
>            println("$job_id finished in $(round(exec_time; digits=2)) seconds")
>            global n = n - 1
>        end
> 4 finished in 0.22 seconds
> 3 finished in 0.45 seconds
> 1 finished in 0.5 seconds
> 7 finished in 0.14 seconds
> 2 finished in 0.78 seconds
> 5 finished in 0.9 seconds
> 9 finished in 0.36 seconds
> 6 finished in 0.87 seconds
> 8 finished in 0.79 seconds
> 10 finished in 0.64 seconds
> 12 finished in 0.5 seconds
> 11 finished in 0.97 seconds
> 0.029772311
> ```



多线程

`Threads`模块



原子操作

指不会被线程调度机制打断的操作 中途不会切换线程

`Atomic`



多进程

也叫多核心或分布式处理 使用一个CPU的多个核心或多个CPU进行处理

> 在 Julia 中，进程之间的通信通常是**单向**的，这里单向的意思是说，在实现2个进程之间的操作时，只需要显式地管理一个进程即可。此外，这些操作并不像是“发送消息”，“接收消息”这类操作，而是一些高阶的操作，比如调用用户定义的函数。

远程引用 remote references

远程调用 remote calls

> 远程引用是一个对象，任意一个进程可以通过它访问存储在某个特定进程上的对象。远程调用指是某个进程发起的执行函数的请求，该函数会在另一个（也可能是同一个）进程中执行。

`Future`

`Remote Channel`

> 一次远程调用会返回一个 [`Future`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.Future) 作为结果。远程调用会立即返回；也就是说，执行远程调用的进程接下来会继续执行下一个操作，而远程调用则会在另外的进程中进行。你可以通过对返回的 [`Future`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.Future) 执行 [`wait`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Base.wait) 操作来等待远程调用结束，然后用 [`fetch`](http://cn.julialang.org/JuliaZH.jl/v1.2/base/parallel/#Base.fetch-Tuple{Channel}) 获取结果。
>
> 对于 [`RemoteChannel`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.RemoteChannel) 而言，它可以被反复写入。例如，多个进程可以通过引用同一个远程 `Channel` 来协调相互之间的操作。

> [`remotecall`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.remotecall-Tuple{Any,Integer,Vararg{Any,N} where N}) 的第一个参数是想要调用的函数，第二个参数是执行函数的进程 `id`，其余的参数会喂给将要被调用的函数。在 Julia 中进行并行编程时，一般不需要显示地指明具体在哪个进程上执行，不过 [`remotecall`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.remotecall-Tuple{Any,Integer,Vararg{Any,N} where N}) 是一个相对底层的接口用来提供细粒度的管理。
>
> [`@spawnat`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.@spawnat) 宏会在第一个参数所指定的进程中执行后面第二个参数中的表达式。
>
> 一旦执行了 `fetch`，[`Future`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.Future) 就会将结果缓存起来，之后执行 [`fetch`](http://cn.julialang.org/JuliaZH.jl/v1.2/base/parallel/#Base.fetch-Tuple{Channel}) 的时候就不涉及到网络传输了。一旦所有的 [`Future`](http://cn.julialang.org/JuliaZH.jl/v1.2/stdlib/Distributed/#Distributed.Future) 都获取到了值，那么远端存储的值就会被删掉。

自定义函数只在当前线程可见

因此使用`@everywhere`宏定义函数 使其对所有线程可见



## 科学计算

`DataFrames`

`RDatasets`



概率分布



时间序列

