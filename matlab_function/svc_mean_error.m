%¼ÆËãSVCÆ½¾ùÎó²î
c=CM;
a=train;
b=test;
sum=0;
min=1000;
max=0;
errMatrix=zeros(1000,1);
i=1;
[m,n]=size(c);
for n=1:20
    for m=1:10
        if(c(m,n)>0)
            err=sqrt(((test(m,1)-train(n,1))^2+(test(m,2)-train(n,2))^2));
            if(err<min) 
                min=err;
            end
            if(err>max) 
                max=err;
            end
            sum=sum+err*c(m,n);
            for k=1:c(m,n)
                errMatrix(i,1)=err/100;
                i=i+1;
            end
        else continue;
        end
    end
end
mean=sum/1000;
