fn factors(n: u64) -> Vec<u64> {
    let mut factors = vec![1];
    let mut dual_factors = vec![];
    for i in 2..(n as f32 + 1e-9).sqrt().floor() as u64 {
        if n % i == 0 {
            factors.push(i);
            let dual_factor = n / i;
            if i != dual_factor {
                dual_factors.push(dual_factor);
            }
        }
    }
    factors.extend(dual_factors.iter().rev());
    factors
}


fn main() {
    let mut amicable_number_sum = 0;
    for i in 0..10000 {
        let factor_sum: u64 = factors(i).into_iter().sum();
        if factor_sum != i {
            if factors(factor_sum).into_iter().sum::<u64>() == i {
                println!("{i} and {factor_sum} are amicable");
                amicable_number_sum += i;
            }
        }
    }
    println!("The amicable number sum is {}", amicable_number_sum);
}