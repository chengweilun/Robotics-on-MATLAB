clc;
clear;
%���ݱ�׼D-H����������е��link([Alpha A theta d],'standard')
L1 = link([1/2*pi 4 0 0],'standard');
L2 = link([1/2*pi 3 0 0],'standard');
L3 = link([0 2 0 0],'standard');
bot=robot({L1 L2 L3},'bot');
drivebot(bot)
%qzΪ��е�۵ĳ�ʼ�ؽڽ�
qz=[0 0 0];
%qrΪ��е��Ŀ��ؽڽ�
qr=[1/3*pi 1/3*pi 1/2*pi];
%��ʱ����У��滮��е���˶�·��
t=0:0.009:1;
[q,qd,qdd]=jtraj(qz,qr,t);  %qΪת���ĽǶȣ�qdΪ��е���ٶȣ�qddΪ���ٶ�
figure()
subplot(3,1,1);plot(q);xlabel('Time');ylabel('q');
subplot(3,1,2);plot(qd);xlabel('Time');ylabel('qd');
subplot(3,1,3);plot(qdd);xlabel('Time');ylabel('qdd');
T=fkine(bot,qr)   %ǰ���˶�ѧ����任����
qi=ikine(bot,T)   %���˶�ѧ���ÿ���ؽڽ�ת�ĽǶ�
%�����е��ĩ�˹켣
m=fkine(bot,q);
for i=1:1:length(t)
    n=m(:,:,i);
    x(1,i)=n(1,4); 
    y(1,i)=n(2,4);
    z(1,i)=n(3,4);
end
%����ĩ�˹켣ɢ��ͼ
figure()
scatter3(x,y,z);xlabel('X');ylabel('Y');zlabel('Z');
%����ĩ�˹켣������άͼ
figure()
boxplot3(n(1,4)-0.15,n(2,4)-0.15,n(3,4)-0.15,0.3,0.3,0.3);axis equal;
hold on
plot3(x,y,z);xlabel('X');ylabel('Y');zlabel('Z');
grid on;
%���ƻ�е���˶�ѭ����ͼ
plot(bot,q,'loop');
