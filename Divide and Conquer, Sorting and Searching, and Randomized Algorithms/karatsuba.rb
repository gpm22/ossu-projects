def karatsuba(n_1, n_2) 
    n_1_s = n_1.to_s
    n_2_s = n_2.to_s
    
    n = [n_1_s.length, n_2_s.length].max 

    if(n == 1)
        return n_1*n_2
    end 

    if (n%2 != 0)
        n = n + 1
    end

    n_half = n/2 

    if n_1_s.length < n 
        n_1_s = ("0" * (n-n_1_s.length)) + n_1_s
    end

    if n_2_s.length < n 
        n_2_s = ("0" * (n-n_2_s.length)) + n_2_s
    end

    a = (n_1_s.slice(0, n_half)).to_i
    b = (n_1_s.slice(n_half, n_half)).to_i

    c = (n_2_s.slice(0, n_half)).to_i
    d = (n_2_s.slice(n_half, n_half)).to_i

    p = a + b
    q = c + d

    ac = karatsuba(a, c)
    bd = karatsuba(b, d)
    pq = karatsuba(p, q)
    adbc = pq - ac - bd

    (ac.to_s+"0" * n).to_i + (adbc.to_s+"0" * n_half).to_i + bd
end

aa = 3141592653589793238462643383279502884197169399375105820974944592
bb = 2718281828459045235360287471352662497757247093699959574966967627

puts karatsuba(aa, bb)