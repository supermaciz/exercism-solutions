open Core_kernel

let nums = [|'M', '_'; 'C', 'D'; 'X', 'L'; 'I', 'V'|]

let to_roman nb =
  let digits = Int.to_string nb in
  let diff = Array.length nums - String.length digits in
  digits
  |> String.foldi ~init:"" ~f:(
    fun i acc c ->
      match c with
      | '0' -> acc
      | '4' ->
        acc ^ (Char.to_string @@ fst nums.(i + diff)) ^ Char.to_string @@ snd nums.(i + diff)
      | '9' ->
        acc ^ (Char.to_string @@ fst nums.(i + diff)) ^ (Char.to_string @@ fst nums.(i + diff - 1))
      | '5' -> acc ^ Char.to_string @@ snd nums.(i + diff)
      | c when c > '0' && c < '4' ->
        acc ^ String.make (Int.of_string @@ Char.to_string c) (fst nums.(i + diff))
      | c ->
        let n = (Int.of_string @@ Char.to_string c) - 5 in
        acc ^ (Char.to_string @@ snd nums.(i + diff)) ^ (String.make n @@ fst nums.(i + diff))
  )