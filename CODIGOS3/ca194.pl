% Find the convex hull of a set of points.
convex_hull(Points) :-
  % Find the point with the maximum y-coordinate.
  MaxY = max_y(Points),

  % Initialize the hull.
  Hull = [MaxY],

  % Iterate through the points and add them to the hull if they are on the convex hull.
  foreach(P in Points,
    if cross(P - MaxY, MaxY - Points) > 0 then
      Hull = [P | Hull]
    end
  ).

% Find the point with the maximum y-coordinate.
max_y(Points) :-
  max_y(Points, 0, 0).

% Recursively find the point with the maximum y-coordinate.
max_y([], MaxY, MaxY).
max_y([P | Points], MaxY, MaxY) :-
  Y = P.y,
  Y > MaxY,
  max_y(Points, Y, P).
max_y([P | Points], MaxY, MaxY) :-
  max_y(Points, MaxY, P).
