type t = Alice | Bob | Charlie | David of int

let test v =
  match v with Alice -> 100 | Bob -> 101 | Charlie -> 102 | David i -> i
