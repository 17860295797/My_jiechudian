clc;
clear;

data1 = load('suijiwucha.txt');
data2 = load('suijiwucha1.txt');

z1 = data1(:, 3);
z2 = data2(:, 3);

% 计算 data1 第三列的平均值
ave = mean(z1);  % 计算第三列的平均值
disp(ave);  % 显示平均值

% 对 z1 中的每一个值减去平均值
delta = z1 - ave;

% 调整 z2 中的对应值
for i = 1:length(z1)
    if delta(i) > 0
        z2(i) = z2(i) - delta(i);  % 如果 delta 大于 0，减去这个值
    else
        z2(i) = z2(i) + abs(delta(i));  % 如果 delta 小于 0，加上这个值
    end
end

% 找到 z2 中三个最小值及其索引
[~, idx] = sort(z2);  % 对 z2 进行排序
min_indices = idx(1:3);  % 取出最小值的索引

% 提取对应的 xyz 坐标
min_xyz_coordinates = data2(min_indices, :);

% 显示最小值对应的 xyz 坐标
disp('三个最小值对应的xyz坐标:');
disp(min_xyz_coordinates);

% 绘制调整后的折线图
figure;
plot(z1, '-o', 'DisplayName', 'File 1 Third Column'); % 使用'-o'表示带圆点的折线
hold on;
plot(z2, '-x', 'DisplayName', 'File 2 Adjusted Third Column'); % 使用'-x'表示带叉号的折线
hold off;
ax = gca;

ax.YLim = [0 0.005];  % 根据你的数据调整Y轴范围
ax.XLim = [0 1];  % 根据你的数据调整X轴范围

xlabel('Index');
ylabel('111');
title('222');
legend show;
grid on;

% 绘制三个最小值的 xy 坐标点
figure;
plot(min_xyz_coordinates(:, 1), min_xyz_coordinates(:, 2), 'ro', 'MarkerSize', 10, 'DisplayName', 'Min Points');
axis([0 1 0 1]);  % 将图像设置为1x1大小
xlabel('X');
ylabel('Y');
title('XY Plot of Three Minimum Points');
legend show;
grid on;