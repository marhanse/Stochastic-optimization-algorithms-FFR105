function value3 = Division(value1,value2)
    cMax = 10^9;
    if value2 == 0
        value2 = cMax;
        value3 = value1/value2;
    else
        value3 = value1/value2;
    end
end