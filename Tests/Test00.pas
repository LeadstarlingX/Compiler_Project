// Purpose: Demonstrate successful usage of arrays, including
// declaration, initialization, and iteration with a while loop.

var
  numbers : array[1..5] of integer;
  total   : integer;
  index   : integer;

begin
  // Initialize the array elements
  numbers[1] := 10;
  numbers[2] := 20;
  numbers[3] := 30;
  numbers[4] := 40;
  numbers[5] := 50;

  // Sum the elements of the array
  total := 0;
  index := 1;
  while index <= 5 do
  begin
    total := total + numbers[index];
    index := index + 1;
  end;
  
end.
