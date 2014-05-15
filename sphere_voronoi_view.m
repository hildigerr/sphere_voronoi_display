function sphere_voronoi_view

n = input('Which dataset do you want to use? ');
if( isempty (n) )
    n = 100
end
sphere_voronoi_display(n);