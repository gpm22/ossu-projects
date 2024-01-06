def karatsuba(n_1, n_2) 
    n_1_s = n_1.to_s
    n_2_s = n_2.to_s
    
    n = [n_1_s.length, n_2_s.length].max 

    return n_1*n_2 if n == 1 
	
    n = n + 1 if n.odd?

    n_half = n/2 

    n_1_s = ("0" * (n-n_1_s.length)) + n_1_s if n_1_s.length < n 

    n_2_s = ("0" * (n-n_2_s.length)) + n_2_s if n_2_s.length < n 

    a = n_1_s[0, n_half].to_i
    b = n_1_s[n_half, n].to_i
    c = n_2_s[0, n_half].to_i
    d = n_2_s[n_half, n].to_i

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
