use std::fs::File;
use std::io::{BufReader, BufRead};


fn load_names(path: &str) -> Vec<String> {
    let f = BufReader::new(File::open(path).unwrap());
    let mut names = Vec::new();
    for line in f.lines() {
        names.extend(line.unwrap().replace('"', "").split(',').map(|x| String::from(x)));
    }
    names
}


fn name_score(name: &str, index: usize) -> u32 {
    let lexi_score: u32 = name.chars().map(|c| (c as u32) - ('A' as u32) + 1).sum();
    lexi_score * index as u32
}



fn main() {
    assert!(name_score("COLIN", 938) == 49714);

    let mut names = load_names("names.txt");
    names.sort();
    let score_sum: u32 = names.into_iter().enumerate().map(|(name_i, name)| name_score(&name, name_i + 1)).sum();
    println!("The sum of all the name scores is {score_sum}.");
}