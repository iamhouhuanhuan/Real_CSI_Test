%Smoothing the data ,window size is 5.
y=zeros(1050,360);
for i=1:360
    for j=6:105
        y(j-5,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=111:210
        y(j-10,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=216:315
        y(j-15,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=321:420
        y(j-20,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=426:525
        y(j-25,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=531:630
        y(j-30,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=636:735
        y(j-35,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=741:840
        y(j-40,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=846:945
        y(j-45,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
    for j=951:1050
        y(j-50,i)=(5*x(j,i)+4*x(j-1,i)+3*x(j-2,i)+2*x(j-3,i)+x(j-4,i))/15;
    end
end
    