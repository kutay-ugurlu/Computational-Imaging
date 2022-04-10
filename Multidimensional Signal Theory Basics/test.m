
% v1 = [1/4 1/6];
% v2 = [-1/4 1/6];
v1 = [0.5 sqrt(3)/6];
v2 = [0 1/sqrt(3)];
container = [];
upper = 1;
lower = 0;
grid_length = 6;
for i = -grid_length:grid_length
    for j = -grid_length:grid_length
        vec = round(i*v1 + j*v2,3);
        container = [container; vec];
        if lower<=vec(1) && vec(1)<=upper && lower<=vec(2) && vec(2)<=upper
            scatter(vec(1),vec(2),'red')
        elseif lower<=vec(1) && vec(1)<=upper && lower+1<=vec(2) && vec(2)<=upper+1
            scatter(vec(1),vec(2),'blue')
        elseif lower+1<=vec(1) && vec(1)<=upper+1 && lower<=vec(2) && vec(2)<=upper
            scatter(vec(1),vec(2),'green')
        else
            scatter(vec(1),vec(2),'black')
        end
        hold on 
    end
    rectangle('Position',[lower,lower,1,1])
    hold on 
    rectangle('Position',[lower,lower+1,1,1])
    hold on 
    rectangle('Position',[lower+1,lower,1,1])
    grid on 
end

container1 = container(lower<=container(:,1) & container(:,1)<=upper & lower<=container(:,2) & container(:,2)<=upper,:);
samples_per_sq_meter = size(container1,1);
container2 = container(lower<=container(:,1) & container(:,1)<=upper & lower+1<=container(:,2) & container(:,2)<=upper+1,:);
samples_per_sq_meter_two = size(container2,1);
container3 = container(lower+1<=container(:,1) & container(:,1)<=upper+1 & lower<=container(:,2) & container(:,2)<=upper,:);
samples_per_sq_meter_three = size(container3,1);

title({['Samples per square meter: \color{red}',num2str(samples_per_sq_meter)], ...
    ['\color{black} Samples per square meter: \color{blue}',num2str(samples_per_sq_meter_two)], ...
    ['\color{black} Samples per square meter: \color{green}',num2str(samples_per_sq_meter_three)]})