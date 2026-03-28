pub fn plants(diagram: &str, student: &str) -> Vec<&'static str> {
    let students = [
        "Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph",
        "Kincaid", "Larry",
    ];
    let index = students.iter().position(|x| x == &student).unwrap();
    let drop_count = index * 2;
    let encoded_plants = diagram
        .lines()
        .flat_map(|l| l.chars().skip(drop_count).take(2));

    encoded_plants.map(|p| plant_name(p)).collect()
}

fn plant_name(encoded_plant: char) -> &'static str {
    match encoded_plant {
        'G' => "grass",
        'C' => "clover",
        'R' => "radishes",
        'V' => "violets",
        _ => panic!("Unknown plant"),
    }
}
