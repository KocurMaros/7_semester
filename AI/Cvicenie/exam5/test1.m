function test1()
exam5_1;
% clear
% clc
% close all
% tic

% Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
% Delta=Space(2,:)/100;   
% 
% set_param('exam3','FastRestart','on')
% a = 1;
% b = 0;
% c = 0.01;
% 
% Pop1=genrpop(lpop,Space);
% evolutions1=zeros(1,numgen);
% Fit1 = zeros(numgen,lpop);
% for gen1=1:numgen
%     for i=1:lpop
%         P = Pop1(i,1);
%         I = Pop1(i,2);
%         D = Pop1(i,3);
%         try
%             out=sim("exam3");
%             % Fit(gen,i) = sum(abs(out.e.Data));
%             Fit1(gen1,i) = sum(abs(out.e.Data)+a*abs(out.de.Data)+b*abs(out.u.Data)+c*abs(out.du.Data)); 
% 
%             lower_index = find(out.e.Time == 1);
%             upper_index = find(out.e.Time == 6);
%             trash = decide_if_value_in_interval_is_less_than_input_value(out.y.Data, out.w.Data, lower_index, upper_index);
%             if(sum(trash == 1) < sum(trash == 0))
%                 Fit1(gen1,i) = 100000;
%             else
%                 Fit1(gen1,i) = sum(abs(out.e.Data));
%             end
%         catch
%             Fit1(gen1,i) = 100000;
%         end
%     end
%     evolutions1(gen1)=min(Fit1(gen1,:));	% convergence graph of the solution
%     % GA
%     Best1=selbest(Pop1,Fit1(gen1,:),[1,1,1,1,1]);
%     Old1=selrand(Pop1,Fit1(gen1,:),5);
%     Work1 = selsus(Pop1,Fit1(gen1,:),20);
%     Work2 = selsus(Pop1,Fit1(gen1,:),20);
%     Work1=crossov(Work1,1,0);
%     Work2=mutx(Work2,0.1,Space);
%     Work2=muta(Work2,0.15,Delta,Space);
%     Pop1=[Best1;Old1;Work1;Work2];
% end
%  % Best solution
% % figure(1);
% % plot(evolutions1);
% % xlabel('generation');
% % ylabel('fitness');
% % hold on 
% % figure(2)
% % hold on
% % plot(out.y)
% % figure(3)
% % hold on
% % plot(out.u)
% save("exam5/overenie/1.mat");
% % toc
end

