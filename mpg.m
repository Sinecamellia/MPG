clear
clc

D = 1:20000;


mpg_E5 = 10.09;


mpg_E10 = 11.77;


R1_initial = 1.4;
R2_initial = 1.4;
R1_final = 1.8;
R2_final = 1.8;


deltaR1 = randn(size(D)) * 0.1; 
deltaR2 = randn(size(D)) * 0.1;


P1 = zeros(size(D));
P2 = zeros(size(D));

for i = 1:length(D)
    
    R1 = R1_initial + (R1_final - R1_initial) * (D(i) / max(D)) + deltaR1(i);
    R2 = R2_initial + (R2_final - R2_initial) * (D(i) / max(D)) + deltaR2(i);
    
    Price_diff(i) = R1-R2;

    P1(i) = (D(i) / 100) * mpg_E5 * R1;
    P2(i) = (D(i) / 100) * mpg_E10 * R2;

    Cost_Diff(i) = P1(i) - P2(i);
end


figure;
plot(D, P1, 'b-', 'LineWidth', 2, 'DisplayName', 'E5');
hold on;
plot(D, P2, 'r-', 'LineWidth', 2, 'DisplayName', 'E10');
xlabel('Distance');
ylabel('Cost');
legend;
grid on;

figure;
subplot(2,1,1)
plot(D,Price_diff,'b-','DisplayName','price_diff');
xlabel('Distance');
ylabel('Price_diff');

subplot(2,1,2)
plot(D, Cost_Diff, 'k-','DisplayName', 'Cost_diff');
xlabel('Distance');
ylabel('Cost_diff');
legend;
grid on;