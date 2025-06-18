program test14;
// Purpose: Demonstrate a syntax error for a missing 'end'.
// ERROR: The 'begin' for the while loop does not have a matching 'end'.

var
  counter : integer;

begin
  counter := 0;
  while counter < 5 do
  begin
    counter := counter + 1;
  // Missing 'end;' statement here.
end.
