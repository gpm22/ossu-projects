
def karatsuba(n_1, n_2) 

    n_1_s = n_1.to_s
    n_2_s = n_2.to_s
    
    n = [n_1_s.length, n_2_s.length].max 

    if(n == 1)
        puts  "a"
        return n_1*n_2
    end 

    n_half = (n.to_f/2).ceil

    if( n > n_1_s.length)
        a = 0
        b = n_1
    else
        a = (n_1_s.slice(0, n_half)).to_i
        b = (n_1_s.slice(n_half, n_half)).to_i
    end

    if (n > n_1_s.length)
        c = 0
        d = n_2
    else
      c = (n_2_s.slice(0, n_half)).to_i
      d = (n_2_s.slice(n_half, n_half)).to_i
    end

    p = a + b
    q = c + d

    ac = karatsuba(a, c)
    bd = karatsuba(b, d)
    pq = karatsuba(p, q)

    adbc = pq - ac - bd

    (ac.to_s+"0" * (n_1_s.length)).to_i + (adbc.to_s+"0" * (n_1_s.length/2)).to_i + bd
end

 aa = 3141592653589793238462643383279502884197169399375105820974944592
 bb = 2718281828459045235360287471352662497757247093699959574966967627

puts(karatsuba(aa, bb))