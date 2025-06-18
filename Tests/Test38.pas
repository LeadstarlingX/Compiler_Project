program test7;
// Purpose: Test function declaration, calling, and return values.

var
  a, b, result : integer;

function add(x : integer; y : integer) : integer;
begin
  return x + y;
end;

begin
  a := 15;
  b := 20;
  result := add(a, b);
end.
