fn is_prime(n: u32) -> bool {
    for i in 2..=(n as f32).sqrt() as u32 {
        if n % i == 0 {
            return false
        }
    }
    true
}


fn main() {
    let sought_prime = (2..).filter(|n| is_prime(*n)).skip(10000).next().unwrap();
    println!("The 10001st prime is {}", sought_prime);
}