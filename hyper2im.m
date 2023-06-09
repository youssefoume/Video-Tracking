function imout=hyper2im(im,bands)
[m,n,p]=size(im);
if p==1
    im=double(im(:))';
    mu=mean(im);
    sigma=std(im);
    im=(im-mu)./(sigma+eps(im-mu));
    im=im*0.3;
    im=im+0.5;
    im=max(im,0);
    im=min(im,1);
    imout=reshape(im,[m,n]);
    imout=im2uint8(imout);
else
    if (nargin<2)
        bands=[1,round(p/2),p];
    end
    imout=zeros(m,n,3,'uint8');
    imout(:,:,1)=hyper2im(im(:,:,bands(1)));
    imout(:,:,2)=hyper2im(im(:,:,bands(2)));
    imout(:,:,3)=hyper2im(im(:,:,bands(3)));
end
