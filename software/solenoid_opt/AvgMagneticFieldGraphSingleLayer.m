function AvgMagneticFieldGraphSingleLayer(capV0, capC, capESR)
%Determine the most effective wire gauge for a solenoid given the other
%conditions

%constants
wireDiameters = [0.00290576581153162,0.00258826517653035,0.00230378460756922,0.00205232410464821,0.00182880365760732,0.00162814325628651,0.00145034290068580,0.00129032258064516,0.00115062230124460,0.00102362204724409,0.000911861823723648,0.000812801625603251,0.000723901447802896,0.000645161290322581,0.000574041148082296,0.000510541021082042,0.000454660909321819,0.000403860807721616,0.000360680721361443,0.000320040640081280,0.000287020574041148,0.000254000508001016,0.000226060452120904,0.000203200406400813,0.000180340360680721,0.000160020320040640,0.000142240284480569,0.000127000254000508,0.000114300228600457,0.000101600203200406,8.89001778003556e-05,7.87401574803150e-05];
wireGauges = 9:1:40;
mu = 4*pi*(10^-7);
coilLen = .0489;
coilDia = 9.52e-3;
rho = 1.68e-8;
pulseTime = 10e-3;

%calculate average for each gauge
avgFields = [];
for wireDia = wireDiameters
    N = coilLen/wireDia;
    coilR = capESR + (rho*sqrt(coilLen^2 + (pi*(coilDia + wireDia/2)*N))) / ((wireDia/2)^2 * pi);
    timeConst = coilR*capC;
    
    avg = (mu*N)/(pulseTime*coilLen)*(capV0/coilR*(timeConst*(1-exp(-pulseTime/timeConst))));
    avgFields = [avgFields avg];
end

%plot results
[~, idx] = max(avgFields);
fprintf('The highest avg field is %d T with %d gauge wire.\n', avgFields(idx), wireGauges(idx));

plot(wireGauges, avgFields, 'r*:');
titleText = sprintf('%d F at %d V, %d gauge gives %d T.', capC, capV0, wireGauges(idx), avgFields(idx));
title(titleText);
end

