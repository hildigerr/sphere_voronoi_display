function sphere_voronoi_display ( n, eColor, wid, alph, pointSpec, widv, qDist, pointSpec1, widv1, kqt, pointSpec2, widv2 )

%*****************************************************************************80
%
%% SPHERE_VORONOI_ displays the Voronoi polygons of the data.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    Oct 2014
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

%     fprintf ( 1, '\nSPHERE_VORONOI\n' );
%
% %
% %   Aquire Ponts
% %
%     d_xyz = input('Enter a set of xyz-points: '  );
%     if( isempty(d_xyz) )
%         n = input('Enter the quantity of points to randomy generate\n (default is 50): ');
%         if( isempty(n) ) %TODO: assert non-negative
%             n = 50
%         end
%         seed = 123456789;
%         [ d_xyz, seed ] = uniform_on_sphere01_map ( 3, n, seed );
%     else
%         [dim_num,n] = size(d_xyz);
%         %TODO: assert dim_num = 3;
%         if( eq(dim_num,3) )
%
%             for j = 1 : n
%                 norm = sqrt ( sum ( d_xyz(1:dim_num,j).^2 ) );
%                 d_xyz(1:dim_num,j) = d_xyz(1:dim_num,j) / norm;
%             end
%         else
%             d_xyz = transpose(d_xyz);
%             [dim_num,n] = size(d_xyz);
%             if( eq(dim_num,3) )
%
%                 for j = 1 : n
%                     norm = sqrt ( sum ( d_xyz(1:dim_num,j).^2 ) );
%                     d_xyz(1:dim_num,j) = d_xyz(1:dim_num,j) / norm;
%                 end
%             else
%                 fprintf ( 1, '\nERROR\n' );
%                 return
%             end
%         end
%     end


%
%   Retrieve Data
%
    raw_data = importdata( fullfile( ...
        'mdv', strcat('pack.3.', int2str(n), '.txt') ) );
    d_xyz = reshape( raw_data, 3, n );

%
%   Compute the Delaunay triangulation, Voronoi vertex, and Voronoi polygons.
%
    [ face_num, face ] = sphere_delaunay ( n, d_xyz );
    v_xyz = voronoi_vertices ( n, d_xyz, face_num, face );
    [ first, list ] = voronoi_polygons ( n, face_num, face );
    list_num = 2 * face_num;

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

%     figure(2);
%     hold on
%     trisurf(convhull(transpose(v_xyz)), transpose(v_xyz(1,:)), transpose(v_xyz(2,:)), transpose(v_xyz(3,:)));
%     axis equal
%     xlabel ( '-- X --' );
%     ylabel ( '-- Y --' );
%     zlabel ( '-- Z --' );
%     title ( 'Figure 2: Convex Hull of Voronoi polygons -- SURFACE' );
%     hold off

%     figure(3);
%     hold on
%     trimesh(convhull(transpose(v_xyz)), transpose(v_xyz(1,:)), transpose(v_xyz(2,:)), transpose(v_xyz(3,:)));
%     axis equal
%     xlabel ( '-- X --' );
%     ylabel ( '-- Y --' );
%     zlabel ( '-- Z --' );
%     title ( 'Figure 3: Convex Hull of Voronoi polygons -- MESH' );
%     hold off

%     figure(4);
%     hold on
%     trisurf(convhull(transpose(d_xyz)), transpose(d_xyz(1,:)), transpose(d_xyz(2,:)), transpose(d_xyz(3,:)));
%     axis equal
%     xlabel ( '-- X --' );
%     ylabel ( '-- Y --' );
%     zlabel ( '-- Z --' );
%     title ( 'Figure 4: Convex Hull of MDV points -- SURFACE' );
%     hold off

%     figure(5);
%     hold on
%     trimesh(convhull(transpose(d_xyz)), transpose(d_xyz(1,:)), transpose(d_xyz(2,:)), transpose(d_xyz(3,:)));
%     axis equal
%     xlabel ( '-- X --' );
%     ylabel ( '-- Y --' );
%     zlabel ( '-- Z --' );
%     title ( 'Figure 5: Convex Hull of MDV points -- MESH' );
%     hold off

    return
end
