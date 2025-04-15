function [retval1, retval2] = div_t(V,R1,R2)
	retval1 = V*R1/(R1+R2)
	retval2 = V*R2/(R1+R2)
end