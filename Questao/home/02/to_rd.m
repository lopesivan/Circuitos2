function [c] = to_rd(m,d)
% -- to_rd(m, d)
% Converts arrays containing the mag (m) and phase (d, in degrees) of
% a complex number to standard complex form
%
% See also: to_pd, to_p, to_r
 if nargin~=2
 error('incorrect number of arguments.');
 end
 % Two arguments: m contains magnitudes, d angles
 c = m .* exp(j*d2r(d));
end