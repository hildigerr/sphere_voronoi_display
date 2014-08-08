function sphere_voronoi_view

n = input('Which dataset do you want to use? ');
if( isempty (n) )
    fprintf('\tUsing 100-point set as default.\n');
    n = 100;
end

fprintf('\nWhat color would you like the lines to be?\n');
fprintf('\t1) Red (default) \n\t2) Black\n');
c = input('>> ');
if( isempty(c) ||( c == 1 ))
    c = 'r';
else
    c = 'k';
end

w = input('\nHow wide do you want the cell lines to be [0.1, 4.0]? (Default 2.0): ');
if(( isempty(w) )||( w < 0 )||( w > 4 ))
    w = 2.0;
end

a = input('\nHow intense do you want the cell faces to be [0.0, 1.0]? (Default 0.9): ');
if(( isempty(a) )||( a < 0 )||( a > 1 ))
    a = 0.9;
end

s = input('\nWould you like to view the penetrating vectors [y/n]? ', 's');
if(( isempty(s) )||( s == 'n' )||( s == 'N' ))
    s = 'r*';
else
    fprintf('\nWhat color would you like the penetrating lines to be?');
    fprintf('\n\t1) Red (default) \n\t2) Blue \n\t3) Green ');
    fprintf('\n\t4) Black \n\t5) Yellow ');
    s = input('\n>> ');
    if isempty( s )
        s = 1;
    end
    switch s
        case 2
            s = '-b*';
        case 3
            s = '-g*';
        case 4
            s = '-k*';
        case 5
            s = '-y*';
        otherwise
            s = '-r*';
    end
    x = input('\nHow wide do you want the lines to be [0.1, 4.0]? (Default 2.0): ');
    if(( isempty(x) )||( x < 0 )||( x > 4 ))
        x = 2.0;
    end
    sphere_voronoi_display(n,c,w,a,s,x);
end
sphere_voronoi_display(n,c,w,a,s);

