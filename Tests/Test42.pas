PROGRAM TestFunctionRedeclaration;

// Define a simple function.
// The compiler will generate the mangled name "f_Calculate_i"
FUNCTION Calculate(val: INTEGER): INTEGER;
BEGIN
  RETURN val * 2;
END;

// Redeclare the exact same function.
// This should cause a semantic error because "f_Calculate_i"
// is already defined in the global scope.
FUNCTION Calculate(val: INTEGER): INTEGER;
BEGIN
  RETURN val + 1;
END;

VAR
  result: INTEGER;

BEGIN
  result := Calculate(10);
  writeln(result);
END.

{
Error Test: Function Redeclaration
Tests that the semantic analyzer correctly identifies when a function
is declared more than once with the exact same signature in the same scope.
Expected Error(s):
Semantic Error (L:10, C:10): Function 'Calculate' with this exact signature is already declared in this scope.
}