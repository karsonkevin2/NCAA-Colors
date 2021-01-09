close all

%0.2989, 0.5870, 0.1140

A = aPrimary;
A = aSecondary;
A = [aPrimary ; aSecondary];

B = [aPrimary , aSecondary];
[a,b] = kmeans(B,50);
b = round(b);
bcount = zeros(size(b,1),1);
for i=1:length(a)
    bcount(a(i)) = bcount(a(i)) + 1;
end

Ak = A/255;
Ak = [Ak(:,1)*0.2989,Ak(:,2)*0.5870,Ak(:,3)*0.1140];
[idxk, Ck] = kmeans(Ak,27);
Ck = [Ck(:,1)/0.2989,Ck(:,2)/0.5870,Ck(:,3)/0.1140];
idxCk = zeros(length(idxk),3);
for i=1:length(idxk)
    idxCk(i,:) = Ck(idxk(i),:);
end
scatter3(A(:,1),A(:,2),A(:,3),5,idxCk)
hold on
scatter3(Ck(:,1)*255,Ck(:,2)*255,Ck(:,3)*255,50,Ck,'filled')
xlabel('Red')
ylabel('Green')
zlabel('Blue')
xlim([0,255])
ylim([0,255])
zlim([0,255])
set(gcf, 'color', [1 1 1])
set(gca, 'color', [1 1 1])

%Copy data to A
[idx, C] = kmeans(A,27);
%%%%%
Cv2 = rescale(C);

idxC = zeros(length(idx),3);
for i=1:length(idx)
    idxC(i,:) = Cv2(idx(i),:);
end

figure
scatter3(A(:,1),A(:,2),A(:,3),5,idxC)
hold on
scatter3(C(:,1),C(:,2),C(:,3),50,Cv2,'filled')

xlabel('Red')
ylabel('Green')
zlabel('Blue')

xlim([0,255])
ylim([0,255])
zlim([0,255])

set(gcf, 'color', [1 1 1])
set(gca, 'color', [1 1 1])

figure
histogram(idx)
hist = zeros(1,size(C,1));
for i=1:length(idx)
    hist(idx(i)) = hist(idx(i)) + 1;
end
figure
p = pie(hist);
for i=1:length(hist)
    p(1 + (i-1)*2).FaceColor = Cv2(i,:);
end



%%%%%
bin=3;
%%%%%
idxC2 = zeros(length(idx),3);
for i=1:length(A)
    idxC2(i,:) = round(A(i,:)/255*(bin-1)) / (bin-1);
end

C2 = zeros(bin^3,3);
index=1;
for x=0:bin-1
    for y=0:bin-1
        for z=0:bin-1
            C2(index,:) = [x/(bin-1),y/(bin-1),z/(bin-1)];
            index = index + 1;
        end
    end
end
   



figure
scatter3(A(:,1),A(:,2),A(:,3),5,idxC2)
hold on
scatter3(C2(:,1)*255,C2(:,2)*255,C2(:,3)*255,50,C2,'filled')

xlabel('Red')
ylabel('Green')
zlabel('Blue')

xlim([0,255])
ylim([0,255])
zlim([0,255])

set(gcf, 'color', [1 1 1])
set(gca, 'color', [1 1 1])


%%%%%
figure
scatter3(A(:,1),A(:,2),A(:,3),5,rescale(A))

xlabel('Red')
ylabel('Green')
zlabel('Blue')

xlim([0,255])
ylim([0,255])
zlim([0,255])

set(gcf, 'color', [1 1 1])
set(gca, 'color', [1 1 1])

%%%%
aPrimary
aSecondary

diff = zeros(size(aPrimary,1),1);
for i=1:size(aPrimary,1)
    dDiff = 10000;
    for j=1:size(aPrimary,1)
        if j==i
        else
            r = (aPrimary(i,1) + aPrimary(j,1)) / 2;
            dD = aPrimary(i,:) - aPrimary(j,:);
            dR = dD(1);
            dG = dD(2);
            dB = dD(3);
            dC1 = ((2+r/256)*dR^2 + 4*dG^2 + (2+(255-r)/256)*dB^2)^0.5;
            
            r = (aSecondary(i,1) + aSecondary(j,1)) / 2;
            dD = aSecondary(i,:) - aSecondary(j,:);
            dR = dD(1);
            dG = dD(2);
            dB = dD(3);
            dC2 = ((2+r/256)*dR^2 + 4*dG^2 + (2+(255-r)/256)*dB^2)^0.5;
            
            dC3 = (dC1^2 + dC2^2)^0.5;
            if dC3 < dDiff
                dDiff = (dC1^2 + dC2^2)^0.5;
            end
            
            r = (aPrimary(i,1) + aSecondary(j,1)) / 2;
            dD = aPrimary(i,:) - aSecondary(j,:);
            dR = dD(1);
            dG = dD(2);
            dB = dD(3);
            dC1 = ((2+r/256)*dR^2 + 4*dG^2 + (2+(255-r)/256)*dB^2)^0.5;
            
            r = (aSecondary(i,1) + aPrimary(j,1)) / 2;
            dD = aSecondary(i,:) - aPrimary(j,:);
            dR = dD(1);
            dG = dD(2);
            dB = dD(3);
            dC2 = ((2+r/256)*dR^2 + 4*dG^2 + (2+(255-r)/256)*dB^2)^0.5;
            
            dC3 = (dC1^2 + dC2^2)^0.5;
            if dC3 < dDiff
                dDiff = (dC1^2 + dC2^2)^0.5;
            end
            
        end
    end
    diff(i) = dDiff;
end


