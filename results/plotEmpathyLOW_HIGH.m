scale = load("..\extract_data\rating.mat").scale;

%% Window scale

scaleD = scale(1:2:end);
L = length(scaleD);
Num = 8; % Window Length

scaleW = zeros(L-Num+1,1);

for i = 1:L-Num+1
    window = scaleD(i:i+Num-1);
    average = sum(window,1)/Num;
    scaleW(i) = average;
end

%% Plot

figure()
patch([73.5 80.5 80.5 73.5], [-3 -3,5 5], [0.6 0.6 0.8])
patch([242.5 249.5 249.5 242.5], [-3 -3,5 5], [0.8 0.6 0.6])
hold on
xline(73, '--b', LineWidth=1.5);
xline(81, '--b', LineWidth=1.5);
xline(242, '--r', LineWidth=1.5);
xline(250, '--r', LineWidth=1.5);
plot(1:length(scaleW),(scaleW-(sum(scaleW)/length(scaleW)))/(sqrt(var(scaleW))),'black',LineWidth=2.0)
hold off
text(60,4,'LOW','FontSize',12,FontWeight='bold');
text(225,4,'HIGH','FontSize',12,FontWeight='bold');
xlabel('Time (s)')
ylabel('BOLD')
ylim([-3,5])