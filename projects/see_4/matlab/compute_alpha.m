function [alpha_1,alpha_2]=compute_alpha(v,w,sigma)

i_N = length(v);
j_N = length(w);

sigma_k = 1;
term_1 = 0.0;
term_2 = 0.0;
term_3 = 0.0;
term_4 = 0.0;
term_5 = 0.0;

%compute terms for the alpha equations
for i=1:i_N
    for j=1:j_N
        term_1 = term_1 + sigma(sigma_k)*w(j);
        term_2 = term_2 + v(i)*w(j);
        term_3 = term_3 + w(j)*w(j);
        term_4 = term_4 + sigma(sigma_k)*v(i);
        term_5 = term_5 + v(i)*v(i);
    end
    sigma_k = sigma_k + 1;
end

alpha_1 = (term_1*term_2 - term_3*term_4)/(term_2*term_2 - term_3*term_5);

alpha_2 = (term_4*term_2 - term_1*term_5)/(term_2*term_2 - term_3);