// This is a very bare bones rust project.
// To run it, just do `rustc solution.rs && ./solution`

struct Squares {
    count: u32,
    prev_square: u32,
}


impl Squares {
    fn new() -> Squares {
        Squares{ count: 0, prev_square: 0 }
    }
}


impl Iterator for Squares {
    type Item = u32;

    fn next(&mut self) -> Option<Self::Item> {
        self.prev_square += 2*self.count + 1;
        self.count += 1;
        Some(self.prev_square)
    }
}


fn main() {
    // Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
    const COUNT: i32 = 100;
    let sum_of_squares: i32 = Squares::new().take(COUNT as usize).sum::<u32>() as i32;
    let square_of_sum: i32 = (1..=COUNT).sum::<i32>().pow(2);
    println!("{} - {} = {}", square_of_sum, sum_of_squares, square_of_sum - sum_of_squares);
}