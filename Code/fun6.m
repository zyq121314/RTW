function hexagonVertices = fun6(x1,z1,x2,z2)
d=0.008;l=0.8*norm([z2-z1,x2-x1]);
% 计算直线的中点
midPoint = [(x1 + x2) / 2, (z1 + z2) / 2];

% 计算直线的方向向量
directionVector = [(x2 - x1), (z2 - z1)];

% 计算单位方向向量
unitDirection = directionVector / norm(directionVector);

% 计算垂直于直线的向量
perpendicularVector = [-unitDirection(2), unitDirection(1)];

% 计算六边形的顶点坐标
hexagonVertices = zeros(7, 2);

% 计算顶点
hexagonVertices(1, :) = [x1, z1];
hexagonVertices(2, :) = midPoint + d * perpendicularVector - l/2 * unitDirection;
hexagonVertices(3, :) = midPoint + d * perpendicularVector + l/2 * unitDirection;
hexagonVertices(4, :) = [x2, z2];
hexagonVertices(5, :) = midPoint - d * perpendicularVector + l/2 * unitDirection;
hexagonVertices(6, :) = midPoint - d * perpendicularVector - l/2 * unitDirection;
hexagonVertices(7, :) = [x1, z1];

end
