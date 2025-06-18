program test5;
// Purpose: Test array declaration, assignment, and access.

var
  grades : array[1..10] of integer;
  first_grade : integer;

begin
  grades[1] := 95;
  grades[2] := 88;
  first_grade := grades[1];
end.
