function mainFunc
hFigure= figure;
[x,y]=meshgrid(linspace(-15,15));%�趨xy��Χ
 z=sin((x.^2+y.^2).^0.5)./((x.^2+y.^2).^0.5);
surf(x,y,z);%�˴���ͼ
hCursor= datacursormode(hFigure)
set(hCursor,'UpdateFcn',@myFunc)


