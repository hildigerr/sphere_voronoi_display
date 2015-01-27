function voronoi_wrapper(mdv,dst,a,b,c,d)
%sphere_voronoi_display(15,'r',2.0,0.4,'-yo',1.0,0.5,'b',1.0,2,'b',0.5,'cmdline.bob');
%sphere_voronoi_display(a,b,2.0,0.4,'-yo',1.0,c,'b',1.0,d,'b',0.5,'cmdline.bob');

mdv = strcat(mdv,'/pack.3.', a, '.txt')%'/var/www/cgi-bin/sphere_voronoi_display/mdv'
raw_data = importdata( mdv );
dst = strcat(dst,'/cmdline.bob')%'/var/www/img/cmdline.bob'
a = str2num(a);
c = str2double(c);
d = str2double(d);
sphere_voronoi_web(a,b,2.0,0.4,'-yo',1.0,c,'b',1.0,d,'b',0.5,dst, reshape( raw_data, 3, a ));
