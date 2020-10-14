debugging = true

macro debug_show(msg...)
    if debugging
        :(println("DEBUG-> ", $(msg...)))
    else
        :nothing
    end # if
end # macro

macro debug_show(lineno, msg...)
    if debugging
        :(println("DEBUG ", basename(@__FILE__), ":[", $lineno, "]-> ", $(msg...)))
    else
        :nothing
    end # if
end # macro

function bubble_sort!(xs::Vector)
    println("Bubble_Sort Starting...")
    n = length(xs)
    swapped = true
    while swapped
        swapped = false
        for i in 1:n-1
            if xs[i] > xs[i+1]
                xs[i], xs[i+1] = xs[i+1], xs[i]
                @debug_show(@__LINE__, join(xs, " "))
                swapped = true
            end # if
        end # for
    end # while
    xs
end # function

xs = Vector([1, 3, 4, 5, 8, 2, 7])

res = bubble_sort!(xs)

@time bubble_sort!(xs)