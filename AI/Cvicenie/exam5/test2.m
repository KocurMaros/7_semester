function test2()
exam5_2;

% Space=[ones(1,lstring)*(0); ones(1,lstring)*pid_space];
% Delta=Space(2,:)/100;   
% % Space(2,4) = 10;
% % Space(2,4) = 5;
% % Space(2,4) = 5;
% set_param('exam3_2','FastRestart','on')
% a = 1;
% b = 0;
% c = 0.01;
% 
% Pop2=genrpop(lpop,Space);
% evolutions2=zeros(1,numgen);
% Fit2 = zeros(numgen,lpop);
% sig = 0:sim_step:20;
% time_x = 0:sim_step:20;
% first_step = find(sig == 1);
% second_step = find(sig == 5);
% 
% sig(1:first_step) = 0;
% sig(first_step:second_step) = 3;
% sig(second_step:end) = 1;
% for gen2=1:numgen
%     for i2=1:lpop
%         P2 = Pop2(i2,1);
%         I2 = Pop2(i2,2);
%         D2 = Pop2(i2,3);
%         % a = Pop(i,4);
%         % b = Pop(i,5);
%         % c = Pop(i,6);
%         try
%             out2=sim("exam3_2");
%             Fit2(gen2,i2) = sum(abs(out2.e.Data)+a*abs(out2.de.Data)+b*abs(out2.u.Data)+c*abs(out2.du.Data)); 
%             if(max(out2.y.Data(first_step:second_step)) > 3)
%                 Fit2(gen2,i2) = 10000;
%             end
%             if(min(out2.y.Data(second_step:end)) < 1)
%                 Fit2(gen2,i2) = 10000;
%             end
%             % [y,e,de,dde,u,du] = skematika(sig,P,I,D);
%             % Fit(gen,i) = sum(abs(out.e.Data));
%             % Fit(gen,i) = sum(abs(e)+a*abs(de)+b*abs(u)+c*abs(du)); 
% 
%             % lower_index = find(out.e.Time == 1);
%             % upper_index = find(out.e.Time == 6);
%             % trash = decide_if_value_in_interval_is_less_than_input_value(out.y.Data, out.w.Data, lower_index, upper_index);
%             % if(sum(trash == 1) < sum(trash == 0))
%             %     Fit(gen,i) = 100000;
%             % else
%             %     Fit(gen,i) = sum(abs(out.e.Data));
%             % end
%         catch
%             Fit2(gen2,i2) = 100000;
%         end
%     end
%     evolutions2(gen2)=min(Fit2(gen2,:));	% convergence graph of the solution
%     % GA
%     Best2=selbest(Pop2,Fit2(gen2,:),[1,1,1]);
%     Old2=selrand(Pop2,Fit2(gen2,:),5);
%     Work12 = selsus(Pop2,Fit2(gen2,:),21);
%     Work22 = selsus(Pop2,Fit2(gen2,:),21);
%     Work12=crossov(Work12,1,0);
%     Work22=mutx(Work22,0.1,Space);
%     Work22=muta(Work22,0.15,Delta,Space);
%     Pop2=[Best2;Old2;Work12;Work22];
% end
% save("exam5/overenie/2.mat");
% % toc
end

