PROGRAM TestForwardDeclaration;

PROCEDURE ProcA;
BEGIN
  writeln('In ProcA, about to call ProcB.');
  // This call is valid because the semantic analyzer does a first pass
  // to collect all subprogram headers before analyzing bodies.
  ProcB;
  writeln('Returned from ProcB to ProcA.');
END;


BEGIN
  writeln('Main program started.');
  ProcA;
  writeln('Main program finished.');
END.

{
Test: Forward Subprogram Call
Purpose: This test verifies that the compiler can correctly handle a call
to a procedure that is defined later in the source code. This is possible
due to the semantic analyzer's two-pass strategy.

Expected Output:
Main program started.
In ProcA, about to call ProcB.
Executing ProcB.
Returned from ProcB to ProcA.
Main program finished.
}