program test13;
// Purpose: Demonstrate a semantic error for calling an undeclared function.
// ERROR: 'calculate_sum' is not defined in this scope.

var
  result : integer;

begin
  result := calculate_sum(5, 10); // This should fail.
end.
