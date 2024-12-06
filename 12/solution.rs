fn factors(n: u64) -> Vec<u64> {
    let mut factors = vec![1];
    let mut dual_factors = vec![n];
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
    let mut tri_number: u64 = 0;
    for i in 1.. {
        tri_number += i;
        let f = factors(tri_number);
        if f.len() > 500 {
            println!("{} has over 500 factors", tri_number);
            return;
        }
    }
}