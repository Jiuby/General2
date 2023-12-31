IDENTIFICATION DIVISION.
PROGRAM-ID. CONVEX-HULL.

DATA DIVISION.
WORKING-STORAGE SECTION.

01 POINTS-TABLE.
    05 POINTS-X OCCURS 10 TIMES PIC 9(2).
    05 POINTS-Y OCCURS 10 TIMES PIC 9(2).

01 POINT-RECORD.
    05 POINT-X PIC 9(2).
    05 POINT-Y PIC 9(2).

01 CONVEX-HULL-TABLE.
    05 CONVEX-HULL-INDEX OCCURS 10 TIMES PIC 9(2).
    05 CONVEX-HULL-X OCCURS 10 TIMES PIC 9(2).
    05 CONVEX-HULL-Y OCCURS 10 TIMES PIC 9(2).

PROCEDURE DIVISION.

MAIN-PROCEDURE.

    ** Get the number of points. **

    ACCEPT NUMBER-OF-POINTS FROM INPUT.

    ** Read the points. **

    DO NUMBER-OF-POINTS TIMES.

        ACCEPT POINT-X FROM INPUT.
        ACCEPT POINT-Y FROM INPUT.

        MOVE POINT-X TO POINTS-TABLE(POINTS-INDEX).
        MOVE POINT-Y TO POINTS-TABLE(POINTS-INDEX + 1).

        ADD 1 TO POINTS-INDEX.

    END-DO.

    ** Find the point with the maximum y-coordinate. **

    MOVE POINTS-TABLE(1) TO MAX-POINT-RECORD.

    DO POINTS-INDEX TIMES.

        IF POINTS-TABLE(POINTS-INDEX) > MAX-POINT-RECORD THEN

            MOVE POINTS-TABLE(POINTS-INDEX) TO MAX-POINT-RECORD.

        END-IF.

    END-DO.

    ** Find the convex hull. **

    MOVE 1 TO CONVEX-HULL-INDEX.
    MOVE MAX-POINT-RECORD TO CONVEX-HULL-TABLE(CONVEX-HULL-INDEX).

    DO POINTS-INDEX TIMES.

        IF CONVEX-HULL-INDEX = NUMBER-OF-POINTS THEN

            EXIT.

        END-IF.

        MOVE CONVEX-HULL-TABLE(CONVEX-HULL-INDEX) TO POINT-RECORD.

        MOVE CONVEX-HULL-TABLE(CONVEX-HULL-INDEX + 1) TO MAX-POINT-RECORD.

        MOVE POINTS-TABLE(POINTS-INDEX) TO CONVEX-HULL-TABLE(CONVEX-HULL-INDEX + 1).

        IF CROSS(POINT-RECORD - MAX-POINT-RECORD, MAX-POINT-RECORD - POINTS-TABLE(POINTS-INDEX)) > 0 THEN

            ADD 1 TO CONVEX-HULL-INDEX.

        END-IF.

    END-DO.

    ** Print the convex hull. **

    DO CONVEX-HULL-INDEX TIMES.

        DISPLAY CONVEX-HULL-TABLE(CONVEX-HULL-INDEX)
