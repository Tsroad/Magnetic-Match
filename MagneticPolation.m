%%  Indoor Geomagnetic Matching Model
% @file "TestInterpolation.m"
% @authors Keung Charteris & T.s.road CZQ
% @version 1.0 ($Revision$)
% @date 16/5/2016 $LastChangedDate$
% @addr. GUET, Gui Lin, 540001,  P.R.China
% @contact : cztsiang@gmail.com &  t.s.road@bk.ru
% @references : UKF在MagSLAM模型中的应用-tsroad-20151010
% @date Copyright(c)  2016-2020,  All rights reserved.
% This is an open access code distributed under the Creative Commons Attribution License, which permits 
% unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited. 

function UnknownPosition=MagneticPolation(ReferencePosition,ReferenceMagnetics,KnownMagnetic)
%   MAGNETICPOLATION Polation Geomagnetic Position.
%   MagneticPolation(ReferencePosition,ReferenceMagnetics,KnownMagnetic) reads data from
%   ReferencePosition--------------------------Polation position Points
%   ReferenceMagnetics-----------------------Polation points Magnetics
%   KnownMagnetic----------------------------Unknown position Magnetic
%   Optionally, returns a unknown position.


UnknownPosition=[];         
%%  09/11/2015 21:30 am Modified by T.s.road CZQ
fun1109=@(x)[     ((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(1,1)-KnownMagnetic(1))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(1,2)-KnownMagnetic(1))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(1,3)-KnownMagnetic(1))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*(ReferenceMagnetics(1,4)-KnownMagnetic(1));...
                                ((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(2,1)-KnownMagnetic(2))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(2,2)-KnownMagnetic(2))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(4,1))^2+(x(2)-ReferencePosition(4,2))^2)*(ReferenceMagnetics(2,3)-KnownMagnetic(2))+...
                                ((x(1)-ReferencePosition(1,1))^2+(x(2)-ReferencePosition(1,2))^2)*((x(1)-ReferencePosition(2,1))^2+(x(2)-ReferencePosition(2,2))^2)*((x(1)-ReferencePosition(3,1))^2+(x(2)-ReferencePosition(3,2))^2)*(ReferenceMagnetics(2,4)-KnownMagnetic(2))];
                                
               
TempUnknownPosition=lsqnonlin(fun1109,[4.5;18.5]);   % solve the equartion
UnknownPosition(1)=TempUnknownPosition(1);
UnknownPosition(2)=TempUnknownPosition(2);




