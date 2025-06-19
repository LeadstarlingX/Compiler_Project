PROGRAM ScopeErrors;
VAR
  x: INTEGER;
  x: REAL; // Error: Redeclaration of 'x' in global scope

PROCEDURE Test;
  VAR
    y: INTEGER;
    y: INTEGER; // Error: Redeclaration of 'y' in local scope
  BEGIN
  END;

BEGIN
END.