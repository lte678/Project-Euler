use std::fs::File;
use std::io::{BufReader, BufRead};
use std::iter::zip;
use std::cmp;


fn load_tree(path: &str) -> Vec<Vec<i32>> {
    let f = BufReader::new(File::open(path).unwrap()); 
    f.lines().map(
        |line| line.unwrap().split_whitespace().map(
            |x| x.parse().unwrap()
        ).collect()
    ).collect()
}


fn main() {
    let problem = load_tree("problem.txt");
    let mut maximum_path = problem.last().unwrap().to_vec();
    for problem_row in problem.iter().rev().skip(1) {
        // Reduce the maximum path to the maximum of each pair
        maximum_path = zip(&maximum_path[..maximum_path.len()-1], &maximum_path[1..])
            .map(|(x, y)| cmp::max(*x, *y))
            .collect();
        // Add the current row onto the maximum.
        maximum_path = zip(maximum_path, problem_row).map(|(x, y)| x + y).collect();
    }
    println!("The maximum path has a length of {}", maximum_path[0]);
}