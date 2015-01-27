function sphere_voronoi_web ( n, eColor, wid, alph, pointSpec, widv, qDist, pointSpec1, widv1, kqt, pointSpec2, widv2, filename, d_xyz )

%*****************************************************************************80
%
%% SPHERE_VORONOI_ displays the Voronoi polygons of the data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Author:
%
%    Roberto Vergaray -- adapted from sphere_voroni_test02 by John Burkardt
%

if nargin < 5
    pointSpec = 'r*';
end
if nargin < 4
   alph = 0.9;
end
if nargin < 3
   wid = 2.0;
end
if nargin < 2
    eColor = 'r';
end


%
%   Compute the Delaunay triangulation, Voronoi vertex, and Voronoi polygons.
%
    [ face_num, face ] = sphere_delaunay ( n, d_xyz );
    v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
    [ first, list ] = voronoi_polygons ( n, face_num, face );

%
%   Plot the polygons.
%
    figure(1);
    clf
    hold on

    for i = 1 : n
        n1 = first(i);
        n2 = first(i+1) - 1;
        j = list(n1:n2);
        j = [ j; list(n1) ];
        h(i) = patch ( v_xyz(1,j), ...
                       v_xyz(2,j), ...
                       v_xyz(3,j), ...
                       'blue', 'EdgeColor', eColor, 'LineWidth', wid, 'FaceAlpha', alph );
%
%       Plot the Radial Lines
%
        if nargin > 8
            vqt = size(j);
            for t = 1 : vqt
               plot3( [v_xyz(1,j(t)),d_xyz(1,i)*qDist], ...
                      [v_xyz(2,j(t)),d_xyz(2,i)*qDist], ...
                      [v_xyz(3,j(t)),d_xyz(3,i)*qDist], ...
                      pointSpec1, 'LineWidth', widv1 );
            end
        end

%
%           plot spanning lines
%
        if nargin > 10
            for ta = 1 : vqt
                tb = mod(ta+1,vqt);
                tb = tb(1);
                if tb == 0
                  tb = 1;
                end
                for ix = 1 : kqt
                    plot3( ...
                        [d_xyz(1,i)*qDist + ix/kqt*(v_xyz(1,j(ta))-d_xyz(1,i)*qDist), d_xyz(1,i)*qDist + ix/kqt*(v_xyz(1,j(tb))-d_xyz(1,i)*qDist)],...
                        [d_xyz(2,i)*qDist + ix/kqt*(v_xyz(2,j(ta))-d_xyz(2,i)*qDist), d_xyz(2,i)*qDist + ix/kqt*(v_xyz(2,j(tb))-d_xyz(2,i)*qDist)],...
                        [d_xyz(3,i)*qDist + ix/kqt*(v_xyz(3,j(ta))-d_xyz(3,i)*qDist), d_xyz(3,i)*qDist + ix/kqt*(v_xyz(3,j(tb))-d_xyz(3,i)*qDist)],...
                        pointSpec2, 'LineWidth', widv2 );
            end
          end
        end
    end

%
%   Plot the Stem Lines
%
    if nargin > 5
        for i = 1 : n
            plot3 ( [0,d_xyz(1,i)]*qDist, [0,d_xyz(2,i)]*qDist, [0,d_xyz(3,i)]*qDist, pointSpec, 'LineWidth', widv );
        end
    end


    axis equal
%     xlabel ( '-- X --' );
%     ylabel ( '-- Y --' );
%     zlabel ( '-- Z --' );
%     title ( 'Figure 1: Voronoi polygons using PATCH' );
    hold off

    if nargin > 12 % have filename
        if isdeployed
            deployprint('-dpng','-r0',filename);
        else
            print('-dpng','-r0',filename);
        end
    end

end
