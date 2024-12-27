fn factors(n: u64) -> Vec<u64> {
    let mut factors = vec![1];
    let mut dual_factors = vec![];
    let mut i = 2;
    while i*i <= n {
        if n % i == 0 {
            factors.push(i);
            let dual_factor = n / i;
            if i != dual_factor {
                dual_factors.push(dual_factor);
            }
        }
        i += 1;
    }
    factors.extend(dual_factors.iter().rev());
    factors
}


fn is_sum_of(n: u64, set_a: &[u64], set_b: &[u64]) -> bool {
    if set_a.len() == 0 || set_b.len() == 0 {
        return false;
    }
    let mut a_iter = set_a.iter().peekable();
    let mut b_iter = set_b.iter().rev().peekable();
    loop {
        let c: u64 = *a_iter.peek().unwrap() + *b_iter.peek().unwrap();
        if c > n {
            b_iter.next();
            if b_iter.peek().is_none() {
                return false;
            }
        } else if c < n {
            a_iter.next();
            if a_iter.peek().is_none() {
                return false;
            }
        } else {
            return true;
        }
    }
}


fn main() {
    let mut even_abundant = vec![];
    let mut odd_abundant = vec![];
    for n in 12..30000 {
        let n_facs = factors(n);
        if n_facs.iter().sum::<u64>() > n {
            if n % 2 == 0 {
                even_abundant.push(n);
            } else {
                odd_abundant.push(n);
            }
        }
    }

    // List of numbers not representable as the sum of two abundant integers.
    let mut non_sum = vec![];
    for n in 1..30000 {
        if n % 2 == 0 {
            if !is_sum_of(n, &even_abundant, &even_abundant) {
                non_sum.push(n);
            }
        } else {
            if !is_sum_of(n, &even_abundant, &odd_abundant) {
                non_sum.push(n);
            }
        }
    }
    
    println!("Final result: {}", non_sum.iter().sum::<u64>());
}