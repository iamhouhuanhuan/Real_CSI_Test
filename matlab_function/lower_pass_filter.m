%µÍÍ¨ÂË²¨30¸ö×ÓÔØ²¨
load lower_pass2000;
for i=1:30
    a=x(1:end,i);
    b=filter(lower_pass2000,a);
    x(1:end,i)=b;
end
[COEFF,SCORE, latent]=princomp(x); 
cumulative_sum=cumsum(latent)./sum(latent);