def countInv (a)
    n = a.length
    n_half = (n / 2).round
    if n <= 1
        [a, 0]
    else
        c, leftInv = countInv(a.take(n_half))  #first half of a
        d, rightInv = countInv(a.drop(n_half)) #second half of a
        b, splitInv = mergeAndCountSplitInv(c, d)
        [b, leftInv + rightInv + splitInv]
    end
end

def mergeAndCountSplitInv (c, d)
    splitInv = 0
    b = []
    while (c.length > 0 and d.length > 0)
        if c[0] < d[0]
            b.push(c.shift)
        else
            b.push(d.shift)
            splitInv = splitInv + c.length
        end
    end
   
    if c.length > 0 
        b.concat(c)
    end

    if d.length > 0
        b.concat(d)
    end

    [b, splitInv]
end

def doTest(a, expected)
    puts a.to_s + " - " + expected.to_s + " - " + countInv(a)[1].to_s
end

doTest([1, 3, 5, 2, 4, 6], 3)
doTest([4, 3, 2, 1], 6)
doTest([3, 2, 1], 3)
doTest([5, 3, 2, 1, 6], 6)
doTest([], 0)
doTest([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0)