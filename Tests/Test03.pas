program test12;
// Purpose: Demonstrate a semantic type mismatch error.
// ERROR: Attempting to perform arithmetic on incompatible types (integer and boolean).

var
  a : integer;
  b : boolean;
  c : integer;

begin
  a := 10;
  b := true;
  c := a + b; // This line should fail the semantic analysis.
end.
