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

a = input('\nHow intense do you want the cell faces to be [0.0, 1.0]? (Default 0.4): ');
if(( isempty(a) )||( a < 0 )||( a > 1 ))
    a = 0.4;
end

s = input('\nWould you like to view the penetrating lines [y/n]? ', 's');
if(( isempty(s) )||( s == 'n' )||( s == 'N' ))
    s = 'r*';
    sphere_voronoi_display(n,c,w,a,s);
else
    fprintf('\nWhat color would you like the penetrating lines to be?');
    fprintf('\n\t1) Red \n\t2) Blue \n\t3) Green ');
    fprintf('\n\t4) Black (default) \n\t5) Yellow ');
    s = input('\n>> ');
    if isempty( s )
        s = 4;
    end
    fprintf('\nWhat symbol would you like to use for the Marker Specifier?');
    fprintf('\n\t1) * \n\t2) + \n\t3) o \n\t4) x (default)\n\t5) .');
    mark = input('\n>> ');
    if isempty( mark )
        mark = 4;
    end
%     combine color and mark to get a line spec
    s = s + mark*10;
    switch s
        case 11
            s = '-r*';
        case 12
            s = '-b*';
        case 13
            s = '-g*';
        case 14
            s = '-k*';
        case 15
            s = '-y*';
        case 21
            s = '-r+';
        case 22
            s = '-b+';
        case 23
            s = '-g+';
        case 24
            s = '-k+';
        case 25
            s = '-y+';
        case 31
            s = '-ro';
        case 32
            s = '-bo';
        case 33
            s = '-go';
        case 34
            s = '-ko';
        case 35
            s = '-yo';
        case 41
            s = '-rx';
        case 42
            s = '-bx';
        case 43
            s = '-gx';
        case 44
            s = '-kx';
        case 45
            s = '-yx';
        case 51
            s = '-r.';
        case 52
            s = '-b.';
        case 53
            s = '-g.';
        case 54
            s = '-k.';
        case 55
            s = '-y.';

        otherwise
            s = '-kx';
    end

   x = input('\nHow wide do you want the lines to be [0.1, 4.0]? (Default 2.0): ');
   if(( isempty(x) )||( x < 0 )||( x > 4.0 ))
        x = 2.0;
   end

    q = input('\nWould you like to add an additional marker on the lines? [y/n]: ', 's');
    if(( isempty( q ) )||( q == 'y' )||( q == 'Y' ))
        q = 1.0;
        q = input('\nHow far from the origin would you like the additional markers to be? (Default 0.50): ');
        if( isempty( q ) )
            q = 0.50;
        end

        fprintf('\nWhat color would you like the additonal marker to be?');
        fprintf('\n\t1) Red \n\t2) Blue (default) \n\t3) Green ');
        fprintf('\n\t4) Black \n\t5) Yellow ');
        t = input('\n>> ');
        if isempty( t )
            t = 2;
        end

        fprintf('\nWhat symbol would you like to use for the additional marker?');
        fprintf('\n\t1) * \n\t2) + \n\t3) o (default) \n\t4) x \n\t5) .');
        marker = input('\n>> ');
        if isempty( marker )
            marker = 3;
        end

        t = t + marker*10;

        switch t
            case 11
            t = 'r*';
        case 12
            t = 'b*';
        case 13
            t = 'g*';
        case 14
            t = 'k*';
        case 15
            t = 'y*';
        case 21
            t = 'r+';
        case 22
            t = 'b+';
        case 23
            t = 'g+';
        case 24
            t = 'k+';
        case 25
            t = 'y+';
        case 31
            t = 'ro';
        case 32
            t = 'bo';
        case 33
            t = 'go';
        case 34
            t = 'ko';
        case 35
            t = 'yo';
        case 41
            t = 'rx';
        case 42
            t = 'bx';
        case 43
            t = 'gx';
        case 44
            t = 'kx';
        case 45
            t = 'yx';
        case 51
            t = 'r.';
        case 52
            t = 'b.';
        case 53
            t = 'g.';
        case 54
            t = 'k.';
        case 55
            t = 'y.';

        otherwise
            t = 'bo';
        end

        sphere_voronoi_display(n,c,w,a,s,x,q,t);
    else
        sphere_voronoi_display(n,c,w,a,s,x);
    end
end
