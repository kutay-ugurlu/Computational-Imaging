function y = gauss2d( Nx, Ny, mu_x, mu_y, sigma_2_x, sigma_2_y )
y = zeros( Ny, Nx );
for ll=1:Ny
  for kk=1:Nx
    y( ll, kk ) = gauss( ll - ( Ny + 1 )/2, mu_y, sigma_2_y ) * ...
                gauss( kk - ( Nx + 1 )/2, mu_x, sigma_2_x );
  end
end