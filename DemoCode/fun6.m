function hexagonVertices = fun6(x1,z1,x2,z2)
d=0.008;l=0.8*norm([z2-z1,x2-x1]);
midPoint = [(x1 + x2) / 2, (z1 + z2) / 2];
directionVector = [(x2 - x1), (z2 - z1)];
unitDirection = directionVector / norm(directionVector);
perpendicularVector = [-unitDirection(2), unitDirection(1)];
hexagonVertices = zeros(7, 2);
hexagonVertices(1, :) = [x1, z1];
hexagonVertices(2, :) = midPoint + d * perpendicularVector - l/2 * unitDirection;
hexagonVertices(3, :) = midPoint + d * perpendicularVector + l/2 * unitDirection;
hexagonVertices(4, :) = [x2, z2];
hexagonVertices(5, :) = midPoint - d * perpendicularVector + l/2 * unitDirection;
hexagonVertices(6, :) = midPoint - d * perpendicularVector - l/2 * unitDirection;
hexagonVertices(7, :) = [x1, z1];

end