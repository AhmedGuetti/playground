Definition inc x := x+1

Definition add (x, y) := x + y
Definition add_c  x y := x + y
Definition And a b :=
  match a with
  | true => b
  | false => false
  end.

