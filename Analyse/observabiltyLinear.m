Obs_matrix=obsv(A,C);
disp('Rank of observable matrix of theta and x: ')
disp(rank(Obs_matrix))

if rank(Obs_matrix)==4
    disp('observable')
else
    disp('non observable')
end
disp(' ')

C_theta=[1 0 0 0];
Obs_matrix=obsv(A,C_theta);
disp('Rank of observable matrix of theta: ')
disp(rank(Obs_matrix))

if rank(Obs_matrix)==4
    disp('observable')
else
    disp('non observable')
end
disp(' ')

C_x=[0 0 1 0];
Obs_matrix=obsv(A,C_x);
disp('Rank of observable matrix of x: ')
disp(rank(Obs_matrix))

if rank(Obs_matrix)==4
    disp('observable')
else
    disp('non observable')
end
disp(' ')

C_dtheta=[0 1 0 0];
Obs_matrix=obsv(A,C_dtheta);
disp('Rank of observable matrix of dtheta: ')
disp(rank(Obs_matrix))

if rank(Obs_matrix)==4
    disp('observable')
else
    disp('non observable')
end
disp(' ')

C_dx=[0 0 0 1];
Obs_matrix=obsv(A,C_dx);
disp('Rank of observable matrix of dx: ')
disp(rank(Obs_matrix))

if rank(Obs_matrix)==4
    disp('observable')
else
    disp('non observable')
end
disp(' ')