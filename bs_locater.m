%% Social choice function to locate base station in a region
%%16uec069%%
%%Pankhuri Vanjani%%
clc;
close all;

%% base-station-locator-matrix initialization
bs_data = zeros(100,3);
bsdata = 0;

%% initialization for plotting hexagonal cells in an area in which base stations will be allocated:
hold on
C11={};
C={};
ab=1;
ik=1;

%% Dividing the region into 100 hexagonal cells.
%%Since 100 base stations are to be installed in the region it is divided
%%into 100 hexgonal cells. Each cell will have 5 alternatives among which 1
%%will be selected as a base station. The selection will be done on the
%%basis of a component of social theory namely, 'Public Voting'
for x=1:10
      ik=x;
  for y=1:10  
      if(mod(ik,2))
          x0=3+4.3*x;
          y0=3+3*2*y;
          hexagon(2,x0,y0);
          
%% Generation of 5 alternative locations in a cell            
          C11{x+1,y+1}=[x0;y0];
              hold on
              plot(x0,y0,'.','MarkerFaceColor','k','MarkerSize',7)
               x00 = x0 + 0.8;
               y00 = y0 + 0.8;
               hold on
              plot(x00,y00,'.','MarkerFaceColor','k','MarkerSize',7)
               x01 = x0 - 0.8;
               y01 = y0 + 0.8;
               hold on
              plot(x01,y01,'.','MarkerFaceColor','k','MarkerSize',7)
               x02 = x0 + 0.8;
               y02 = y0 - 0.8;
               hold on
              plot(x02,y02,'.','MarkerFaceColor','k','MarkerSize',7)
               x03 = x0 - 0.8;
               y03 = y0 - 0.8;
               hold on
              plot(x03,y03,'.','MarkerFaceColor','k','MarkerSize',7) 

%% Generation of 10k voters for each cell%%%
%%Since the population of the region is given to be 10 lakhs
%%For simplicity in computation 10 lakh people are evenly distributed in
%%100 cells, each cell having 10,000 people residing in it

%% Generation of random ranking for 5 locations by 10,000 users in the
%%region. 
              a = zeros(10000,5);    
              for i = 1:10000
                  a(i,:) = randperm(5);
              end
              
%% After ranking has been generated for 5 option locations, 
%%according to the given rule from social theory weights have been assigned 
%%to the ranking provided
              for p = 1:10000
                 for k = 1:5
                     if a(p,k) == 1
                         a(p,k) = 10;
                     elseif a(p,k) == 2
                         a(p,k) = 5;
                     elseif a(p,k) == 3
                         a(p,k) = 4;
                     elseif a(p,k) == 4
                         a(p,k) = 3;
                     elseif a(p,k) == 5
                         a(p,k) = 1;
                     end
                 end
              end
              
%% Weighted votes matrix
           weighted_votes = a; 
           total_votes_weighted = sum(weighted_votes);
           
%% Total votes received by each alternative          
           votes_a = total_votes_weighted(1,1);
           votes_b = total_votes_weighted(1,2);
           votes_c = total_votes_weighted(1,3);
           votes_d = total_votes_weighted(1,4);
           votes_e = total_votes_weighted(1,5);
           
%% Taking out the base station with it's index receiving the maximum
%%weightage from public voting
           [highest_voted,Index_bs] = max(total_votes_weighted);
           
%% Specifying the location according to index received
           if Index_bs == 1
               selected_bs_in_cell_x = x0;
               selected_bs_in_cell_y = y0;
           elseif Index_bs == 2
               selected_bs_in_cell_x = x00;
               selected_bs_in_cell_y = y00;
           elseif Index_bs == 3
               selected_bs_in_cell_x = x01;
               selected_bs_in_cell_y = y01;
           elseif Index_bs == 4
               selected_bs_in_cell_x = x02;
               selected_bs_in_cell_y = y02;
           elseif Index_bs == 5
               selected_bs_in_cell_x = x03;
               selected_bs_in_cell_y = y03;
           end
           
%% Plotting the selected base station in the cell           
      plot(selected_bs_in_cell_x,selected_bs_in_cell_y,'^','LineWidth',1,...
                   'MarkerEdgeColor','k',...
                   'MarkerFaceColor','y',...
                   'MarkerSize',8'); 
               
%% Compiling data for an excel sheet to contain location information of all 
%%selected base stations in the cell in the region
           bsdata = bsdata +1;
           bs_data (bsdata,:) = [bsdata,selected_bs_in_cell_x ,selected_bs_in_cell_y];
              
           cote=2;
           x1=cote*sqrt(2)*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
           y1=cote*sqrt(9)*[0 -0.5 -0.5 0 0.5 0.5 0]+y0;
                      
      else
           x0=3+4.3*x;
           y0=3*2*y;
           hexagon(2,x0,y0);
           C11{x+1,y+1}=[3+4.3*x;3*2*y];
           
%% Generation of 5 alternative locations in a cell                       
           hold on
           plot(3+4.3*x,3*2*y,'.', 'MarkerFaceColor','k','MarkerSize',7)
           x00 = x0 + 0.8;
           y00 = y0 + 0.8;
           hold on
          plot(x00,y00,'.','MarkerFaceColor','k','MarkerSize',7)
           x01 = x0 - 0.8;
           y01 = y0 + 0.8;
           hold on
          plot(x01,y01,'.','MarkerFaceColor','k','MarkerSize',7)
           x02 = x0 + 0.8;
           y02 = y0 - 0.8;
           hold on
          plot(x02,y02,'.','MarkerFaceColor','k','MarkerSize',7)
           x03 = x0 - 0.8;
           y03 = y0 - 0.8;
           hold on
          plot(x03,y03,'.','MarkerFaceColor','k','MarkerSize',7) 
          
%% Generation of 10k voters for each cell%%%
%%Since the population of the region is given to be 10 lakhs
%%For simplicity in computation 10 lakh people are evenly distributed in
%%100 cells, each cell having 10,000 people residing in it

%% Generation of random ranking for 5 locations by 10,000 users in the
%%region.
          a = zeros(10000,5);    
            for i = 1:10000
                  a(i,:) = randperm(5);
                  i = i+ 1;
            end
            
%% After ranking has been generated for 5 option locations, 
%%according to the given rule from social theory weights have been assigned 
%%to the ranking provided    
            
            for p = 1:10000
                for k = 1:5
                    if a(p,k) == 1
                        a(p,k) = 10;
                    elseif a(p,k) == 2
                        a(p,k) = 5;
                    elseif a(p,k) == 3
                        a(p,k) = 4;
                    elseif a(p,k) == 4
                        a(p,k) = 3;
                    elseif a(p,k) == 5
                        a(p,k) = 1;
                    end
                end
                
            end
            
%% Weighted votes matrix            
           weighted_votes = a; 
           total_votes_weighted = sum(weighted_votes);
           
%% Total votes received by each alternative          
           votes_a = total_votes_weighted(1,1);
           votes_b = total_votes_weighted(1,2);
           votes_c = total_votes_weighted(1,3);
           votes_d = total_votes_weighted(1,4);
           votes_e = total_votes_weighted(1,5);
           [highest_voted,Index_bs] = max(total_votes_weighted);
           
%% Specifying the location according to index received
           if Index_bs == 1
               selected_bs_in_cell_x = x0;
               selected_bs_in_cell_y = y0;
           elseif Index_bs == 2
               selected_bs_in_cell_x = x00;
               selected_bs_in_cell_y = y00;
           elseif Index_bs == 3
               selected_bs_in_cell_x = x01;
               selected_bs_in_cell_y = y01;
           elseif Index_bs == 4
               selected_bs_in_cell_x = x02;
               selected_bs_in_cell_y = y02;
           elseif Index_bs == 5
               selected_bs_in_cell_x = x03;
               selected_bs_in_cell_y = y03;
           end
           
%% Plotting the selected base station in the cell           
      plot(selected_bs_in_cell_x,selected_bs_in_cell_y,'^','LineWidth',1,...
                    'MarkerEdgeColor','k',...
                    'MarkerFaceColor','y',...
                    'MarkerSize',8');   
      xlabel('X in km');
      ylabel('Y in km');
      title('Location of base station in each cell for a given region');
      legend('cell boundary','alternative 1','alternative 2','alternative 3','alternative 4','alternative 5','Selected base station');
          
%% Compiling data for an excel sheet to contain location information of all 
%%selected base stations in the cell in the region                
           bsdata = bsdata +1;
           bs_data (bsdata,:) = [bsdata,selected_bs_in_cell_x ,selected_bs_in_cell_y];
                    
           cote=2;
           x1=cote*sqrt(2)*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
           y1=cote*sqrt(9)*[0 -0.5 -0.5 0 0.5 0.5 0]+y0;              
      end  
       C{ab}=[x0,y0];
       ab=ab+1;
      end
    end

%% Writing off the data into tabular form to get into csv sheet
T = array2table(bs_data);
T.Properties.VariableNames(1:3) = {'Cell Number containing base station','x-coordinate','y-coordinate'};
writetable(T,'base-station_location.csv');

%% %%%%%%%%%%%%%%Functions used the prorgram%%%%%%%%%%%%%%%%%%%% %%
%%Generates hexagonal cells for the given region
function hexagon(cote,x0,y0)
   x=cote*sqrt(2)*[-1 -0.5 0.5 1 0.5 -0.5 -1]+x0;
   y=cote*sqrt(9)*[0 -0.5 -0.5 0 0.5 0.5 0]+y0;
   plot(x,y,'--r','Linewidth',2);grid;
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%END%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
