function sphere_voronoi_view
%*****************************************************************************
%% sphere_voronoi_view interactively prepares parameters for sphere_voronoi_display
%*****************************************************************************

    n = input('Which dataset do you want to use? ');
    if( isempty (n) )
        fprintf('\tUsing 100-point set as default.\n');
        n = 100;
    end

    fprintf('\nWhat color would you like the cell lines to be?\n');
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

    s = input('\nWould you like to view the stem lines [y/n]? ', 's');
    if(( isempty(s) )||( s == 'n' )||( s == 'N' ))
        s = 'r';
        sphere_voronoi_display(n,c,w,a,s);
    else
        fprintf('\nWhat color would you like the stem lines to be?');
        fprintf('\n\t1) Red \n\t2) Blue \n\t3) Green ');
        fprintf('\n\t4) Black \n\t5) Yellow (default) ');
        s = input('\n>> ');
        if isempty( s )
            s = 5;
        end

        q = input('\nHow far from the origin would you like the lines to extend ? (Default 0.50): ');
        if( isempty( q ) )
            q = 0.50;
        end

        x = input('\nHow wide do you want the lines to be [0.1, 4.0]? (Default 1.0): ');
        if(( isempty(x) )||( x < 0 )||( x > 4.0 ))
            x = 1.0;
        end

        fprintf('\nWhat symbol would you like to use for the Marker Specifier?');
        fprintf('\n\t1) * \n\t2) + \n\t3) o  (default)\n\t4) x \n\t5) . \n\t6) NONE');
        mark = input('\n>> ');
        if isempty( mark )
            mark = 3;
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
            case 61
                s = '-r';
            case 62
                s = '-b';
            case 63
                s = '-g';
            case 64
                s = '-k';
            case 65
                s = '-y';

            otherwise
                % Keep this redundant with default for easy modification.
                %   in other words, don't try to be slick by eliminating
                %   an unnecessary case above, or you'll be sorry eventually.
                s = '-yo';
        end

        z = input('\nWould you like to view the radial lines [y/n]? ', 's');
        if(( isempty(z) )||( z == 'n' )||( z == 'N' ))
            sphere_voronoi_display(n,c,w,a,s,x,q);
        else
            fprintf('\nWhat color would you like the radial lines to be?');
            fprintf('\n\t1) Red \n\t2) Blue (default) \n\t3) Green ');
            fprintf('\n\t4) Black \n\t5) Yellow ');
            z = input('\n>> ');
            if isempty( z )
                z = 2;
            end

            y = input('\nHow wide do you want the radial lines to be [0.1, 4.0]? (Default 1.0): ');
            if(( isempty(y) )||( y < 0 )||( y > 4.0 ))
                y = 1.0;
            end

            switch z
                case 1
                    z = 'r';
                case 2
                    z = 'b';
                case 3
                    z = 'g';
                case 4
                    z = 'k';
                case 5
                    z = 'y';
                otherwise
                    z = 'b';
            end

            t =  input('\nWould you like to view the spanning lines [y/n]? ', 's');
            if(( isempty(t) )||( t == 'n' )||( t == 'N' ))
              sphere_voronoi_display(n,c,w,a,s,x,q,z,y);
            else
               spLnQt = input('\nHow many spanning lines do you want per pair of vertices [2, 20]? (Default 2): ');
               if(( isempty(spLnQt) )||( spLnQt < 2 )||( spLnQt > 20 ))
                 spLnQt = 2;
               end

               fprintf('\nWhat color would you like the spanning lines to be?');
               fprintf('\n\t1) Red \n\t2) Blue \n\t3) Green ');
               fprintf('\n\t4) Black (default) \n\t5) Yellow ');
               t = input('\n>> ');
               if isempty( t )
                t = 4;
               end
               yy = input('\nHow wide do you want the spanning lines to be [0.1, 4.0]? (Default 0.5): ');
               if(( isempty(yy) )||( yy < 0 )||( yy > 4.0 ))
                 yy = 0.5;
               end
               switch t
                case 1
                    t = 'r';
                case 2
                    t = 'b';
                case 3
                    t = 'g';
                case 4
                    t = 'k';
                case 5
                    t = 'y';
                otherwise
                    t = 'b';
               end
               sphere_voronoi_display(n,c,w,a,s,x,q,z,y,spLnQt,t,yy);
            end
        end

    end % else we already called _dispaly, so were done.
end
