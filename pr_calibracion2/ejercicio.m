clear;
load calib;
load track;
ruta = [ruta;ruta(1,:).^0];
Mi=calibra(utm_ctrl,pix_ctrl)
res = Mi*ruta;
im=imread('mapa.jpg');
image(im);hold on;
plot(res(1,:),res(2,:),'b:');hold off;