function [retval1, retval2] = div_c(I,R1,R2)
	retval1 = I*R2/(R1+R2)
	retval2 = I*R1/(R1+R2)
end